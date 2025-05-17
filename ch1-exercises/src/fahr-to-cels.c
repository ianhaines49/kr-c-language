#include <stdio.h>

/* function that prints out fahrenheit temperature range from 0 to 300
   in steps of 20 and the corresponding celsius temperature too */

int main(void)
{
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;      /* lower limit of temperature scale */
    upper = 300;    /* upper limit of temperature scale */
    step = 10;      /* step size */

    fahr = lower;
    printf("Fahrenheit  Celsius\n");
    while (fahr <= upper)
    {
        celsius = 5 * (fahr - 32) / 9;
        printf("%d\t\t%d\n", fahr, celsius);
        fahr = fahr + step;
    }
    return 0;
}