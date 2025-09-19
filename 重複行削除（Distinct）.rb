#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

lines = $stdin.read.lines.map(&:chomp)  # 改行を削除
seen = {}

# 重複をスキップして最初に出た行だけ残す
distinct_lines = lines.select do |line|
  next false if seen[line]
  seen[line] = true
end

# 改行を戻して出力
distinct_lines.each { |line| print line + "\n" }