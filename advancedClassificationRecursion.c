#include "NumClass.h"
// Function to calculate the power of a number 
double pow2(double n,double exponent){
    if(exponent == 0){return 1;}
    double result = 1;
    for (int i = 0; i < exponent; ++i) {
        result *= n;
    }
    return result;
}
int countDigits(int n){
    int result = 0;
    while(n > 0){
        n/=10;
        result+=1;
    }
    return result;
}


/**
 * Recursive helper function to check if a number is an Armstrong number.
 * @param n The remaining part of the number.
 * @param original The original number for comparison.
 * @param digits The total number of digits in the original number.
 * @param ans The accumulated sum of digits raised to the power of digits.
 * @return 1 if the number is an Armstrong number, 0 otherwise.
 */
int isArmstrongHelper(int n,int original,int digits,int result) {
    if(n == 0){
        if(original == result){return 1;}
        return 0;
    }
    int digit = n%10;
    return isArmstrongHelper(n/10,original,digits, result + pow2(digit,digits));
}
/**
 * Recursive helper function to check if a subarray is a palindrome.
 * @param arr The array containing digits.
 * @param i The starting index of the subarray.
 * @param j The ending index of the subarray.
 * @return 1 if the subarray is a palindrome, 0 otherwise.
 */
int isPalindromeHelper(int arr[],int i, int j){
    if(i > j){return 1;}
    if(arr[i] == arr[j]){
        return isPalindromeHelper(arr,++i,--j);
    }
    return 0;
}

int isArmstrong(int n){
    int digits = countDigits(n);
    return isArmstrongHelper(n, n, digits, 0);
}

int isPalindrome(int n){
    int arr[countDigits(n)];
    int length = sizeof(arr)/sizeof(arr[0]);
    int temp = n;
    for (int i = length- 1; i >=0 ; --i) {
        arr[i] = temp%10;
        temp/=10;
    }

    return isPalindromeHelper(arr,0,length-1) ;
}