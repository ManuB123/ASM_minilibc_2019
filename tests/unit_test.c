/*
** EPITECH PROJECT, 2020
** ASM_minilibc_2019
** File description:
** unit_tests
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

#include <string.h>

size_t my_strlen(const char* str);
void *my_memcpy(void *dest, const void *src, size_t n);
char *my_rindex(const char *s, int c);
void *my_memset(void *s, int c, size_t n);
char *my_strstr(const char *haystack, const char *needle);
char *my_strpbrk(const char *, const char *);
size_t my_strcspn(const char *s, const char *reject);

Test(strlen, isou)
{
    cr_assert_eq(my_strlen("test"), strlen("test"));
    cr_assert_eq(my_strlen("0"), strlen("0"));
}

Test(rindex, test_rindex)
{
    cr_assert_eq(rindex("test", 'e'), my_rindex("test", 'e'));
    cr_assert_eq(rindex("test", 'z'), my_rindex("test", 'z'));
}

Test(memset, test_memset)
{
    char *test = strdup("test123");

    cr_assert_eq(memset(test, 0, 3), my_memset(test, 0, 3));
}

Test(strstr, test_strstr)
{
    cr_assert_str_eq(strstr("test yolo 123 test", "es"), my_strstr("test yolo 123 test", "es"));
    cr_assert_eq(strstr("test yolo 123 test", "zz"), my_strstr("test yolo 123 test", "zz"));
}

Test(strpbrk, basic_strpbrk)
{
    cr_assert_str_eq(my_strpbrk("issou je suis la", "ju"),
    strpbrk("issou je suis la", "ju"));
    cr_assert_eq(my_strpbrk("issou je suis la", "z"),
    strpbrk("issou je suis la", "z"));
    cr_assert_eq(my_strpbrk("issou je suis la", ""),
    strpbrk("issou je suis la", ""));
    cr_assert_eq(my_strpbrk("", "ju"), strpbrk("", "ju"));
}

Test(c, basic_strcspn)
{
    cr_assert_eq(my_strcspn("issou", "chancla"), strcspn("issou", "chancla"));
    cr_assert_eq(my_strcspn("issou", "choncle"), strcspn("issou", "choncle"));
    cr_assert_eq(my_strcspn("abcde", "dpd"), strcspn("abcde", "dpd"));
    cr_assert_eq(my_strcspn("abcde", ""), strcspn("abcde", ""));
    cr_assert_eq(my_strcspn("", "abcde"), strcspn("", "abcde"));
}