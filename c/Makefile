# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/27 06:07:36 by bbrassar          #+#    #+#              #
#    Updated: 2023/11/27 07:48:59 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFILE := $(lastword $(MAKEFILE_LIST))

NAME := Colleen
NAME += Grace
# NAME += Sully

CC := clang
CFLAGS := -Wall -Werror -Wextra

RM := rm -vf

.PHONY: all

all: $(NAME)

$(NAME): %: %.c
	$(CC) $(CFLAGS) $< -o $@

.PHONY: clean fclean re

clean fclean:
	@$(RM) $(NAME)

re: fclean
	@$(MAKE) -f $(MAKEFILE) all

TESTS := $(NAME:%=test_%)

.PHONY: test $(TESTS)

test: $(TESTS)

.NOTPARALLEL: test

# required for process substitution <()
SHELL := bash

test_Grace: Grace
	@$(abspath $<)
	@echo "diff $<.c $<_kid.c"
	@diff --color=auto $<.c $<_kid.c && echo "OK!"
	@rm -f $<_kid.c

test_Colleen test_Sully: test_%: %
	$(eval path := $<)
	@echo "diff $<.c <($(path))"
	@diff --color=auto $<.c <($(abspath $(path))) && echo "OK!"
