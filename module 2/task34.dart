import 'dart:io';
import 'package:ascii_qr/ascii_qr.dart';

void main()
{
  print("Enter String convert QR ");
  String text = stdin.readLineSync().toString();
  String qr = AsciiQrGenerator.generate(text);
  print(qr);
}
