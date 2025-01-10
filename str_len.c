#include <stdio.h>

int ft_strlen(char *str)
{
    int i;

    i = 0;
    while(str[i])
    {
        i++;
    }
    return (i);
}

int main(int ac,char **av)
{ 
    char str[7] = "Bonjour";
    printf("Bonjour : %d lettre", ft_strlen(str));
    return (0);
}