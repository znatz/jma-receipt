#!/bin/bash
ORCADIR=/usr/lib/jma-receipt
ORCABT="$ORCADIR"
DBSTUB=/usr/lib/panda/sbin/dbstub
#-------------------------------------------#
#    定期請求計算処理（レビュー用）
#-------------------------------------------#
##      エラーファイル削除

#  第１ステップ　開始
        echo "update tbl_jobkanri set shellmsg = '入院患者抽出処理', stepstarttime = '13013000', stependtime = '        ', stepcnt = 3 where shellid = 'TEIKI1';" | psql orca

        sleep 7
        
#  第１ステップ　終了
        echo "update tbl_jobkanri set shellmsg = '入院患者抽出処理', stepstarttime = '13013000', stependtime = '13021000', stepcnt = 3 where shellid = 'TEIKI1';" | psql orca

        sleep 1

#  第２ステップ　開始
        echo "update tbl_jobkanri set shellmsg = '今回対象患者抽出処理', stepstarttime = '13023200', stependtime = '        ', stepcnt = 6 where shellid = 'TEIKI1';" | psql orca

        sleep 7
        
#  第２ステップ　終了
        echo "update tbl_jobkanri set shellmsg = '今回対象患者抽出処理', stepstarttime = '13023200', stependtime = '13031000', stepcnt = 6 where shellid = 'TEIKI1';" | psql orca

        sleep 1

#  第３ステップ　開始
        echo "update tbl_jobkanri set shellmsg = '入院請求金額計算処理', stepstarttime = '13031300', stependtime = '        ', stepcnt = 9 where shellid = 'TEIKI1';" | psql orca

        sleep 7
        
#  第３ステップ　終了
        echo "update tbl_jobkanri set shellmsg = '入院請求金額計算処理', stepstarttime = '13031300', stependtime = '13041000', stepcnt = 9 where shellid = 'TEIKI1';" | psql orca

        sleep 1

#  第４ステップ　開始
        echo "update tbl_jobkanri set shellmsg = '収納情報作成処理', stepstarttime = '13041300', stependtime = '        ', stepcnt = 12 where shellid = 'TEIKI1';" | psql orca

        sleep 7
        
#  第４ステップ　終了
        echo "update tbl_jobkanri set shellmsg = '収納情報作成処理', stepstarttime = '13041300', stependtime = '13051000', stepcnt = 12 where shellid = 'TEIKI1';" | psql orca

        sleep 1
	
	$DBSTUB -record "$ORCADIR"/record/ -dir "$ORCADIR"/lddef/directory -bddir "$ORCADIR"/lddef -db orca  -bd orcabt ORCBJOB -parameter JBE$1$2

       exit
