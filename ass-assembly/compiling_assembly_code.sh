#!/bin/sh

# MIT License
# author 2022 hasan seyhmuhammed

# important variables
OUT_OBJECT_FORMAT=".o";
FILE_EXTENSION=".asm";
PROGRAM_NAME="assembly";
RUN_COMMAND="run"

# if your file extension ending with filename'.s' format
# just change the value of FILE_EXTENSION into '.s' 

# color variables
BLACK='\033[0;30m'; # black color
RED='\033[0;31m'; # red color
GREEN='\033[0;32m'; # green color
OUT='\033[0;33m'; # output color

# print error message if the value of $1 is empty.
if [ -z $1 ];
then
	echo "${RED}ERROR: no input file${BLACK}";
else
	if [ -z $2 ]; # if $2 is empty compile assembly code without executing the output file.
	then
		echo "${RED}NOTE:${GREEN} compiling completed without executing.";
		OUTPUT=$1$OUT_OBJECT_FORMAT;
		nasm -f elf $1$FILE_EXTENSION;
		ld -m elf_i386 -s -o $PROGRAM_NAME $OUTPUT;
		rm $output; # remove o. file

	# check if $2 equal run word if yes compile & execute the file.
	elif [ $2 = "$RUN_COMMAND" ];
		then
			echo "${RED}NOTE:${GREEN} compile and execute output file.";
			OUTPUT=$1$OUT_OBJECT_FORMAT;
			nasm -f elf $1$FILE_EXTENSION;
			ld -m elf_i386 -s -o $PROGRAM_NAME $OUTPUT;
			rm $output; # remove .o file
			./$PROGRAM_NAME # run output file
	else
		echo "${RED}ERROR: no input file";
	fi
fi
