#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while $stdin.gets
	# CR/LF時のおまじない（CotEditorで$がうまく挙動しない）
	$_ = $_.sub(/\R/, "\n")
	
	# 置換処理
	print $_.sub(/^/, "'").sub(/$/, "',")
end

#print "\n\"\""

exit
