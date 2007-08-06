delete from tbl_toukeimemo where pgid in ('ORCBG010','ORCBG011','ORCBG013') and kanricd = '0000';

COPY "tbl_toukeimemo" FROM stdin;
ORCBG013	0000	000     	00000000	99999999									診療年月　　診療年月を入力します。\n発行方法　　１：診療科／保険組合せ別に発行します。\n　　　　　　２：保険組合せ別に発行します。\n　　　　　　３：診療科別に発行します。\n　　　　　　４：全体をまとめて発行します。\n　※労災・自賠責については診療科／保険組合せ別の発行になります。\n\n患者番号　　患者番号を入力します。\n伝票発行日　伝票発行日を入力します。\n発行区分　　今回請求額がゼロ円となる請求書の発行可否を指定します。\n　　　　　　０：発行する／１：発行しない\n診療科　　　診療科を入力します。入力時は発行方法に診療科別が指定されたものとみなします。\n前回未収　　１：前回未収額の印字を行いません。			20070803	20070803	144819	1
ORCBG010	0000	000     	00000000	99999999									期間指定区分　０：期間指定を行わない／１：期間指定を行う\n\n※期間指定を行なう場合は以下の開始診療年月〜処理区分の設定が必要です。　　　\n　開始診療年月　対象期間の開始診療年月を入力します。\n　終了診療年月　対象期間の終了診療年月を入力します。\n　処理区分　　　１：終了診療年月翌月以降の訂正・入金を含む\n　　　　　　　　２：終了診療年月翌月以降の訂正・入金を含まない\n\n未収金区分　０：未収金または過入金のある患者を対象／１：未収金のある患者のみを対象\n\n※処理区分についての補足\n例えば終了診療年月が３月のとき、４月以降の診療訂正、入金処理等で発生した請求額・入金額の変動分を\n考慮するかどうかを指定します。			20070803	20070803	150603	1
ORCBG011	0000	000     	00000000	99999999									期間指定区分　０：期間指定を行わない／１：期間指定を行う\n\n※期間指定を行なう場合は以下の開始診療年月〜処理区分の設定が必要です。\n　開始診療年月　対象期間の開始診療年月を入力します。\n　終了診療年月　対象期間の終了診療年月を入力します。\n　処理区分　　　１：締月翌月以降の訂正・入金を含む\n　　　　　　　　２：締月翌月以降の訂正・入金を含まない\n　　　　　　　\n入外区分　　　１：入院／２：外来\n未収金区分　　０：未収金または過入金のある患者を対象／１：未収金のある患者のみを対象\n\n※処理区分についての補足\n例えば終了診療年月が３月のとき、４月以降の診療訂正、入金処理等で発生した請求額・入金額の変動分を\n考慮するかどうかを指定します。\n			20070803	20070803	150758	1
