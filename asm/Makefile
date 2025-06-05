# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/27 06:07:36 by bbrassar          #+#    #+#              #
#    Updated: 2025/06/05 17:42:25 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFILE := $(lastword $(MAKEFILE_LIST))

SRC := Colleen.s
SRC += Grace.s
SRC += Sully.s

OBJ := $(SRC:.s=.o)
NAME := $(OBJ:.o=)

AS := nasm
ASFLAGS := -Wall -Werror
ASFLAGS := -f elf64 -g

LD := clang
LDFLAGS := -lc -no-pie

RM := rm -vf

.PHONY: all

all: $(NAME)

$(NAME): %: %.o
	$(LD) $(LDFLAGS) $< -o $@

$(OBJ): %.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean fclean re

clean:
	@$(RM) $(OBJ) Sully_* Grace_kid.s

fclean: clean
	@$(RM) $(NAME)

re: fclean
	@$(MAKE) -f $(MAKEFILE) all

TESTS := $(NAME:%=test_%)

.PHONY: test $(TESTS)

test: $(TESTS)

.NOTPARALLEL: test

# required for process substitution <()
SHELL := bash

test_Colleen: Colleen
	$(eval path := $<)
	@echo "diff <($(path)) $<.s"
	@diff --color=auto <($(abspath $(path))) $<.s && echo "OK!"

test_Grace: Grace
	@$(abspath $<)
	@echo "diff $<_kid.s $<.s"
	@diff --color=auto $<_kid.s $<.s && echo "OK!"
	@rm -f $<_kid.s
