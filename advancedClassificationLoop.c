#include "NumClass.h"

// Function to calculate the power of a number 
double pow(double n,double exponent){
    if(exponent == 0){return 1;}
    double result = 1;
    for (int i = 0; i < exponent; ++i) {
        result *= n;
    }
    return result;
}

int isArmstrong(int n) {
    int temp = n, digits = 0;
    
    // Count the number of digits in n
    while (temp > 0) {
        digits++;
        temp /= 10;
    }
    
    int sum = 0;
    temp = n;
    
    // Calculate the sum of digits raised to the power of the number of digits
    while (temp > 0) {
        sum += pow(temp % 10, digits);
        temp /= 10;
    }
    
    // Check if the sum is equal to the original number
    return n == sum;
}
int isPalindrome(int n) {
    int temp = n;
    int reversed = 0;
    
    // Reverse the digits of n
    while (temp > 0) {
        reversed = reversed * 10 + temp % 10;
        temp /= 10;
    }
    
    // Check if the reversed number is equal to the original number
    return n == reversed;
}