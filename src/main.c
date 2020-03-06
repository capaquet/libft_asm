#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int     ft_strlen(char * str);
char    *ft_strcpy(char * dst, const char * src);
int     ft_strcmp(const char *s1, const char *s2);



int main()
{
    char *ipsum = "Avidis et administrante quam sese haec administrante sunt decuerat vini: potestate vulgus sunt et delatae vulgus potestate sese Orfitus inopiam administrante et doctrinarum seditiones avidis haec nobilem asperos administrante negotiorum graves Orfitus ad sese urbem regebat forensium negotiorum prudens administrante negotiorum decuerat vulgus administrante Orfitus et quidem minus vini: sunt prudens Orfitus concitatae efferens Orfitus motus institutus avidis graves ob prudens Orfitus concitatae doctrinarum seditiones sed quo usibus excitatur excitatur gnarus et splendore asperos ad asperos splendore forensium ultra inopiam avidis quo et decuerat efferens efferens ultra vir minus liberalium asperos urbem sed insolenter vulgus vini: ob excitatur ultra vir.\0";

    printf("\n----- STR_LEN -----\n");
    printf("Test1: str1 = \"\" | ft_strlen = %d | strlen  = %lu\n", ft_strlen(""), strlen(""));
    printf("Test2: str1 = a | ft_strlen = %d | strlen  = %lu\n", ft_strlen("a"), strlen("a"));
    printf("Test3: str1 = Coucou | ft_strlen = %d | strlen  = %lu\n", ft_strlen("Coucou"), strlen("Coucou"));
    printf("Test4: str1 = %s\nft_strlen = %d | strlen  = %lu\n", ipsum, ft_strlen(ipsum), strlen(ipsum));

    printf("\n----- STR_CPY -----\n");
    char *s1 = ""; char *s2 = malloc(1); char *s3 =  malloc(1);
    printf("Test1: \"\"\nft_strcpy = %p %p %s\nstrcpy  = %p %p %s\n", s2, ft_strcpy(s2, s1), s2, s3, strcpy(s3, s1), s3);
    free(s2);free(s3);

    char *s4 = "Coucou"; s2 = malloc(7); s3 =  malloc(7);
    printf("Test2: Coucou\nft_strcpy = %p %p %s\nstrcpy  = %p %p %s\n", s2, ft_strcpy(s2, s4), s2, s3, strcpy(s3, s4), s3);
    free(s2);free(s3);

    s2 = malloc(763); s3 =  malloc(763);
    printf("Test2: Coucou\nft_strcpy = %p %p %s\nstrcpy  = %p %p %s\n", s2, ft_strcpy(s2, ipsum), s2, s3, strcpy(s3, ipsum), s3);
    free(s2);free(s3);

    printf("\n----- STR_CMP -----\n");
    s1 = "aaaa"; s2 = "aaaa";
    printf("Test1: aaaa vs aaaa | ft_strcmp = %d | strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));    
    s1 = ""; s2 = "";
    printf("Test1: \"\" vs \"\" | ft_strcmp = %d | strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
    s1 = "ab"; s2 = "az";
    printf("Test2: ab vs az | ft_strcmp = %d | strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
    s1 = "ab"; s2 = "aG";
    printf("Test3: ab vs aG | ft_strcmp = %d | strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
    s1 = "aZ"; s2 = "aa";
    printf("Test4:  aZ vs aa | ft_strcmp = %d | strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
}