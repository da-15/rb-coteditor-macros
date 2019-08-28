#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

# 空行を1行だけ削除（連続した空行は残す）
print $stdin.read.gsub(/^\n([^\n])/, '\1')

# 備考:
# Rubyで正規表現の$1を使う代わりに、'\1'を使う。
# シングルクオートでないとうまく動かない。

exit
