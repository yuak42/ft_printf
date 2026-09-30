# ft_printf

## 📖 About

**ft_printf** is a project from the 42 School curriculum. The goal of the project is to recreate a simplified version of the standard C `printf()` function.

The project introduces variadic functions and requires parsing formatted input, handling different data types, and converting values into their printable representations.

Implementing `ft_printf` provides practical experience with variadic arguments, string formatting, number conversion, pointer handling, and modular C programming.

## ⚙️ Function Prototype

```c
int ft_printf(const char *format, ...);
```

Similar to the standard `printf()`, the function takes a format string followed by a variable number of arguments.

It returns the total number of characters written.

## 🔤 Supported Conversions

The mandatory part supports the following conversion specifiers:

| Specifier | Description                                         |
| --------- | --------------------------------------------------- |
| `%c`      | Prints a single character                           |
| `%s`      | Prints a string                                     |
| `%p`      | Prints a pointer address in hexadecimal format      |
| `%d`      | Prints a signed decimal integer                     |
| `%i`      | Prints a signed integer                             |
| `%u`      | Prints an unsigned decimal integer                  |
| `%x`      | Prints an unsigned integer in lowercase hexadecimal |
| `%X`      | Prints an unsigned integer in uppercase hexadecimal |
| `%%`      | Prints a percent sign                               |

Example:

```c
ft_printf("Name: %s | Age: %d | Hex: %x\n", "Yunus", 22, 255);
```

Output:

```text
Name: Yunus | Age: 22 | Hex: ff
```

## 🧠 How It Works

`ft_printf` processes the format string one character at a time.

Normal characters are written directly to the output. When a `%` character is encountered, the following characters are parsed to determine how the corresponding argument should be formatted.

Conceptually:

```text
Format String
     │
     ▼
Read Character
     │
     ├── Normal character ──► Print directly
     │
     └── '%' found
             │
             ▼
        Parse format
             │
             ▼
       Get argument
       using va_arg()
             │
             ▼
      Convert / Format
             │
             ▼
           Print
```

Variadic arguments are handled using the macros provided by `<stdarg.h>`:

```c
va_list
va_start
va_arg
va_end
```

For example:

```c
va_list args;

va_start(args, format);
value = va_arg(args, int);
va_end(args);
```

The expected argument type is determined by the conversion specifier found in the format string.

## 🔢 Number Conversion

Several conversions require integers to be represented using different numerical bases.

For example:

```text
Decimal:      255
Hexadecimal:   ff
```

The `%d`, `%i`, and `%u` conversions use base 10, while `%x`, `%X`, and `%p` require hexadecimal representation.

This makes base conversion an important part of the project.

## ⭐ Bonus

The bonus implementation adds support for additional formatting options.

### Supported Flags

| Flag | Description                                       |
| ---- | ------------------------------------------------- |
| `-`  | Left-aligns the output within the specified width |
| `0`  | Pads numeric output with zeros                    |
| `#`  | Adds `0x` or `0X` prefix for hexadecimal values   |
| ` `  | Adds a space before positive signed numbers       |
| `+`  | Adds a sign before signed numbers                 |

### Width

A minimum field width can be specified:

```c
ft_printf("|%10d|", 42);
```

Output:

```text
|        42|
```

Using the `-` flag:

```c
ft_printf("|%-10d|", 42);
```

Output:

```text
|42        |
```

### Precision

Precision can control the minimum number of digits printed for numeric conversions or the maximum number of characters printed from a string.

```c
ft_printf("%.5d", 42);
```

Output:

```text
00042
```

For strings:

```c
ft_printf("%.5s", "Hello World");
```

Output:

```text
Hello
```

### Combining Formatting Options

Flags, width, and precision can also be combined:

```c
ft_printf("%-10.5d", 42);
```

This requires the format string to be parsed before the final output is generated.

## 🔍 Format Parsing

A formatted conversion can contain several components:

```text
%[flags][width][.precision][conversion]
```

For example:

```text
%-10.5d
```

can be interpreted as:

```text
%       → beginning of conversion
-       → left alignment
10      → minimum field width
.5      → precision
d       → signed decimal conversion
```

Parsing these components and determining how they interact is one of the main challenges of the bonus part of the project.

## 🚀 Getting Started

### Prerequisites

You will need:

- A C compiler such as `cc` or `gcc`
- `make`

### Compilation

Clone the repository:

```bash
git clone <repository-url>
cd ft_printf
```

Compile the library:

```bash
make
```

If the project contains the bonus implementation:

```bash
make bonus
```

Other available commands:

```bash
make clean
make fclean
make re
```

After compilation, the static library will be generated.

```text
libftprintf.a
```

## 💻 Usage

Include the header file:

```c
#include "ft_printf.h"
```

Example program:

```c
#include "ft_printf.h"

int main(void)
{
    ft_printf("Hello, %s!\n", "42");
    ft_printf("Decimal: %d\n", 42);
    ft_printf("Hexadecimal: %x\n", 255);
    ft_printf("Pointer: %p\n", (void *)"42");

    return (0);
}
```

Compile the program by linking the library:

```bash
cc main.c -L. -lftprintf -o printf_test
```

Then run:

```bash
./printf_test
```

## 🧪 Concepts Practiced

This project focuses on several important C programming concepts:

- Variadic functions
- Format string parsing
- Type handling
- Number base conversion
- Pointer representation
- String manipulation
- Output formatting
- Static libraries
- Modular program design
- Edge case handling

## 🛠️ Built With

- C
- Make
- CC

## 🎓 42 Project

This project was developed as part of the curriculum at **42 School**.
