#!/bin/bash

fgrep -h --exclude *-L2.lexc 'Sem/' "$@" \
	| egrep -v '^[[:space:]]*!' \
	| cut -d':' -f1 \
	| tr '+' '\n' \
	| fgrep 'Sem/' \
	| sort -u

# +CmpN/SgN+CmpN/DefSgGen+CmpN/PlG+CmpN/First+Sem/Group+Sem/Hum
# ->
# +Sem/Group+Sem/Hum
# ->
# +Sem/Group_Hum

# This is the actual command used to extract semtags as input to the script producing sed commands:
# fgrep -h --exclude *-L2.lexc 'Sem/' morphology/stems/*.lexc | egrep -v '^[[:space:]]*!' | cut -d':' -f1 | cut -d'+' -f2- | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | sed 's/\(Sem[^+]*\)\+\(Sem\)/\1___\2/g' | tr '+' '\n' | grep '^Sem' | sort -u | sed 's/___/\+/g' > semtags.txt
