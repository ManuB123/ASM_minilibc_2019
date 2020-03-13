RM		=	rm -f

CC		=	gcc -shared -fPIC

SRC		=	$(shell find $(SOURCEDIR) -name '*.asm')

OBJ 	= 	$(SRC:.asm=.o)

DEBUG_FILES 	= 	$(SRC:.asm=.smo)

NAME    =   libasm.so

%.o:		%.asm
			nasm -felf64 $< -o $@ -shared

%.smo:		%.asm
			nasm -felf64 $< -o $@ -D DEBUG

all:    	$(NAME)

$(NAME):    $(OBJ)
	ld $(OBJ) -o $(NAME) -shared

tests_run: $(DEBUG_FILES)
		gcc -o unit_tests -lcriterion $(DEBUG_FILES) --coverage tests/unit_tests.c  -fno-builtin
		./unit_tests | gcovr

clean:
	$(RM) $(shell find $(SOURCEDIR) -name '*.o')
	$(RM) $(shell find $(SOURCEDIR) -name '*.smo')
	$(RM) $(shell find $(SOURCEDIR) -name '*.gc*')
	$(RM) $(shell find $(SOURCEDIR) -name 'unit_tests')

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean all re fclean