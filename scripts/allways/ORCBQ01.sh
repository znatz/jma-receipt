#!/bin/bash
#-------------------------------------------#
#    患者一覧出力
#        $1 処理区分
#        $2 CSVファイル名
#        $3 パラメータファイル名
#        $4 TERMID
#        $5 SYSYMD
#        $6 SYSDATE
#        $7 ジョブＩＤ
#        $8 シェルＩＤ
#
#-------------------------------------------#
DBSTUB=/usr/local/panda/bin/dbstub
#-------------------------------------------# 
        $DBSTUB -record /usr/local/orca/record/ -dir /usr/local/orca/lddef/directory -bddir /usr/local/orca/lddef -db orca -bd orcabt ORCBQ01 -parameter $3,$4,$5,$6

##      ＣＳＶファイル作成
        if  [ $1 -eq "0" ]; then
            if  [ -e $2 ]; then
                awk ' {
                #     行頭の空白を取り除く
                      sub(/^ */,"");
                #     行末の空白を取り除く
                      sub(/ *$/,"");
                #     カンマの後の空白を取り除く
                      gsub(/, */,",");
                #     カンマの前の空白を取り除く
                      gsub(/ *,/,",");
                      print $0
                }'  $2 > $2.tmp

                mv  $2.tmp $2
            fi
        fi

##      パラメータファイル削除
        if  [ -e $3 ]; then
            rm  $3
        fi

       $DBSTUB -record /usr/local/orca/record/ -dir /usr/local/orca/lddef/directory -bddir /usr/local/orca/lddef -db orca  -bd orcabt ORCBJOB -parameter JBE$7$8

        exit
