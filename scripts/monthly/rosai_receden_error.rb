#!/usr/bin/ruby 

require "monthly/rosai_receden_common"
require "nkf"

$KCODE = "UTF-8"

class Receden_error < Receden_common

  class Erorr_info

    attr_accessor    :recenum,:receline,:filename,:ptnum,:name,:birthday,:sryym,:nyugaikbn,:tankinum,:chokinum,:shobyoymd,:ryostymd,:ryoedymd,:errcd,:recid,:line,:rownum,:label,:value,:msg,:header,:footer,:data

    def initialize
      @recenum=""
      @receline=0
      @filename=""
      @ptnum=""
      @name=""
      @birthday=""
      @sryym=""
      @nyugaikbn=""
      @tankinum=""
      @chokinum=""
      @shobyoymd=""
      @ryostymd=""
      @ryoedymd=""
      @errcd=""
      @recid=""
      @line=0
      @rownum=0
      @label=""
      @value=""
      @msg=""
      @header=""
      @footer=""
      @data=""
    end
  end

  def initialize(recefile)
    @info=Recinfo.new
    @errors=Array.new
    @filename=recefile
  end

  def empty?
    @errors.empty?
  end

  def push(errcd,*args)

    rece=args[0]
    csv=args[1]
    name=args[2]
    if csv && name && csv.hash.key?(name)
      key = csv[name].name
    end
    header=args[3]
    footer=args[4]
    info=nil

    err=Erorr_info.new

    if csv.nil?
    else
      err.line=csv.line
      err.receline=csv.receline
      err.data=csv.rows.join(",")
      if csv.hash.key?("RECID")
        err.recid=csv["RECID"].value
        id=csv["RECID"].value
        if @info.rec.key?(id)
          if @info[id].hash.key?(key)
            err.label =@info[id].hash[key].label
            err.value =csv[key].value
            err.rownum=@info[id].hash[key].rownum + 1
          end
        end
      end
    end

    if rece.nil?
    else
      rece.re.each{|re|

        err.ptnum   =re["PTNUM"].hankaku
        err.recenum =re["RECENUM"].hankaku
        err.name    =re["NAME"].zenkaku
        err.birthday=re["BIRTHDAY"].wYmdtos
        err.sryym   =wtos(rece.sryym)

        if rece.sbt.exists?
          err.nyugaikbn=rece.sbt.nyugai
        end

        rece.rr.each{|rr|
          err.tankinum =rr["TANKINUM"].hankaku
          err.chokinum=rr["CHOKINUM"].hankaku
          err.shobyoymd=rr["SHOBYOYMD"].wYmdtos
          err.ryostymd=rr["RYOSTYMD"].wYmdtos
          err.ryoedymd=rr["RYOEDYMD"].wYmdtos
          break
        }

        break
      }
    end

    if header.nil?
    else
       err.header = header
    end

    if footer.nil?
    else
       err.footer = footer
    end

    err.filename = @filename

    err.errcd=errcd
    case errcd
    when "10001"
      err.msg="労災診療費請求レコードが記録されていません。"
    when "10002"
      err.msg="労災診療費請求レコードが複数記録されてます。"
    when "10010"
      err.msg="労災診療費単価が記録されていません。"
    when "10020"
      err.msg="請求できない労災診療費単価が記録されています。"
    when "10050"
      err.msg="病院・診療所の区分が記録されていません。"
    when "10060"
      err.msg="請求できない病院・診療所の区分が記録されています。"
    when "10090"
      err.msg="請求書提出年月日が正しい暦年月日で記録されていません。"
    when "10100"
      err.msg="療養期間－末日前の請求書提出年月日が記録されています。"
    when "10130"
      err.msg="郵便番号が正しく記録されていません。"
    when "10140"
      err.msg="医療機関所在地が記録されていません。"
    when "10150"
      err.msg="医療機関責任者氏名が記録されていません。"
    when "10170"
      err.msg="都道府県労働局コードが記録されていません。"
    when "10180"
      err.msg="都道府県労働局コードに誤ったコードが記録されています。"
    when "10190"
      err.msg="労働基準監督署コードに誤ったコードが記録されています。"
    when "10200"
      err.msg="指定病院等の番号が記録されていません。"
    when "10210"
      err.msg="指定病院等の番号に数字以外が記録されています。"
    when "10310"
      err.msg="各レセプトの労災レセプトレコードの合計額と労災診療費請求書の請求金額が一致していません。"
    when "10320"
      err.msg="各レセプトの件数と労災診療費請求書の内訳書添付枚数が一致していません。"
    when "10410"
      err.msg="平成２５年５月以前の療養期間－初日が記録されています。"
    when "19100"
      err.msg="レセプト番号が６桁以内の数字ではありません。"
    when "19230"
      err.msg="医療機関情報レコードの次レコードが、レセプト共通レコード以外です。"
    when "19281"
      err.msg="医療機関情報レコードが記録されていません。"
    when "19282"
      err.msg="医療機関情報レコードが複数記録されています。"
    when "19283"
      err.msg="レセプト共通レコードが記録されていません。"
    when "19284"
      err.msg="請求年月が正しい暦年月ではありません。"
    when "19170"
      err.msg="医療機関単位のレセプト番号が「１」からの昇順ではありません。"
    when "20020"
      err.msg="転帰事由が記録されていません。"
    when "20030"
      err.msg="入院年月日が記録されていません。"
    when "20040"
      err.msg="新継再別が記録されていません。"
    when "20050"
      err.msg="長期のレセプトで新継再別に「３」（転医始診）が記録されました。"
    when "20060"
      err.msg="長期のレセプトで傷病年月日が記録されています。"
    when "20070"
      err.msg="短期のレセプトで傷病年月日が記録されていません。"
    when "20100"
      err.msg="労働者の氏名（カナ）が記録されていません。"
    when "20120"
      err.msg="療養期間－初日が記録されていません。"
    when "20130"
      err.msg="療養期間－末日が記録されていません。"
    when "20140"
      err.msg="傷病の経過が記録されていません。"
    when "20150"
      err.msg="小計点数が記録されていません。"
    when "20170"
      err.msg="業務災害・通勤災害の区分が記録されていません。"
    when "20180"
      err.msg="業務災害・通勤災害の区分の記録が誤っています。"
    when "20190"
      err.msg="帳票種別が記録されていません。"
    when "20200"
      err.msg="帳票種別の記録が誤っています。"
    when "20210"
      err.msg="次の項目は記録が必須の項目です。"
    when "20220"
      err.msg="使用できない診療科名が記録されています。"
    when "21590"
      err.msg="当該療養期間レセプトは、次月以降に請求可能となります。"
    when "21600"
      err.msg="療養期間－初日が正しい暦年月日ではありません。"
    when "21610"
      err.msg="療養期間－末日が正しい暦年月日ではありません。"
    when "21611"
      err.msg="診療年月が正しい暦年月ではありません。"
    when "21630"
      err.msg="療養期間－初日と療養期間－末日が同一年月ではありません。"
    when "21660"
      err.msg="病棟区分の桁数が２の倍数ではありません。"
    when "21680"
      err.msg="傷病名レコードの修飾語コードの桁数が４の倍数ではありません。"
    when "22020"
      err.msg="１レセプトに対し１００レコード以上の傷病名レコードが記録されています。９９レコードを超える傷病名レコードは記録できません。"
    when "23040"
      err.msg="適用レコードに記録できないコードが記録されています。"
    when "23060"
      err.msg="診療種別が昇順に記録されていません。"
    when "23070"
      err.msg="適用レコードに記録できないコメントコードが記録されています。"
    when "23110"
      err.msg="適用レコードの回数が記録されていないか又は０が記録されています。"
    when "23120"
      err.msg="点数・回数算定単位（剤）内の回数が一致していません。"
    when "23130"
      err.msg="適用レコードの算定日情報（回数）に０が記録されています。"
    when "23170"
      err.msg="算定日情報（回数）が正しい暦日に記録されていません。"
    when "23190"
      err.msg="摘要レコードに算定日情報（回数）が記録されていません。"
    when "23800"
      err.msg="コメントデータの修飾語コードの桁数が４の倍数ではありません。"
    when "23810"
      err.msg="コメントレコード以外で診療識別「０１」「９９」に記録されています。"
    when "23820"
      err.msg="１レセプト内に１０００レコード以上の症状詳記レコードが記録されています。９９９レコードを超える症状詳記レコードは記録できません。"
    when "23830"
      err.msg="レセプト内で先頭の症状詳記レコードに症状詳記区分が記録されていません。"
    when "23840"
      err.msg="使用できない症状詳記区分が記録されています。"
    when "23860"
      err.msg="適用情報レコードのコメントデータの修飾語コードの桁数が４の倍数ではありません。"
    when "23870"
      err.msg="適用情報レコードのコメントデータの修飾語コード数が６以上記録されています。５コードを超える修飾語コードは記録できません。"
    when "23880"
      err.msg="適用情報レコードのコメントコードが記録されていません。"
    when "23950"
      err.msg="使用できない医薬品コードが記録されています。"
    when "25390"
      err.msg="次の項目に、記録可能な桁数を超えるデータが記録されています。"
    when "25400"
      err.msg="レセプト情報（労災レセプトレコード）が記録されていません。"
    when "25420"
      err.msg="レコードの項目数がレコード識別情報と一致しません。"
    when "25430"
      err.msg="次の項目の記録モードが誤っています。"
    when "25441"
      err.msg="次の項目に外字が記録されています。"
    when "25470"
      err.msg="労災レセプトレコードが複数記録されています。"
    when "25530"
      err.msg="当該項目の桁数が不足しています。"
    when "25540"
      err.msg="傷病名レコードが記録されていません。"
    when "25550"
      err.msg="適用レコードが記録されていません。"
    when "26510"
      err.msg="再請求レセプトの電算処理受付番号が記録されていません。"
    when "30010"
      err.msg="労働者の氏名が記録されていません。"
    when "30210"
      err.msg="入院年月日が正しい暦年月日で記録されていません。"
    when "30220"
      err.msg="療養期間－末日後の入院年月日が記録されています。"
    when "30230"
      err.msg="生年月日以前の入院年月日が記録されています。"
    when "31190"
      err.msg="病棟区分に誤ったコードが記録されています。"
    when "31330"
      err.msg="男女区分に誤ったコードが記録されています。"
    when "31450"
      err.msg="生年月日が正しい暦年月日で記録されていません。"
    when "32010"
      err.msg="診療実日数が当該療養期間の日数を超えています。"
    when "32040"
      err.msg="存在しない傷病名コードが記録されています。"
    when "32050"
      err.msg="存在しない修飾語コードが記録されています。"
    when "32060"
      err.msg="療養期間－初日後の診療開始日が記録されています。"
    when "32070"
      err.msg="診療開始日が正しい暦年月日で記録されていません。"
    when "32090"
      err.msg="未コード化傷病名の傷病名称が記録されていません。"
    when "32200"
      err.msg="主傷病コードに誤ったコードが記録されています。"
    when "32210"
      err.msg="生年月日以前の診療開始日が記録されています。"
    when "33031"
      err.msg="存在しないか又は現在有効でない適用コード（診療コード、医薬品コード、特定器材コード又はコメントコード）が記録されています。"
    when "33040"
      err.msg="きざみ計算診療行為の数量データに対し０又は省略（スペース）が記録されました。"
    when "33060"
      err.msg="減点医薬品の減点点数が記録されていません。"
    when "33070"
      err.msg="点数の記録が必要な箇所ですが、０又は点数が記録されていません。"
    when "33071"
      err.msg="点数の記録が必要な箇所ですが、点数が記録されていません。"
    when "33090"
      err.msg="医薬品の使用量に対し０又は省略（スペース）が記録されました。"
    when "33110"
      err.msg="特定器材の使用量に対し０又は省略（スペース）が記録されました。"
    when "33130"
      err.msg="特定器材の単価が記録されていません。"
    when "33160"
      err.msg="未コード化特定器材です。特定器材名称、商品名及び規格又はサイズのどちらかを記録してください。"
    when "33170"
      err.msg="記録された数量データが下限値以下のため点数計算ができません。"
    when "33190"
      err.msg="減点医薬品のコードのみで記録してください。"
    when "33930"
      err.msg="存在しない修飾語コードがコメントに記録されています。"
    when "34380"
      err.msg="文字データの記録が必要なコメントコードですが、文字データが記録されていません。"
    when "34390"
      err.msg="文字データが数字のみ有効のコメントコードですが、文字データに数字以外が含まれています。"
    when "34400"
      err.msg="記録された文字データの桁数が、当該コメントに記録すべき文字データの桁数と一致しないため、コメントが正しく作成できません。"
    when "34410"
      err.msg="適用レコードコメントのコメントコードは文字データの記録が必要ですが、文字データが記録されていません。"
    when "34440"
      err.msg="適用レコードコメントのコメントコードは文字データが数字のみ有効ですが、文字データに数字以外が含まれています。"
    when "34470"
      err.msg="適用レコードコメントに記録された文字データの桁数が、当該コメントに記録すべき文字データの桁数と一致しないため、コメントが正しく作成できません。"
    when "34500"
      err.msg="適用レコードコメントに存在しないコメントコードが記録されています。"
    when "34590"
      err.msg="存在しない修飾語コードが適用レコードコメントに記録されています。"
    when "34650"
      err.msg="特定器材の単位コードに誤ったコードが記録されています。"
    when "34900"
      err.msg="食事・生活欄以外に食事・生活療養費関連のコードが記録されています。"
    when "34910"
      err.msg="食事・生活欄に食事・生活以外の診療行為が記録されました。"
    when "36390"
      err.msg="病床数の記録が必要です。"
    when "35310"
      err.msg="食事療養回数が当月日数×３食分を超えています。"
    when "35340"
      err.msg="食事療養回数が診療実日数×３食分を超えています。"
    when "37650"
      err.msg="重複した給付キーが存在します。"
    when "38040"
      err.msg="傷病年月日が正しい暦年月日で記録されていません。"
    when "38050"
      err.msg="療養期間－末日後の傷病年月日が記録されています。"
    when "38060"
      err.msg="生年月日前の傷病年月日が記録されています。"
    when "38100"
      err.msg="生年月日前の療養期間－初日が記録されています。"
    when "38110"
      err.msg="傷病年月日前の療養期間－初日が記録されています。"
    when "38120"
      err.msg="療養期間－末日後の療養期間－初日が記録されています。"
    when "38160"
      err.msg="生年月日前の療養期間－末日が記録されています。"
    when "38200"
      err.msg="記録できない転帰事由が記録されています。"
    when "38210"
      err.msg="記録できない新継再別が記録されています。"
    when "38230"
      err.msg="長期のレセプトで労働保険番号が記録されています。"
    when "38240"
      err.msg="短期のレセプトで労働保険番号が記録されていません。"
    when "38250"
      err.msg="長期のレセプトで年金証書番号が記録されていません。"
    when "38260"
      err.msg="短期のレセプトで年金証書番号が記録されています。"
    when "38270"
      err.msg="入院外レセプトで食事療養合計回数が記録されています。"
    when "38280"
      err.msg="入院レセプトで食事療養合計回数が記録されていません。"
    when "38290"
      err.msg="入院外レセプトで食事療養合計金額（ハ）が記録されています。"
    when "38300"
      err.msg="入院レセプトで食事療養合計金額（ハ）が記録されていません。"
    when "38350"
      err.msg="該当の診療行為に対して、金額又は点数が０又は記録されていません。"
    when "38351"
      err.msg="該当の診療行為に対して、金額又は点数が記録されていません。"
    when "38380"
      err.msg="該当の診療行為には金額の記録が必要ですが、金額に対し０又は省略（スペース）が記録されました。"
    when "38381"
      err.msg="該当の診療行為には金額の記録が必要ですが、金額に対し省略（スペース）が記録されました。"
    when "38380"
      err.msg="該当の診療行為には金額の記録が必要ですが、金額に対し０又は省略（スペース）が記録されました。"
    when "38381"
      err.msg="該当の診療行為には金額の記録が必要ですが、金額に対し省略（スペース）が記録されました。"
    when "38390"
      err.msg="該当の診療行為には金額の記録は不要ですが、金額が記録されています。"
    when "40070"
      err.msg="初診料が記録されていますが、新継再別が「１」（初診）となっていません。"
    when "40090"
      err.msg="入院患者に対して、医薬品の点数が記録されているが、調剤料の算定回数と診療実日数が合致していません。"
    when "40100"
      err.msg="事業の名称が記録されていません。"
    when "40110"
      err.msg="事業場の所在地が記録されていません。"
    when "41190"
      err.msg="同一病棟区分が２つ以上記録されています。"
    when "43230"
      err.msg="単位コードの記録が必要な特定器材ですが、単位コードが記録されていません。"
    when "44240"
      err.msg="診療所専用の診療行為が記録されています。"
    when "44350"
      err.msg="通則加算が記録されましたが、基本手技が記録されていません。"
    when "44360"
      err.msg="通則加算と注加算の記録順が誤っています。"
    when "44510"
      err.msg="初診料を算定する条件を満たしていません。診療開始日の記録を確認してください。"
    when "44550"
      err.msg="療養期間－初日前の算定日が記録されています。"
    when "46030"
      err.msg="病院専用の診療行為が記録されています。"
    when "46120"
      err.msg="同時算定不可の注加算が記録されています。"
    when "46340"
      err.msg="初診料の算定回数が算定可能回数を超えています。"
    when "46410"
      err.msg="注加算の記録順序が誤っています。"
    when "48410"
      err.msg="小計点数が摘要データの点数の合計と一致していません。"
    when "48420"
      err.msg="小計点数金額換算（イ）が正しくありません。"
    when "48430"
      err.msg="小計金額（ロ）が摘要データの金額の合計と一致していません。"
    when "48440"
      err.msg="合計額（イ）＋（ロ）＋（ハ）が「小計点数金額換算（イ）＋小計金額（ロ）＋食事療養合計金額（ハ）」と一致していません。"
    when "48450"
      err.msg="合計額（イ）＋（ロ）＋（ハ）が「小計点数金額換算（イ）＋小計金額（ロ）」と一致していません。"
    when "48470"
      err.msg="食事療養合計回数が摘要データの合計回数と一致していません。"
    when "48480"
      err.msg="食事療養合計金額（ハ）が摘要データの合計金額と一致していません。"

    end

    @errors << err

  end

  def write(outfile)
    open(outfile,"a"){|f|
      @errors.each_with_index{|err,i|
        errdata =  sprintf("<ERR_FILENAME>%s</ERR_FILENAME>",err.filename)
        errdata << sprintf("<ERR_RECENUM>%s</ERR_RECENUM>",err.recenum)
        errdata << sprintf("<ERR_PTNUM>%s</ERR_PTNUM>",err.ptnum)
        errdata << sprintf("<ERR_NAME>%s</ERR_NAME>",err.name)
        errdata << sprintf("<ERR_BIRTHDAY>%s</ERR_BIRTHDAY>",err.birthday)
        errdata << sprintf("<ERR_SRYYM>%s</ERR_SRYYM>",err.sryym)
        errdata << sprintf("<ERR_NYUGAIKBN>%s</ERR_NYUGAIKBN>",err.nyugaikbn)
        errdata << sprintf("<ERR_TANKINUM>%s</ERR_TANKINUM>",err.tankinum)
        errdata << sprintf("<ERR_CHOKINUM>%s</ERR_CHOKINUM>",err.chokinum)
        errdata << sprintf("<ERR_SHOBYOYMD>%s</ERR_SHOBYOYMD>",err.shobyoymd)
        errdata << sprintf("<ERR_RYOSTYMD>%s</ERR_RYOSTYMD>",err.ryostymd)
        errdata << sprintf("<ERR_RYOEDYMD>%s</ERR_RYOEDYMD>",err.ryoedymd)
        errdata << sprintf("<ERR_ERRCD>%s</ERR_ERRCD>",err.errcd)
        errdata << sprintf("<ERR_RECID>%s</ERR_RECID>",err.recid)
        errdata << sprintf("<ERR_RECELINE>%d</ERR_RECELINE>",err.receline)
        errdata << sprintf("<ERR_ROWNUM>%d</ERR_ROWNUM>",err.rownum)
        errdata << sprintf("<ERR_LABEL>%s</ERR_LABEL>",err.label)
        errdata << sprintf("<ERR_VALUE>%s</ERR_VALUE>",err.value)
        errdata << sprintf("<ERR_MSG>%s</ERR_MSG>",err.msg)
        errdata << sprintf("<ERR_HEADER>%s</ERR_HEADER>",err.header)
        errdata << sprintf("<ERR_FOOTER>%s</ERR_FOOTER>",err.footer)
        errdata << sprintf("<ERR_LINE>%d</ERR_LINE>",err.line)
        errdata << sprintf("<ERR_DATA>%s</ERR_DATA>",err.data)
        errdata << sprintf("\n",err.data)
        f.print NKF.nkf("-Wex -Lu", errdata)
      }
    }
  end

  def size
    @errors.size
  end

end
