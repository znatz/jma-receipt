#!/bin/bash
ORCADIR=/usr/local/orca
ORCALIB=/usr/local/orca/lib
HOME=/home/orca
MSTDIR=orca-$(date +%Y%m%d)
VERSIONFL=/usr/local/orca/doc/version

UPDSQL1="update tbl_dbkanri set termid='##' where kanricd='ORCADB00';"
#UPDSQL1='update tbl_dbkanri set termid='##' where kanricd='ORCADB00';'
SQLSELECT="SELECT * FROM TBL_DBKANRI WHERE KANRICD='ORCADB00';"

#デバッグ用
#APSCOBOL=/home/orca/panda-0.9.17/aps/aps
#DBSTUB=/home/orca/panda-0.9./aps/dbstub
#FTP=orca:orca@localhost/pub/orca_data/
DBHOST=localhost
UPDFILE=/home/orca/$MSTDIR/ORCADBS.OUT
TBLFILE=/home/orca/$MSTDIR/ORCADBS.TBL
LEN=100
#本番用
APSCOBOL=/usr/local/panda/bin/aps
DBSTUB=/usr/local/panda/bin/dbstub
FTP=ftp.orca.med.or.jp/pub/orca_data/
#FTP=beta:inisalo@ftp.orca.med.or.jp/pub/orca_data/

COBOLDIR=$ORCADIR/lib
function orcawget () {
	DWNFL=`echo $1 | awk '{i=split($0,arr,"/"); print arr[i]} ' `
	if [ ${DWNFL:1:10}	= "XXXXXXXXXX"	] ;	then
		return 0;
	fi
#受信ファイル削除
	if [	-e	$DWNFL	]
	then
#	echo "rm start" $DWNFL
		rm $DWNFL;
	fi
	wget -q --passive-ftp ftp://$FTP/$1
#接続確認
	if [ $? -eq 0 ]	;	then 
#	echo "wget end OK"
		return 0;
	else
		return 1;
	fi
#ファイルサイズチェック
	if [	-s	$DWNFL	]
	then
		return 0;
	else
		return 1;
	fi
}

function orcatar () {
	TARFL=`echo $1 | awk '{i=split($0,arr,"/"); print arr[i]} ' `
	TAR=`echo $TARFL | awk '{i=split($0,arr,"."); print arr[i-1] arr[i]} ' `
	LOCALFL=`echo $TARFL | awk '{i=split($0,arr,"."); print arr[1]".dat"} ' ` 
#解凍処理
	echo $1
	if [	$TAR = "targz" ]
	then
		tar zxf $TARFL
	else
		return 0;
	fi
#tar確認
	if [ $? -eq 0 ]	;	then 
		echo "tar end OK"
	else
		echo "tar end NG"
		return 1;
	fi
#ファイルサイズチェック
	if [	-s	$LOCALFL	]
	then
		return 0;
	else
		return 1;
	fi
}

#エラーファイル用フォルダ作成
if ! [	-d	$HOME/orca-mstlog	];	then 
	cd $HOME
	su - orca -c "mkdir orca-mstlog" 
fi
#整合性チェック
	VERLIST=`awk '/version/{gsub(/\t| |;/,""); print} ' $VERSIONFL`
	VERDATA=`echo $VERLIST | awk '{i=split($0,arr,"("); print arr[i]} ' `
	VERDATA1=`echo $VERDATA | awk '{gsub(/[-)]/,""); print } ' `
	VERDATA2=`echo $VERDATA | awk '{gsub(/[)]/,""); print } ' `
	echo "VERDATA1=" $VERDATA1
	echo "$SQLSELECT" > $HOME/orca-mstlog/SQLSELECT.TXT
	su - orca -c "psql -o $HOME/orca-mstlog/sql.out -f $HOME/orca-mstlog/SQLSELECT.TXT orca"  
#	su - orca -c "psql -o $HOME/orca-mstlog/sql.out -c '$SQLSELECT' orca"  
	DBLIST=`awk '/--------|row/ {skip = ! skip; next};/};/ {exit}; (skip == 1) {gsub(/\t| |;/,""); print} ' $HOME/orca-mstlog/sql.out`
	DBVERSION=`echo $DBLIST | awk '{i=split($0,arr,"|"); print arr[2]} ' `
	DBVERSION1=`echo $DBVERSION | awk '{gsub(/[-)]/,""); print } ' `
#	if [ `echo $DBVERSION1 $VERDATA1 | awk '{print($1<$2) ? "true" : "false"} '` = "true" ];	then
	if [ `echo $DBVERSION1 $VERDATA1 | awk '{print($1<=$2) ? "true" : "false"} '` = "true" ];	then
		echo "OK"
	else
		echo "ダウングレードの処理となっています。処理を中止します" >>$HOME/orca-mstlog/master_log
        	exit 99
	fi 
#整合性チェックここまで
#DB管理情報更新
        echo "update tbl_dbkanri set version=' $VERDATA2 ' where kanricd='ORCADB00';" | su - orca -c "psql orca"
echo $MSTDIR
echo $UPDFILE
if ! [	-d	$HOME/$MSTDIR	];	then 
	cd $HOME
	su - orca -c "mkdir $MSTDIR"
fi
cd $HOME/$MSTDIR
rm -f *
#センタからのDB構造体ダウンロード
if	orcawget info/ORCADBS.DAT ;	then
	echo "センタからのDBレコード管理情報のダウンロードが終了しました" >>master_log
else
	echo "センタからのDBレコード管理情報のダウンロードに失敗しました" >>master_log
        exit 99
fi

#DB管理情報の取得
	su - orca -c "psql -o $HOME/orca-mstlog/sql.out -f $HOME/orca-mstlog/SQLSELECT.TXT orca"  
	DBLIST=`awk '/--------|row/ {skip = ! skip; next};/};/ {exit}; (skip == 1) {gsub(/\t| |;/,""); print} ' $HOME/orca-mstlog/sql.out`
	echo "$DBLIST" "DBLIST" 
#ダウンロードファイル生成
	echo "$MSTDIR$DBLIST"
	$ORCALIB/ORCXSMST1 $MSTDIR$DBLIST
	if [ $? -ne 0 ]	;	then 
		echo "ダウンロードファイル生成に失敗しました" >>master_log
		exit 99
	fi
#更新用ダウンロードファイル受信
#ファイルサイズチェック
	if [	-s	$UPDFILE	]
	then
		echo "更新用ダウンロードファイルの作成が終了しました" >>master_log
	else
		echo "更新用ファイルはありません" >>master_log
		rm -r $HOME/$MSTDIR
		exit 
	fi

#TBLバックアップ処理
TBLLIST=`awk '{gsub(/\t| |;/,""); print} ' $TBLFILE`
for TBL in $TBLLIST
do
	echo "TBL=" $TBL
	su - orca -c "pg_dump -R -t $TBL orca > $TBL.out"
done
#TBLバックアップ処理終了

UPDLIST=`awk '{gsub(/\t| |;/,""); print} ' $UPDFILE`

for UPD in $UPDLIST
do
	echo ${UPD:34:$LEN}
	if	orcawget ${UPD:34:$LEN} ;	then
		echo ${UPD:34:$LEN} "ダウンロードが終了しました" >>master_log
	else
		echo ${UPD:34:$LEN} "ダウンロードに失敗しました" >>master_log
	        exit 99
	fi
done

for UPD in $UPDLIST
do
#	echo $UPD
	if	orcatar $UPD ;	then
		echo $UPD "解凍処理が終了しました" >>master_log
	else
		echo $UPD "解凍処理に失敗しました" >>master_log
	        exit 99
	fi
done
#DB構造変更処理
for UPD in $UPDLIST
do
	UPD1=`echo $UPD | awk '{gsub(/.tar.gz/,".dat"); print} ' `
	UPD2=`echo $UPD1 | awk '{i=split($0,arr,"/"); print arr[i]} ' `
#SQL
#
	if	[ -s $HOME/$MSTDIR/$UPD2 ]; then
		su - orca -c "psql -o dblog orca < $HOME/$MSTDIR/$UPD2 2>&1 | tee $HOME/$MSTDIR/log" 
	else
		su - orca -c "touch $HOME/$MSTDIR/log" 
	fi
#	LOGLIST=`awk '/NOTICE:/ {skip = !skip; next};/};/ {exit}; (skip == 1) {gsub(/\t| |;/,""); print} ' $HOME/$MSTDIR/log`
	LOGLIST=`awk '/ERROR:/{gsub(/\t| |;/,""); print} ' $HOME/$MSTDIR/log`
	for LOG in $LOGLIST
	do
		if [ "${LOG:0:6}" = "ERROR:" ];	then
			echo $UDP2 "更新処理に失敗しました" >>master_log
			exit 99
		fi
	done
#	if [ $? -ne 0 ]	;	then 
#	echo $UDP2 "更新処理に失敗しました" >>master_log
#		exit 99
#	fi

#DB管理情報更新

        echo "update tbl_dbkanri set dbsversion1=' ${UPD:0:21} ',dbsversion2=' ${UPD:0:21} ' where kanricd='ORCADB00';" | su - orca -c "psql orca"
done

echo  "全ての処理が完了しました" >>master_log
#注意☆☆☆テストが終了したら元に戻す
rm -r $HOME/$MSTDIR


#wait
