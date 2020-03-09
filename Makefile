# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gvannest <gvannest@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/30 14:25:36 by gvannest          #+#    #+#              #
#    Updated: 2020/01/30 14:25:46 by gvannest         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re

NAME = libasm

CC = 			gcc
CFLAGS =		-Wall -Wextra -Werror -g
OBJ_PATH =		objs/

VPATH = 		src/
C_SRC = 		main.c
C_SRC_NAME =	$(C_SRC)
C_OBJ_NAME =	$(C_SRC_NAME:%.c=%.o)
C_OBJS =		$(addprefix $(OBJ_PATH),$(C_OBJ_NAME))

S_SRC = 		ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s \
				ft_strdup.s ft_atoi_base.s
S_SRC_NAME =	$(S_SRC)
S_OBJ_NAME =	$(S_SRC_NAME:%.s=%.o)
S_OBJS =		$(addprefix $(OBJ_PATH),$(S_OBJ_NAME))

all : $(NAME)

$(NAME): $(C_OBJS) $(S_OBJS)
	@ $(CC) $(CFLAGS) $(S_OBJS) $(C_OBJS) -o $(NAME)

$(OBJ_PATH)%.o : %.c
	@ mkdir -p $(OBJ_PATH)
	@ $(CC) $(CFLAGS) -c $^ -o $@

$(OBJ_PATH)%.o : %.s
	@ mkdir -p $(OBJ_PATH)
	@ nasm -f macho64 $^ -o $@

clean :
	@ rm -rf $(OBJ_PATH)

fclean: clean
	@ rm -f $(NAME)

re : fclean all