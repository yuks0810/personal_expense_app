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
      // SIngleChildScrollView()とListView(children: [])の組み合わせは は見えていない箇所のリストまで表示するのでメモリ負荷が高い
      // ListView.bui.der() 見えていないリストは表示されないのでメモリ負荷が低い
      height: 300,
      child: ListView.builder(
        // itemBuilderでindexとそれぞれのtransactionsをeachで回しているような感じ
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  // 値段の周りにボーダーを表示
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  // 値段の周りにpaddingを追加
                  padding: EdgeInsets.all(10),
                  // 商品の値段を表示
                  child: Text(
                    // amountはdoubleなのでtoStringでstring型に直す必要がある。
                    '${transactions[index].amount.toStringAsFixed(2)}円', // '\$${tx.amount}',
                    // 値段の文字を装飾する
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // 商品タイトルをColumnのなかに表示
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    // 商品の購入日を表示
                    Text(
                      DateFormat.yMd().add_jm().format(transactions[index]
                          .date), // import 'package:intl/intl.dart';でimportした日付フォーマットを使っている
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        // 何個のリストがあるかを指定する
        itemCount: transactions.length,
      ),
    );
  }
}
