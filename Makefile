##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## Gautier BONHUR - Assembler
##

CC = ld

SRC = 	strlen.asm \
		strchr.asm \
		strrchr.asm \
		memset.asm \
		memcpy.asm \
		strcmp.asm \
		strncmp.asm \
		memmove.asm \
		strcasecmp.asm \
		strstr.asm

OBJ = $(SRC:.asm=.o)

all:	$(OBJ)
	$(CC) -shared -o libasm.so $(OBJ)

%.o: %.asm
	nasm -f elf64 -o $@ $<

re: fclean all

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f *.so
	rm -f *.o

.PHONY: fclean tests_run clean re make
