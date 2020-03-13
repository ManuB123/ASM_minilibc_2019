/*
** EPITECH PROJECT, 2020
** unit_tests
** File description:
** unit_tests
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

size_t my_strlen(const char *);
char *my_strchr(const char *, int c);
void *my_memset(void *, int, size_t);
void *my_memcpy(void *, const void *, size_t);
int my_strcmp(const char *, const char *);
void *my_memmove(void *, const void *, size_t);
int my_strcasecmp(const char *, const char *);
char *my_rindex(const char *, int);
char *my_strstr(const char *, const char *);
char *my_strpbrk(const char *, const char *);
size_t my_strcspn(const char *, const char *);

void redirect_stdout()
{
    cr_redirect_stdout();
}

void redirect_stderr()
{
    cr_redirect_stderr();
}

Test(strlen, basicmy_strlen)
{
    cr_assert_eq(my_strlen("test 123"), 8);
    cr_assert_eq(my_strlen(""), 0);
}

Test(strchr, basicmy_strchr)
{
    cr_assert_eq(my_strchr("je suis caca", 'c'), strchr("je suis caca", 'c'));
    cr_assert_str_eq(my_strchr("je suis caca", 'c'), strchr("je suis caca", 'c'));
    cr_assert_eq(my_strchr("je suis caca", 'p'), strchr("je suis caca", 'p'));
    cr_assert_str_eq(my_strchr("", 0), strchr("", 0));
    cr_assert_str_eq(my_strchr("teststsisa, issou la choncle", 's'), strchr("teststsisa, issou la choncle", 's'));
    cr_assert_str_eq(my_strchr("teststsisa, issou la choncle", '\0'), strchr("teststsisa, issou la choncle", '\0'));
}

Test(memset, basicmy_memset)
{
    char *issou = malloc(sizeof(char) * 10);
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';

    cr_assert_str_eq(my_memset(issou, 0, 10), memset(issou, 0, 10));
    cr_assert_str_eq(my_memset(issou, 'd', 10), memset(issou, 'd', 10));
    cr_assert_str_eq(my_memset(issou, 0, 5), memset(issou, 0, 5));
}

Test(memcopy, basic_memcopy)
{
    char *issou = malloc(sizeof(char) * 10);

    cr_assert_str_eq(my_memcpy(issou, "Lopes", 5), memcpy(issou, "Lopes", 5));
    cr_assert_str_eq(my_memcpy(issou, "Lopes", 2), memcpy(issou, "Lopes", 2));
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';
    cr_assert_str_eq(my_memcpy(issou, "Lopes", 5), memcpy(issou, "Lopes", 5));
}

Test(strcmp, basicmy_strcmp)
{
    int first_value = 0;
    int second_value = 0;

    cr_assert_eq(my_strcmp("ISSOU", "ISSOU"), strcmp("ISSOU", "ISSOU"));
    cr_assert_eq(my_strcmp("issou1", "issou1"), strcmp("issou1", "issou1"));
    first_value = my_strcmp("issou1", "issou123");
    second_value = strcmp("issou1", "issou123");
    if (first_value < 0)
        first_value = -1;
    else if (first_value > 0)
        first_value = 1;
    if (second_value < 0)
        second_value = -1;
    else if (second_value > 0)
        second_value = 1;
    cr_assert_eq(first_value, second_value);
}

Test(memmove, basicmy_memmove)
{
    char str[] = "issou-lopes";
    char str2[] = "foo-bar";
    char *issou = malloc(sizeof(char) * 10);

    cr_assert_eq(my_memmove(&(str[3]), &(str[4]), 8),
    memmove(&(str[3]), &(str[4]), 8));
    cr_assert_eq(my_memmove(&(str2[3]), &(str2[4]), 4),
    memmove(&(str2[3]), &(str2[4]), 4));
    cr_assert_str_eq(my_memmove(issou, "Lopes", 5), memmove(issou, "Lopes", 5));
    cr_assert_str_eq(my_memmove(issou, "Lopes", 2), memmove(issou, "Lopes", 2));
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';
    cr_assert_str_eq(my_memmove(issou, "Lopes", 5), memmove(issou, "Lopes", 5));
}

Test(strcasecmp, basicmy_strcasecmp)
{
    int first_value = 0;
    int second_value = 0;

    cr_assert_eq(my_strcasecmp("ISSOU", "ISSOU"), strcasecmp("ISSOU", "ISSOU"));
    cr_assert_eq(my_strcasecmp("ISSOU", "issou"), strcasecmp("ISSOU", "issou"));
    cr_assert_eq(my_strcasecmp("IsSoU1", "issou1"),
    strcasecmp("IsSoU1", "issou1"));
    first_value = my_strcasecmp("isSou1", "issou123");
    second_value = strcasecmp("isSou1", "issou123");
    if (first_value < 0)
        first_value = -1;
    else if (first_value > 0)
        first_value = 1;
    if (second_value < 0)
        second_value = -1;
    else if (second_value > 0)
        second_value = 1;
    cr_assert_eq(first_value, second_value);
}

Test(rindex, basicmy_rindex)
{
    cr_assert_str_eq(my_rindex("Test lopes", 't'), rindex("Test lopes", 't'));
    cr_assert_eq(my_rindex("Test lopes", 'z'), rindex("Test lopes", 'z'));
}

Test(strstr, basicmy_strstr)
{
    cr_assert_str_eq(my_strstr("Test lopes", "Test"), strstr("Test lopes", "Test"));
    cr_assert_eq(my_strstr("Test lopes", "issou"), strstr("Test lopes", "issou"));
    cr_assert_eq(my_strstr("", "issou"), strstr("", "issou"));
    cr_assert_eq(my_strstr("issou", ""), strstr("issou", ""));
    cr_assert_eq(my_strstr("", ""), strstr("", ""));
    cr_assert_str_eq(my_strstr("testesti", "testi"), strstr("testesti", "testi"));
}

Test(strpbrk, basicmy_strpbrk)
{
    cr_assert_str_eq(my_strpbrk("issou je suis la", "ju"),
    strpbrk("issou je suis la", "ju"));
    cr_assert_eq(my_strpbrk("issou je suis la", "z"),
    strpbrk("issou je suis la", "z"));
    cr_assert_eq(my_strpbrk("issou je suis la", ""),
    strpbrk("issou je suis la", ""));
    cr_assert_eq(my_strpbrk("", "ju"), strpbrk("", "ju"));
}

Test(strcspn, basicmy_strcspn)
{
    cr_assert_eq(my_strcspn("issou", "chancla"), strcspn("issou", "chancla"));
    cr_assert_eq(my_strcspn("issou", "choncle"), strcspn("issou", "choncle"));
    cr_assert_eq(my_strcspn("abcde", "dpd"), strcspn("abcde", "dpd"));
    cr_assert_eq(my_strcspn("abcde", ""), strcspn("abcde", ""));
    cr_assert_eq(my_strcspn("", "abcde"), strcspn("", "abcde"));
}
