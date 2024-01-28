#include "NumClass.h"

// Recursive function to calculate the power of a digit
double pow2(double n,double exponent){
    if(exponent == 0){return 1;}
    double result = 1;
    for (int i = 0; i < exponent; ++i) {
        result *= n;
    }
    return result;
}

// Recursive function to calculate the sum of digits raised to the power of the number of digits
int armstrongRecursive(int num, int d) {
    if (num == 0) {
        return 0;
    }
    return armstrongRecursive(num / 10, d) + pow2(num % 10, d);
}

// Recursive function to count the number of digits
int countDigits(int num) {
    if (num == 0) {
        return 0;
    }
    return 1 + countDigits(num / 10);
}

// Recursive function to reverse the digits of a number
int palindromeRecursive(int num, int reversed) {
    if (num == 0) {
        return reversed;
    }
    return palindromeRecursive(num / 10, (reversed * 10) + (num % 10));
}

// Function to check if a number is an Armstrong number
int isArmstrong(int num) {
    int d = countDigits(num);

    if (num == armstrongRecursive(num, d)) {
        return 1;
    }

    return 0;
}

// Function to check if a number is a palindrome
int isPalindrome(int num) {
    if (num == palindromeRecursive(num, 0)) {
        return 1;
    }

    return 0;
}
