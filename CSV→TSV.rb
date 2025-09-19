#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while line = $stdin.gets
  line.chomp! # 行末の改行コード（\r\n も \n も \r も）を削除
  puts line.gsub(/,/, "\t").delete('"')
end

#print "\n\"\""

exit
