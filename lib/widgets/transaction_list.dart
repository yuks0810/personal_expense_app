import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Containerの高さを指定することでその中でスクロールをすることができる
      // SingleChildScrollViewを設定することでその子要素をスクロールすることができる
      height: 300,
      child: SingleChildScrollView(
              child: Column(
          children: transactions.map((tx) {
            // mapでリストの数分eachを回しているような感じ
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    // 値段の周りにボーダーを表示
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                    // 値段の周りにpaddingを追加
                    padding: EdgeInsets.all(10),
                    // 商品の値段を表示
                    child: Text(
                      // amountはdoubleなのでtoStringでstring型に直す必要がある。
                      '${tx.amount}円', // '\$${tx.amount}',
                      // 値段の文字を装飾する
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 商品タイトルをColumnのなかに表示
                      Text(
                        tx.title,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      // 商品の購入日を表示
                      Text(
                        DateFormat.yMd().add_jm().format(tx
                            .date), // import 'package:intl/intl.dart';でimportした日付フォーマットを使っている
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
