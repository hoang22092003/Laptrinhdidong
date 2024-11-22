/*
Bai tap GPT ax^2 +bx+c=0
*/
import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;
  //input a
  do {
    stdout.write('Nhap he so a(a khac 0): ');
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      a = double.tryParse(inputA) ?? 0;
    }
    if (a == 0) {
      print('Vui long nhap lai');
    }
  } while (a == 0);

  //input b
  stdout.write('Nhap he so b(b khac 0): ');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }

  //input c
  stdout.write('Nhap he so c(c khac 0): ');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  //Tinh delta
  double delta = b*b - 4*a*c;
  
  //Hien thi Phuong trinh:
  print('Phuong trinh: ${a}x^2 + ${b}x + ${c} = 0');

  //GPT
  if(delta < 0){
    print('Phuong trinh vo nghiem');
  }
  else if(delta == 0){
    double x = -b/(2*a);
    x = double.parse(x.toStringAsFixed(2));
    print('Phuong trinh co 1 nghiem: x= $x');
  }
  else{
    double x1=(-b + sqrt(delta)) / (2*a);
    double x2=(-b - sqrt(delta)) / (2*a);

    x1 = double.parse(x1.toStringAsFixed(2));
    x2 = double.parse(x2.toStringAsFixed(2));

    print('Phuong trinh co 2 nghiem: ');
    print('x1= $x1');
    print('x1= $x2');
  }
}
