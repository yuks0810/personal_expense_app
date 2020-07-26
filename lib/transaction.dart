import 'package:flutter/material.dart';

class Transaction {
  String id;
  String title;
  int amount;
  DateTime data;

  Transaction({
      @required this.id,
      @required this.title,
      @required this.amount,
      @required this.data});
}
