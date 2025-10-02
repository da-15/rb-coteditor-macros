#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

text = $stdin.read

# 行ごとに処理（改行コードは \R で全対応）
lines = text.split(/\R/, -1)

# 前後の全角・半角スペースやタブを削除
trimmed = lines.map { |line| line.gsub(/\A[\p{Zs}\t]+|[\p{Zs}\t]+\z/, '') }

# 改行は LF にして出力（保存時にCotEditorが選択した形式に変換する）
print trimmed.join("\n")
