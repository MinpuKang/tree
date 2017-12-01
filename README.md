This is used to list a directory with a dendritical structure.

Introduction: This is an updated one based on the one([centerkey.com/tree](http://centerkey.com/tree/)) deployed by Dem Pilafian.
                                                   
What is updated:

1. Update to list not only sub-directories but also files.
2. Add the help printout with -h|--help.
3. Optimized to judge the input is file or directory following the command.

An example for setup:
```
$ vi tree.sh
$ chmod u+x tree.sh
$ ln -s tree.sh ~/bin/tree
$ echo "PATH=~/bin:\${PATH}" >> ~/.profile
 ```
