#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

lines = $stdin.read.lines.map(&:chomp)  # 改行を削除して配列に
counts = Hash.new(0)

# 行ごとの出現回数を数える
lines.each { |line| counts[line] += 1 }

# 2回以上出現する行だけを抽出
duplicates = lines.select { |line| counts[line] > 1 }

# 改行を戻して出力
duplicates.each { |line| print line + "\n" }