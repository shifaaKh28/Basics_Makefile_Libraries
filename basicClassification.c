
/*in this file we implemnt the isPrime and isStrong methods*/
#include "NumClass.h"
int isPrime(int n) {
        for (int i = 2; i * i <= n; ++i) {
            if (n % i == 0) {
                return 0;  // If the number is divisible by any number between 2 and sqrt(num), it's not prime
            }
        }

        return 1; //true
    }

//helper method to find factorial for any number
int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
int isStrong(int n){
    int copy =n;
    int sum=0;
      while (n>0){
        int digit= n%10;//find each digit in the number
        sum+= factorial(digit);
        n/=10;
    }
      if(sum==copy){
          return 1;
      }
    return 0;
}
