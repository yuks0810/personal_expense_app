import 'package:flutter/material.dart';

class Transaction {
  String id;
  String title;
  int amount; // doubleで小数点を表示できる
  DateTime date;

  Transaction({
      @required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
