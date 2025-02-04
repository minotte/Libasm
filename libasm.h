#ifndef LIBASM_H
#define LIBASM_H

size_t      ft_strlen(const char *s);
char        *ft_strcpy(char *dst, const char *src);
int         ft_strcmp(const char *s1, const char *s2);
ssize_t     ft_write(int fd, const void *buf, size_t count);

#endif