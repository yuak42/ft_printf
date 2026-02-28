NAME		= libftprintf.a

SRC		= ft_printf.c \
		number/format_integer.c \
		char/format_string.c \
		char/format_char.c \
		number/format_unsigned.c \
		number/format_hex.c \
		other/format_percent.c \
		other/format_pointer.c

OBJS	= $(SRC:.c=.o)

LIBFT_SRC = libft/ft_isalpha.c libft/ft_isdigit.c libft/ft_isalnum.c libft/ft_isascii.c libft/ft_isprint.c \
			libft/ft_strlen.c libft/ft_memset.c libft/ft_bzero.c libft/ft_memcpy.c libft/ft_memmove.c libft/ft_strlcpy.c \
			libft/ft_strlcat.c libft/ft_toupper.c libft/ft_tolower.c libft/ft_strchr.c libft/ft_strrchr.c \
			libft/ft_strncmp.c libft/ft_memchr.c libft/ft_memcmp.c libft/ft_strnstr.c libft/ft_atoi.c libft/ft_calloc.c \
			libft/ft_strdup.c \
			libft/ft_substr.c libft/ft_strjoin.c libft/ft_strtrim.c libft/ft_split.c libft/ft_itoa.c libft/ft_strmapi.c \
			libft/ft_striteri.c libft/ft_putchar_fd.c libft/ft_putstr_fd.c libft/ft_putendl_fd.c \
			libft/ft_putnbr_fd.c \
			libft/ft_lstadd_back_bonus.c libft/ft_lstadd_front_bonus.c \
			libft/ft_lstclear_bonus.c libft/ft_lstdelone_bonus.c \
			libft/ft_lstiter_bonus.c libft/ft_lstlast_bonus.c \
			libft/ft_lstmap_bonus.c libft/ft_lstnew_bonus.c \
			libft/ft_lstsize_bonus.c

LIBFT_OBJS = $(LIBFT_SRC:.c=.o)

CC		= cc
CFLAGS	= -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT_OBJS)
	rm -f $(NAME)
	ar rcs $(NAME) $(OBJS) $(LIBFT_OBJS)

clean:
	rm -f $(OBJS) $(LIBFT_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
