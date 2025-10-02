#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

# egrep もどき

whole = []
rev_flag = nil
inv_flag = nil
num_flag = nil
re = nil

while $stdin.gets
  if $. == 1
    cond = $_.chomp.split("\t")
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
        temp = ($. - 1).to_s + ": " + line
        whole << temp
      else
        whole << line
      end
    end
  end
end

whole.reverse! if rev_flag

whole.each do |line|
  puts line  # ← 改行付きで出力
end

exit
