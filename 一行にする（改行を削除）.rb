#!/usr/bin/env ruby -Ku
#%%%{CotEditorXInput=AllText}%%%
#%%%{CotEditorXOutput=ReplaceAllText}%%%

text = $stdin.read

# 改行コード（CR, LF, CRLFすべて）を半角スペースに置き換え
text.gsub!(/\R/, " ")

print text
