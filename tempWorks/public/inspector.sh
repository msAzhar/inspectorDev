#args=("$@")
#note: here, ${args[0]} is the first argument
#echo "first arg is ${args[0]}"

if [[ $1 == "-h" ]]; then cat help.txt; else ruby scan.rb; fi

#<<'COMMENT:
#case $1 in
#  "-h") cat help.txt
#  ;;
#  "-tr") 

#esac
#'
