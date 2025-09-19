#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while line = $stdin.gets
  line = line.sub(/\R\z/, "\n")  # 改行コードをLFに統一

  # 置換処理
  print line.gsub(/\|/, "&#124;").sub(/^/, "|").sub(/$/, "|").gsub(/\t/, "|")

  # 1行目をヘッダとして扱う
  if $. == 1
    # ヘッダ下のライン追加 |---|---| 
    print line.gsub(/\|/, " ").sub(/^/, "|").sub(/[^\t\n|]*$/, "---|").gsub(/[^\t|]*\t/, "---|")
  end
end


exit