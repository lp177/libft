NAME = libft.a
NAMETRY = try
SRC = main.c
LIBFT = ft_iswhite.c ft_s_strlen.c newstr.c strpush.c strput.c delstr.c ft_puttabstr.c ft_strreplace.c lst_create.c ft_lstpush.c ft_print_errno.c ft_putcharerrno.c ft_putstrerrno.c ft_putnbrerrno.c ft_swap.c ft_strconcat.c ft_concator.c ft_next_str.c ft_end_str.c ft_unite.c ft_positive.c ft_lstmap.c ft_lstiter.c ft_lstadd.c ft_lstdel.c ft_lstdelone.c ft_lstnew.c ft_putnbr_fd.c ft_putendl_fd.c ft_putstr_fd.c ft_putchar_fd.c ft_unsigned_itoa.c ft_itoa.c ft_strsplit.c ft_strtrim.c ft_strjoin.c ft_strsub.c ft_strnequ.c ft_strequ.c ft_strmap.c ft_strmapi.c ft_striteri.c ft_striter.c ft_strclr.c ft_strdel.c ft_strnew.c ft_memdel.c ft_memalloc.c ft_atoi.c ft_toupper.c ft_tolower.c ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_memchr.c ft_memmove.c ft_putnbr.c ft_strchr.c ft_strlcat.c ft_strncpy.c ft_bzero.c ft_memcmp.c ft_strcmp.c ft_strncmp.c ft_memset.c ft_putstr.c ft_strcpy.c ft_nbrlen.c ft_strlen.c ft_strrchr.c ft_strstr.c ft_strnstr.c ft_memccpy.c ft_memcpy.c ft_putchar.c ft_strcat.c ft_strdup.c ft_strncat.c ft_putendl.c
OBJ = $(LIBFT:.c=.o)
OBJTRY = $(SRC:.c=.o)
OLDPWD = pwd
FLG = -Wall -Wextra -Werror
INC = -I includes/
RED = \033[0;31m
GREEN = \033[1;32m
BLUE = \033[0;34m
BLUE_L = \033[1;34m
CYAN = \033[1;36m
CYAN_L = \033[0;36m
ORANGE = \033[1;33m
BROWN = \033[0;33m
NC = \033[0m
HOME = "/nfs/zfs-student-2/users/2014/luperez"
VALGRIND = "$(HOME)/valgrind/bin/valgrind --leak-check=full --tool=memcheck --dsymutil=yes --show-leak-kinds=all"

all: $(NAME)

$(NAME): $(OBJ)
	@echo "$(GREEN)== Compact ==$(CYAN)"
	@echo "    = ar rc"
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "    = ranlib"
	@echo "$(GREEN)== End of compilation ==$(NC)"

$(OBJ): $(LIBFT)
	@echo "$(GREEN)== Make ==$(ORANGE)"
	@echo "    + SRC > OBJ"
	@gcc $(FLG) $(INC) -c $(LIBFT)

$(NAMETRY):
	@echo "$(GREEN)== Try Libft ==$(CYAN)"
	make
	gcc $(FLG) $(INC)  -c $(SRC)
	gcc $(FLG) -Ofast -o $(NAMETRY) $(OBJTRY) -L. -lft
	rm main.c
	echo "\n\ntry:" && ./try

clean:
	@echo "    $(GREEN)== Clean ==$(CYAN)"
	@echo "        - rm all libft/.o"
	@rm -f $(OBJ) $(OBJTRY)
	@echo "    $(GREEN)== End of clean ==$(NC)"

fclean:
	@echo "$(GREEN)== Fclean ==$(CYAN_L)"
	@make clean
	@rm -f $(NAME) $(NAMETRY)
	@echo "$(CYAN_L)    - rm all exec"
	@echo "$(GREEN)== End of fclean ==$(NC)"

re: fclean all

give:
	rm -f ../libft.a
	make re && cp libft.a ../. && make clean

runVerif:
	@echo "$(CYAN_L)== Make ==$(BLUE_L)"
	make
	gcc $(FLG) $(INC) -c $(SRC)
	gcc $(FLG) -Ofast -o $(NAMETRY) $(OBJTRY) -L. -lft
	gcc $(FLG) $(INC) -c $(SRC)
	rm main.c
	@echo "\n\ntry:" && ./try

mn:
ifeq ($(N),)
	@echo "Give me a N guy!   (make mn N=42)"
else
	@echo Load main$(N).z
	rm -f main.c; cp main$(N).z main.c
	make runVerif
endif

unit_test:
	(cd unit_test;\
	make re;\
	./unit_test;)

moulitest:
	make mn N=1
	make -C ../moulitest-master libft_bonus

.PHONY: all NAME unit_test moulitest try give verifClean libft clean fclean re

