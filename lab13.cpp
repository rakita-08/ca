#include <iostream>
using namespace std;

// Function to calculate the two's complement of a binary number
void complement(int a[], int n) {
   int i;
   int x[8] = {0}; // Initialize with zeros
   x[0] = 1;
   for (i = 0; i < n; i++) {
      a[i] = (a[i] + 1) % 2; // Flip bits
   }
   // Add 1 to the flipped bits
   int carry = 0;
   for (i = n - 1; i >= 0; i--) {
      a[i] = a[i] + x[i] + carry;
      if (a[i] > 1) {
         a[i] = a[i] % 2;
         carry = 1;
      } else {
         carry = 0;
      }
   }
}

// Function to add two binary numbers
void add(int ac[], int x[], int n) {
   int i, carry = 0;
   for (i = n - 1; i >= 0; i--) {
      ac[i] = ac[i] + x[i] + carry;
      if (ac[i] > 1) {
         ac[i] = ac[i] % 2;
         carry = 1;
      } else {
         carry = 0;
      }
   }
}

// Function to perform arithmetic shift right
void ashr(int ac[], int qr[], int &qn, int n) {
   int temp = ac[0];
   qn = qr[0];
   cout << "\t\tashr\t\t";
   for (int i = 0; i < n - 1; i++) {
      ac[i] = ac[i + 1];
      qr[i] = qr[i + 1];
   }
   qr[n - 1] = temp;
}

// Function to display binary numbers
void display(int ac[], int qr[], int n) {
   for (int i = n - 1; i >= 0; i--)
      cout << ac[i];
   cout << " ";
   for (int i = n - 1; i >= 0; i--)
      cout << qr[i];
}

int main() {
   int multiplicand[10], multiplier[10], qr[10], ac[10] = {0};
   int multiplicandBits, multiplierBits, i, qn = 0, temp = 0, shiftCount;

   cout << "\n--Enter the multiplicand and multiplier in signed 2's complement form if negative--";
   cout << "\n Number of multiplicand bits: ";
   cin >> multiplicandBits;
   cout << "\nMultiplicand: ";
   for (i = multiplicandBits - 1; i >= 0; i--)
      cin >> multiplicand[i];

   int mt[10];
   for (i = multiplicandBits - 1; i >= 0; i--)
      mt[i] = multiplicand[i];
   complement(mt, multiplicandBits);

   cout << "\nNumber of multiplier bits: ";
   cin >> multiplierBits;
   shiftCount = multiplierBits;
   cout << "Multiplier: ";
   for (i = multiplierBits - 1; i >= 0; i--)
      cin >> qr[i];

   cout << "qn\tq[n+1]\t\tBR\t\tAC\tQR\t\tsc\n";
   cout << "\t\t\tinitial\t\t";
   display(ac, qr, multiplierBits);
   cout << "\t\t" << shiftCount << "\n";

   while (shiftCount != 0) {
      cout << qr[0] << "\t" << qn;
      if ((qn + qr[0]) == 1) {
         if (temp == 0) {
            add(ac, mt, multiplierBits);
            cout << "\t\tsubtracting BR\t";
            for (i = multiplierBits - 1; i >= 0; i--)
               cout << ac[i];
            temp = 1;
         } else if (temp == 1) {
            add(ac, multiplicand, multiplierBits);
            cout << "\t\tadding BR\t";
            for (i = multiplierBits - 1; i >= 0; i--)
               cout << ac[i];
            temp = 0;
         }
      }
      cout << "\n\t";
      ashr(ac, qr, qn, multiplierBits);
      display(ac, qr, multiplierBits);
      cout << "\t";
      shiftCount--;
      cout << "\t" << shiftCount << "\n";
   }

   cout << "Result = ";
   display(ac, qr, multiplierBits);
   return 0;
}
