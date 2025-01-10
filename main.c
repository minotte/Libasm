#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include "libasm.h"

int main() {
    // Test de ft_strlen
    const char *test_str = "Hello Word!";
    size_t len = ft_strlen(test_str);
    printf("Test ft_strlen:\n");
    printf("Input string: \"%s\"\n", test_str);
    printf("Length: %zu\n\n", len);
    printf("_______________________________________________________________\n\n");

    // Test de ft_strcpy
    char src[] = "test of ft_strcpy";
    char dest[100];

    ft_strcpy(dest, src);

    printf("Test ft_strcpy:\n");
    printf("Source: \"%s\"\n", src);
    printf("Destination: \"%s\"\n", dest);
   
    char src1[1];
    char dest1[100];

    src1[0] = '\0';

    ft_strcpy(dest1, src1);

    printf("Test ft_strcpy:\n");
    printf("Source: \"%s\"\n", src1);
    printf("Destination: \"%s\"\n", dest1);
    printf("_______________________________________________________________\n\n");
    // test strcmp
    printf("strcmp\n\n");
    int ret = strcmp("hello", "world");
    printf("hello and hello : %d\n", strcmp("hello", "hello")); 
    printf("hello and wo : %d\n", ret); 
    ret = strcmp("world", "hello");
    printf("word and  hello : %d\n", ret);
    ret = strcmp("abcd", "abc");
    printf("adc and adc but n = 5 :%d\n", ret);
    ret = strcmp("", "abc");
    printf("NULL and abc : %d\n", ret);      
    printf("--------------------------------------------------\n");
    printf("ft_strcmp\n");
    printf("hello and hello : %d\n", ft_strcmp("hello", "hello")); 
    printf("hello and wo : %d\n", ft_strcmp("hello", "world")); 
    printf("word and  hello : %d\n", ft_strcmp("world", "hello"));
    printf("adcd and adc : %d\n", ft_strcmp("abcd", "abc"));
    printf("NULL and abc : %d\n", ft_strcmp(NULL, "abc")); 

    printf("_______________________________________________________________\n\n");
    int fd3 =  open("./fd3", O_WRONLY | O_APPEND);
    printf("return write %zd \n", write(3, "abc", 2));
    printf("return write %zd \n", write(1, "ft_write ", 101));
    printf("return write %zd \n", write(2, "", -80));
    close(fd3);
    return (write(1, "fdil", 8));
}
