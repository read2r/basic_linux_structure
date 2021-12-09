#include <unistd.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <err.h>

#define MB_SIZE (1024 * 1024)
#define BUFFER_SIZE (100 * MB_SIZE)
#define NCYCLE 10
#define PAGE_SIZE 4096

int main(void) {
    char *p;
    time_t t;
    char *s;

    t = time(NULL);
    s = ctime(&t);
    printf("%.*s: before allocation, please press Enter key\n", (int)(strlen(s) - 1), s);
    getchar();

    p = malloc(BUFFER_SIZE);
    if (p == NULL)
        err(EXIT_FAILURE, "malloc() failed");

    t = time(NULL);
    s = ctime(&t);
    printf("%.*s: allocated %dMB, please press Enter key\n", (int)(strlen(s) - 1), s, BUFFER_SIZE / MB_SIZE);
    getchar();

    int i;
    for (i = 0; i < BUFFER_SIZE; i += PAGE_SIZE) {
        p[i] = 0;
        int cycle = i / (BUFFER_SIZE / NCYCLE);
        if (cycle != 0 && i % (BUFFER_SIZE / NCYCLE) == 0) {
            t = time(NULL);
            s = ctime(&t);
            printf("%.*s: touched %dMB\n", (int)(strlen(s) - 1), s, i / MB_SIZE);
            sleep(1);
        }
    }

    t = time(NULL);
    s = ctime(&t);
    printf("%.*s: touched %dMbB, please press Enter key\n", (int)(strlen(s) - 1), s, BUFFER_SIZE / MB_SIZE);
    getchar();

    exit(EXIT_SUCCESS);
}
