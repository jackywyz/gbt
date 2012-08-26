type -P gd &>/dev/null || go get code.googlecode.com/godag 

if [ $# != 0 ] 
then
  arg=$1
  case $arg in 
  -t)
     gd -L _objs -t
     exit
    ;;
  -c)
     [ ! -d './src' ] &&  mkdir src && exit
    ;;
  -l)
     [ -d './src' ] && [ -d './bin' ] && gd -L _objs -o bin/main || exit
   ;;
  *)
    echo $"Usage: $0 {-t   test|-c  create src dir|-l  link and output the bin}"
    exit 1
  esac
fi


[ ! -d './src' ] && echo "no src dir" &&  exit

[ ! -d './bin' ] &&  mkdir bin

[ -f 'bin/main' ] && gd -L _objs -o bin/main || echo "no .go file"  && exit

echo "**run-output:>"
ret=$(bin/main)
echo "$(tput setaf 2) $ret"


