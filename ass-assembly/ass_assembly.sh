#!/bin/sh

# MIT License
# Copyright (c) 2022 Hasan ŞyheMuhamet

# define local variables
format_output_obj=".o";
# NOTE: if your format file is .s change this value into '.s'
format_original_asm=".asm";
program_name="alex_out";
run_command="run"

# colors vairables
BLACK='\033[0;30m'; # black color
RED='\033[0;31m'; # red color
GREEN='\033[0;32m'; # green color
OUT='\033[0;33m'; # output color
# end

# print this error message if the value of $1 is empty.
if [ -z $1 ];
then
	echo "${RED}ERROR: no input files${BLACK}";
else
	# check if $2 is empty compile asm file without execution.
	if [ -z $2 ];
	then
		echo "${RED}NOTE:${GREEN} compile without execution";
		output=$1$format_output_obj;
		nasm -f elf $1$format_original_asm;
		ld -m elf_i386 -s -o $program_name $output;
		rm $output; # remove o. file

	# check if $2 equal run word if yes compile & execute the file.
	elif [ $2 = "$run_command" ];
		then
			echo "${RED}NOTE:${GREEN} compile and execute";
			output=$1$format_output_obj;
			nasm -f elf $1$format_original_asm;
			ld -m elf_i386 -s -o $program_name $output;
			rm $output; # remove .o file
			./$program_name # run output file
	else
		echo "${RED}ERROR: no input files";
	fi
fi
