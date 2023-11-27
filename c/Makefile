# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/27 06:07:36 by bbrassar          #+#    #+#              #
#    Updated: 2023/11/27 06:53:58 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFILE := $(lastword $(MAKEFILE_LIST))

NAME := Colleen
# NAME += Grace
# NAME += Sully

CC := clang
CFLAGS := -Wall -Werror -Wextra

RM := rm -vf

$(NAME): %: %.c
	$(CC) $(CFLAGS) $< -o $@

.PHONY: all clean fclean re

all: $(NAME)

clean fclean:
	@$(RM) $(NAME)

re: fclean
	@$(MAKE) -f $(MAKEFILE) all

TESTS := $(NAME:%=test_%)

.PHONY: test $(TESTS)

test: $(TESTS)

# required for process substitution <()
SHELL := bash

$(TESTS): test_%: %
	$(eval path := $<)
	@echo "diff $<.c <($(path))"
	@diff --color=auto $<.c <($(abspath $(path))) && echo "OK!"
