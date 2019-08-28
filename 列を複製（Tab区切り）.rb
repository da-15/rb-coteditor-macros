#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

while $stdin.gets	
	# 改行コードを省く（\rは考慮しない）
	$_ = $_.sub(/\n/, "")
	
	# ダブルクオート付きで列を複製（+ 改行コードを戻す）
	# $_ = "\"" + $_ + "\"\t\"" + $_ + "\"\n"
	
	# 列を複製（+ 改行コードを戻す）
	$_ = $_ + "\t" + $_ + "\n"
	
	
	print $_
end

exit
