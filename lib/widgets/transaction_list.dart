import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: [
                Text(
                  'no transaction addded yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
    //ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       // return Card(
    //       //   child: Row(
    //       //     children: [
    //       //       Container(
    //       //         decoration: BoxDecoration(
    //       //             border: Border.all(
    //       //           color: Colors.purple,
    //       //           width: 2,
    //       //         )),
    //       //         padding: EdgeInsets.all(10),
    //       //         margin:
    //       //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //       //         child: Text(
    //       //           ' \$${transactions[index].amount.toStringAsFixed(2)}',
    //       //           style: TextStyle(
    //       //             fontWeight: FontWeight.bold,
    //       //             fontSize: 20,
    //       //             color: Theme.of(context).primaryColor,
    //       //           ),
    //       //         ),
    //       //       ),
    //       //       Column(
    //       //         crossAxisAlignment: CrossAxisAlignment.start,
    //       //         children: [
    //       //           Text(
    //       //             transactions[index].title.toString(),
    //       //             style: Theme.of(context).textTheme.title,
    //       //           ),
    //       //           Text(
    //       //             DateFormat.yMd()
    //       //                 .add_jm()
    //       //                 .format(transactions[index].date),
    //       //             style: TextStyle(
    //       //               fontSize: 9,
    //       //               color: Theme.of(context).primaryColor,
    //       //             ),
    //       //           ),
    //       //         ],
    //       //       )
    //       //     ],
    //       //   ),
    //       // );

    //       return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
    //     },
    //     itemCount: transactions.length,
    //   );
  }
}
