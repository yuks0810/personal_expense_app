import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    // setStateはStateをextendしているStateクラスの中で呼び出すことができる。
    // setStateによって、build WidgetをrebuildしてStateを変化させる
    // 
    setState(() {
      // _userTransactions = new_value のように再代入することはできない（_userTransactionsがfinalのため）
      // その代わりにaddメソッドで、final newTxとして定義した変数を追加することで新しいトランザクションが追加される
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // _addNewTransactionはprivateメソッドなので、外からアクセスできるようにしている。
        // new_transaction.dartのNewTransactionクラスに渡して、そのファイルでメソッドを定義することで外側から
        // このメソッドにアクセスできるようになる
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ], // _userTransactions変数で、transaction_list.dartのfinal List<Transaction> transactions;にTransactionデータを渡している
    );
  }
}
