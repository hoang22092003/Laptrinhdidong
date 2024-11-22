/*
Bai tap 06:
1. Viết chương trình chuyển đổi 1 số nguyên (n>=1) được nhập từ bàn phím thành số nhị phân
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

  //Chuyển đổi thành số nhị phân
  String toBinary(int n) {
    return n.toRadixString(2);
  }
  String binary = toBinary(n);
  print('Số $n trong hệ nhị phân là $binary');
}