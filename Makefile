NAME = libasm.a

SRC = 	ft_strlen.s \
		ft_strcpy.s	\
		ft_strcmp.s	\
		ft_write.s

.s.o:
	nasm -felf64 -g $< -o ${<:.s=.o}

OBJ=$(SRC:.s=.o)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)

all: $(NAME)


clean:
	/bin/rm -f $(OBJ) 

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re