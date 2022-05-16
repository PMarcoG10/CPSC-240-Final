#Program: Electric Power Program
#Author: Marco Gabriel

#Removes old files when we create a new compilation
rm *.o
rm *.out
rm *.lis

echo "This is program is called Electric Power Program"

#All asm files
echo "Assemble the module electricity.asm"
nasm -f elf64 -l electricity.lis -o electricity.o electricity.asm

#All C files
echo "Assemble the C file driver.c"
gcc -c -m64 -Wall -o driver.o driver.c -fno-pie -no-pie -std=c11

#Linking all the o files together
g++ -m64 -o final.out electricity.o driver.o -fno-pie -no-pie -std=c++17

echo "Run the program\n"
./final.out

echo "\nThe bash script file is now closing."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis
