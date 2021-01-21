import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';

class LedgerMasterImpl implements LedgerMasterService {
  List<LedgerMaster> _list = [
    LedgerMaster(
      id: 1,
      name: 'Cash Account',
    ),
    LedgerMaster(
      id: 2,
      name: 'Purchase Account',
    ),
  ];

  @override
  Future<List<LedgerMaster>> getLedgerMasterList() async {
    return _list;
  }

  // Saving new Ledger Master
  @override
  Future<void> createNewLedgerMaster(LedgerMaster data) async {
    _list.add(data);
  }
}
