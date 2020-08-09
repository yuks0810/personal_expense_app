import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // user_transaction.dartで定義されている_addNewTransactionをaddTxというメソッド名に定義し直して実行できるようにする。
  // 関数を定義して、その関数をchildとかで使いたいクラスに渡して、使いたいクラス上でfinal Function [メソッド名]で定義することで外部からprivateメソッドにアクセスできる
  final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(
        amountController.text); // int.parseでもしint以外の数値を入力された場合にエラーを返すようになる。

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // 値段がマイナスの時とTitleが空の時はreturnで返す
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

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
              // 数字だけのキーボードがポップアップする
              keyboardType: TextInputType.number,
              // doneボタンが押された時に発火するようにする
              // 無名関数を定義する
              // (_)として使わない引数をアンダースコアにするのは慣習
              onSubmitted: (_) => submitData,
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
              // 新しくトランザクションを追加するのに使用するメソッドを呼び出している
              // 引数はuser_transaction.dartで引数として定義されている
              // addTx(
              //   titleController.text,
              //   int.parse(amountController
              //       .text), // int.parseでもしint以外の数値を入力された場合にエラーを返すようになる。
              // );
            ),
          ],
        ),
      ),
    );
  }
}
