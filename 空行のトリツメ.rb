#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

# 標準入力から全テキストを取得
text = $stdin.read

# 空行（改行だけの行や空白だけの行）をすべて削除
# \R で CR, LF, CRLF に対応
text.gsub!(/^[ \t]*\R/m, '')

print text

exit
