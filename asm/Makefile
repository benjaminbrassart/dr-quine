# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/27 06:07:36 by bbrassar          #+#    #+#              #
#    Updated: 2023/11/27 10:02:47 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFILE := $(lastword $(MAKEFILE_LIST))

SRC := Colleen.s
# SRC += Grace.s
# SRC += Sully.s

OBJ := $(SRC:.s=.o)
NAME := $(OBJ:.o=)

AS := nasm
ASFLAGS := -Wall -Werror
ASFLAGS := -f elf64

LD := clang
LDFLAGS := -lc

RM := rm -vf

.PHONY: all

all: $(NAME)

$(NAME): %: %.o
	$(LD) $(LDFLAGS) $< -o $@

$(OBJ): %.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean fclean re

clean:
	@$(RM) $(OBJ) Sully_*

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

test_Grace: Grace
	@$(abspath $<)
	@echo "diff $<.s $<_kid.s"
	@diff --color=auto $<.s $<_kid.s && echo "OK!"
	@rm -f $<_kid.s

test_Colleen test_Sully: test_%: %
	$(eval path := $<)
	@echo "diff $<.s <($(path))"
	@diff --color=auto $<.s <($(abspath $(path))) && echo "OK!"
