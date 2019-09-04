#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while $stdin.gets
	# CR/LF時のおまじない（CotEditorで正規表現/$/がうまく挙動しない）
	$_ = $_.sub(/\R/, "\n")
	
	# 置換処理
	print $_.gsub(/\|/, "&#124;").sub(/^/, "|").sub(/$/, "|").gsub(/\t/, "|")

	# 1行目をヘッダとして扱う
	if $. == 1
		# ヘッダ下のライン追加 |---|---| 
		print $_.gsub(/\|/, " ").sub(/^/, "|").sub(/[^\t\n|]*$/, "---|").gsub(/[^\t|]*\t/, "---|")
	end

end

exit
