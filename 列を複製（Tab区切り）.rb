#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while line = $stdin.gets
  # 改行を除去
  line.chomp!
  
  # 複製してタブ区切りに（行末に改行をつける）
  puts "#{line}\t#{line}"
end

exit