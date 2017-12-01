#!/bin/sh
########################################################
#  Linux Tree to list the directories and files        #
#  Version:1.0                                         #
#  Owner: Minpu Kang                                   #
#  Introduction: This is an updated one based on the   #
#                one(centerkey.com/tree) deployed by   #
#                Dem Pilafian                          #
#                                                      #
#  What is updated:                                    #
#       1. Update to list not only sub-directories but #
#          also files                                  #
#       2. Add the help printout with -h|--help        #
#       3. Optimized to judge the input is file or     #
#          directory following the command             #
#                                                      #
#  An example for setup:                               #
#     $ vi tree.sh                                     #
#     $ chmod u+x tree.sh                              #
#     $ ln -s tree.sh ~/bin/tree                       #
#     $ echo "PATH=~/bin:\${PATH}" >> ~/.profile       #
#                                                      #
#  Link: https://github.com/MinpuKang/tree             #
#                                                      #
########################################################

script_name=`basename $0`

if [[ "$1" == "-h" ]] || [[ "$1" == "--help"  ]]
   then
   echo "This is used to list a directory with a dendritical structure"
   echo "Usage:                                                       "
   echo "   $ $script_name [directory] [-h|--help]                    "
   echo "                                                             "
   echo "Examples:                                                    "
   echo "   $ $script_name                                            "
   echo "   $ $script_name /etc/opt                                   "
   echo "   $ $script_name ..                                         "
   exit
fi

echo
if [ "$1" != "" ] && [ -d $1 ]  #if parameter exists, use as base folder
   then cd "$1"
elif [ "$1" != "" ] && [ -f $1 ]
   then echo "   -> $1 is a file";echo;exit
elif [ "$1" != "" ]
   then echo "   -> $1:No such file or directory";echo;exit
fi
pwd
for i in `ls -R`; do if [ `echo $i| grep ":$" -c` == 1 ]; then path=`echo $i | sed -e 's/\/*:$//'`;echo $path;else file="$path/$i";echo $file ;fi ;done | sort | uniq  | sed -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/' 
# 1st sed: remove colons: -e 's/\/*:$//'
# 2nd sed: replace higher level folder names with dashes: -e 's/[^-][^\/]*\//--/g'
# 3rd sed: indent graph three spaces: -e 's/^/   /'
# 4th sed: replace first dash with a vertical bar: -e 's/-/|/'
if [ `ls | wc -l` == 0 ]   # check if no files or folders
   then echo "   -> no files or sub-directories"
fi
echo
exit
#finsihed