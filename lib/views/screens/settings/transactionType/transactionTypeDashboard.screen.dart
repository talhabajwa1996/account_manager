import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeDashboard extends StatelessWidget {
  const TransactionTypeDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Type Dashboard'),
      ),
      body: Consumer<TransactionTypeViewModel>(
        builder: (context, transactiontype, child) {
          return Column(
            children: [
              Text('Number of Transaction Types'),
              Text(
                transactiontype.transactionTypes.length.toString(),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            rNewTransactionType,
          )
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
