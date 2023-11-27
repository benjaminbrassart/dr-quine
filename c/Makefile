# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/27 06:07:36 by bbrassar          #+#    #+#              #
#    Updated: 2023/11/27 12:15:34 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFILE := $(lastword $(MAKEFILE_LIST))

NAME := Colleen
NAME += Grace
NAME += Sully

CC := clang
CFLAGS := -Wall -Werror -Wextra

RM := rm -vf

.PHONY: all

all: $(NAME)

$(NAME): %: %.c
	$(CC) $(CFLAGS) $< -o $@

.PHONY: clean fclean re

clean:
	@$(RM) Sully_*

fclean: clean
	@$(RM) $(NAME)

re: fclean
	@$(MAKE) -f $(MAKEFILE) all

TESTS := test_Colleen test_Grace

.PHONY: test $(TESTS)

test: $(TESTS)

.NOTPARALLEL: test

# required for process substitution <()
SHELL := bash

test_Colleen: test_%: %
	$(eval path := $<)
	@echo "diff <($(path)) $<.c"
	@diff --color=auto <($(abspath $(path))) $<.c && echo "OK!"

test_Grace: Grace
	@$(abspath $<)
	@echo "diff $<_kid.c $<.c"
	@diff --color=auto $<_kid.c $<.c && echo "OK!"
	@rm -f $<_kid.c
