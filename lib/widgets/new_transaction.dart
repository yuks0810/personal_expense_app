import 'package:flutter/material.dart';

import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  // user_transaction.dartで定義されている_addNewTransactionをaddTxというメソッド名に定義し直して実行できるようにする。
  // 関数を定義して、その関数をchildとかで使いたいクラスに渡して、使いたいクラス上でfinal Function [メソッド名]で定義することで外部からprivateメソッドにアクセスできる
  final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, //ボタンを右側に配置Ï
          children: <Widget>[
            // TextFieldでキーボードがポップアップするinputを表示可能
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              //   // onChangedのトリガー後の処理を書く
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                // 新しくトランザクションを追加するのに使用するメソッドを呼び出している
                // 引数はuser_transaction.dartで引数として定義されている
                addTx(
                  titleController.text,
                  int.parse(amountController.text), // int.parseでもしint以外の数値を入力された場合にエラーを返すようになる。
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
