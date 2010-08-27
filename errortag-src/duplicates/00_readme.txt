
Task: blind check of the duplicate lines in the sme_lex files
Goal: initial goal is to convert the lex-files into XML format
Todo: please check and remove duplicates

  cat abbr-sme-lex.txt | sort | uniq -c | sort -nr | grep -e "^ *2.*$" > doublets_sme_lex.txt 
  cat adj-sme-lex.txt | sort | uniq -c | sort -nr | grep -e "^ *2.*$" >> doublets_sme_lex.txt 
  cat adv-sme-lex.txt | sort | uniq -c | sort -nr | grep -e "^ *2.*$" >> doublets_sme_lex.txt 
  cat noun-sme-lex.txt | sort | uniq -c | sort -nr | grep -e "^ *2.*$" >> doublets_sme_lex.txt 

