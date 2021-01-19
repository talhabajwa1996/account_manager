import 'package:account_manager/Data/transactionType.data.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class NewTransactionTypeViewModel extends ChangeNotifier {
  void newTransactionType(TransactionType transactionType) {
    transactionTypesData.add(transactionType);
  }

  List<int> getSelectedLedger() {
    notifyListeners();
    return selectedLedgers;
  }

  int countSelectedLedgers() {
    notifyListeners();
    return selectedLedgers.length;
  }
}
