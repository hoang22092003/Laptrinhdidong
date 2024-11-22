/*
Bai tap 07:
1. Viết chương trình tính tổng các ước số của một số nguyên được nhập từ bàn phím (n>=1)
*/

import 'dart:io';

void main(){
  int n=0;
  //input n
  do{
    stdout.write('Nhap so nguyen n(n lớn hơn hoặc bằng 1): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      n = int.tryParse(input) ?? 0;
    }
    if (n < 1) {
      print('Vui long nhap lai');
    }
  }while(n < 1);

  //Tính tổng các ước số của số nguyên n
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  print("Tổng các ước số của $n là: $sum");
}