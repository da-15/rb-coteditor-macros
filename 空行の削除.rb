#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

text = $stdin.read

# 「行頭の余分な1行空行だけ削除」
text.gsub!(/^\n([^\n])/, '\1')

print text

# 備考:
# Rubyで正規表現の$1を使う代わりに、'\1'を使う。
# シングルクオートでないとうまく動かない。