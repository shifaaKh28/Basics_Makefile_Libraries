#include <stdio.h>
#include "NumClass.h"

int main() {
	int num1,num2;
	int i;

	scanf("%d%d",&num1,&num2);

	printf("The Armstrong numbers are:");
	for (i = num1; i <= num2; i++) {
		if (isArmstrong(i)) printf(" %d",i);
	}
	printf("\nThe Palindromes are:");
	for (i = num1; i <= num2; i++) {
		if (isPalindrome(i)) printf(" %d",i);
	}
	printf("\nThe Prime numbers are:");
	for (i = num1; i <= num2; i++) {
		if (isPrime(i)) printf(" %d",i);
	}
	printf("\nThe Strong numbers are:");
	for (i = num1; i <= num2; i++) {
		if (isStrong(i)) printf(" %d",i);
	}
	printf("\n");

	return 0;
}
