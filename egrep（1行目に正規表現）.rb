#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

# egrep もどき
# 1 行目は条件指定行として使い、検索対象の正規表現を入れておくと、それを含む行だけを抽出します。
# タブで区切った 2 番目の要素として、以下のオプションを指定できます。
# -i を付けておくと「大文字小文字を無視する」オプションとして働きます。
# -n を付けておくと「行頭に元の行番号を付加する」オプションとして働きます。
# -r を付けておくと「逆順に表示する」オプションとして働きます。
# -v を付けておくと「検索対象を含まない行を表示する」オプションとして働きます。
# 混合オプションは、-inrv のように、まとめて指定してください (順不同)。

whole = []
rev_flag = nil
inv_flag = nil
num_flag = nil
re = nil

while $stdin.gets
  if $. == 1
    cond_line = $_.chomp
    whole << cond_line   # ← 条件行も出力に残す
    cond = cond_line.split("\t")

    if cond[1]
      if /i/i =~ cond[1]
        re = Regexp.new(cond[0], Regexp::IGNORECASE)
      else
        re = Regexp.new(cond[0])
      end
      rev_flag = true if /r/i =~ cond[1]
      inv_flag = true if /v/i =~ cond[1]
      num_flag = true if /n/i =~ cond[1]
    else
      re = Regexp.new(cond[0])
    end
  else
    line = $_.chomp
    matched = (re =~ line)
    matched = !matched if inv_flag

    if matched
      if num_flag
        whole << "#{$. - 1}: #{line}"
      else
        whole << line
      end
    else
      whole << ""  # ← 空行で行数保持
    end
  end
end

# 条件行は常に先頭に残すようにして、逆順は2行目以降だけに適用
if rev_flag
  cond_line = whole.shift
  rest = whole.reverse
  whole = [cond_line] + rest
end

whole.each { |line| puts line }

exit