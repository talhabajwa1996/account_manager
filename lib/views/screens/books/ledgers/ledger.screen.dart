import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/business_logic/view_models/books/ledger/ledger.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ledger extends StatefulWidget {
  final int ledgerId;
  Ledger({Key key, this.ledgerId}) : super(key: key);

  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LedgerViewModel>(
      builder: (context, model, child) {
        model.getData(
          id: widget.ledgerId,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        );

        return SafeArea(
          child: Scaffold(
            body: Container(
              child: Text('Ledger'),
            ),
          ),
        );
      },
    );
  }
}
