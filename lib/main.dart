import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';
import 'package:personal_expense_app/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'スニーカー',
      amount: 7000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: '日用品',
      amount: 12000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Columnのなかでどのようにそれぞれのカードを配置するかを決定する
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity, // 横幅いっぱいに広げる
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((tx) {
                // mapでリストの数分eachを回しているような感じ
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          // 商品の購入日を表示
                          Text(
                            DateFormat.yMd().add_jm().format(tx.date), // import 'package:intl/intl.dart';でimportした日付フォーマットを使っている
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class Colum {}
