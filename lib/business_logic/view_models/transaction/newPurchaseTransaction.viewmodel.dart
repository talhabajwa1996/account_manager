import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/purchaseType.constant.dart';

import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import '../../../static/ledgerId.constants.dart';

import '../../models/transactionType.models.dart';

import '../../../services/transaction/transaction.service.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

class NewPurchaseTransactionViewModel extends ChangeNotifier {
  int _amount;
  String _particular; //--user input
  int _isCredit = cCashDown; //user input
  int _cashOrBank = CASH; //user input
  DateTime _date = DateTime.now(); //user input
  int _baType = cCredit; //BA partial or Full --user input
  int _partyId; //user purchase is made by BA
  String _partyName; //Computed
  int _assetLedger; //if the purchase is of asset//user input
  String _assetLedgerName;
  int _transactionTypeId = 0;
  String _transactionTypeName = ''; //user input
  // ignore: unused_field
  int _debitSideLedgerId; //computed-
  String _debitSideLedgerName; //computed --
//computed --
  // ignore: unused_field
  int _creditSideLedgerId;
  String _creditSideLedgerName; //--computer
  // ignore: unused_field
  int _purchaseType;
  List<LedgerMaster> partyList = [];

  // ignore: unused_field
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  // ignore: unused_field
  TransactionService _transactionService = serviceLocator<TransactionService>();
  // ignore: unused_field
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  List<TransactionType> transactionTypeList = [];
  void setTransactionTypeList(_searchString) async {
    transactionTypeList =
        await _transactionTypeService.getTransactionTypeList(_searchString);
    print(transactionTypeList.length.toString());
    notifyListeners();
  }

  // void setData() async {
  //   var _transactionTypeResult = await _transactionTypeService.getList(id: 1);

  //   if (_transactionTypeResult == null) {
  //     print('Transaction Type access fail');
  //   } else
  //     print(_transactionTypeResult.toString());
  //   TransactionType _transationType = _transactionTypeResult[0];
  //   String _transactionTypeName = _transationType.name;
  //   print('Transaction Type name $_transactionTypeName');

  //   // ----IF asset is bought it will go to debitsite
  //   if (_assetLedger != null) {
  //     _debitSideLedgerId = _assetLedger;
  //     if (_partyId != null && _baType == cCredit) {
  //       _creditSideLedgerId = _partyId;
  //       LedgerMaster ledgerMaster =
  //           await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
  //       _creditSideLedgerName = ledgerMaster.name;
  //       notifyListeners();
  //     } else if (_partyId != null && _baType == cPartialBA) {
  //       if (_cashOrBank == CASH) {
  //         _creditSideLedgerId = _transationType.creditSideLedger;
  //         LedgerMaster ledgerMaster =
  //             await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
  //         _creditSideLedgerName = ledgerMaster.name;
  //         notifyListeners();
  //       }
  //     }
  //   } else if (_assetLedger == null) {
  //     print('Not an asset');
  //     _debitSideLedgerId = _transationType.debitSideLedger;
  //     LedgerMaster ledgerMaster =
  //         await _ledgerMasterService.getLedgerMaster(_debitSideLedgerId);
  //     String _ledgerMasterName = ledgerMaster.name;
  //     print('Debit Side LedgerName $_ledgerMasterName');
  //     _debitSideLedgerName = ledgerMaster.name;
  //     if (_partyId != null && _baType == cCredit) {
  //       // Ba full a nih chuan
  //       // creditside ah partyLedger
  //       print('Party is not Null and Ba type is full');
  //       _creditSideLedgerId = _partyId;
  //       LedgerMaster ledgerMaster =
  //           await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
  //       _creditSideLedgerName = ledgerMaster.name;
  //       notifyListeners();
  //     } else if (_partyId != null && _baType == cPartialBA) {
  //       // Partial Ba ah
  //       // Credit Side ah Bank or Cash
  //       print('Party is not Null and Ba type is partial');
  //       if (_cashOrBank == CASH) {
  //         print(
  //             'Party is not Null and Ba type is partial, transaction is Cash');
  //         _creditSideLedgerId = _transationType.creditSideLedger;
  //         LedgerMaster ledgerMaster =
  //             await _ledgerMasterService.getLedgerMaster(LedgerID.CASHAC);
  //         _creditSideLedgerName = ledgerMaster.name;
  //         notifyListeners();
  //       } else if (_cashOrBank == BANK) {
  //         print(
  //             'Party is not Null and Ba type is partial, transaction is Bank');
  //         _creditSideLedgerId = _transationType.creditSideLedger;
  //         LedgerMaster ledgerMaster =
  //             await _ledgerMasterService.getLedgerMaster(LedgerID.BANK);
  //         _creditSideLedgerName = ledgerMaster.name;
  //         notifyListeners();
  //       }
  //     } else {
  //       if (_cashOrBank == CASH) {
  //         print('Asset Nilo, Ba lo leh Cash  a thil lei');
  //         _creditSideLedgerId = _transationType.creditSideLedger;
  //         LedgerMaster ledgerMaster =
  //             await _ledgerMasterService.getLedgerMaster(LedgerID.CASHAC);
  //         _creditSideLedgerName = ledgerMaster.name;
  //         notifyListeners();
  //       } else if (_cashOrBank == BANK) {
  //         print('Asset Nilo, Ba lo leh Bank  a thil lei');
  //         _creditSideLedgerId = _transationType.creditSideLedger;
  //         LedgerMaster ledgerMaster =
  //             await _ledgerMasterService.getLedgerMaster(LedgerID.BANK);
  //         _creditSideLedgerName = ledgerMaster.name;
  //         notifyListeners();
  //       }
  //     }
  //     printData();
  //   }

  //   notifyListeners();
  // }

  void setPurchaseType() async {
    if (_assetLedger != null) {
      //Transaction type is asset
      _debitSideLedgerId = _assetLedger;
      if (_isCredit == cCredit) {
        //Transaction is Ba
        if (_baType == cCredit) {
          print('assetBa Full = 3');
          _purchaseType = PurchaseType.assetDebt;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = _partyId;
        } else {
          if (_cashOrBank == CASH) {
            print('assetBaCashPartial = 4');
            _purchaseType = PurchaseType.assetDebtCashPartial;
            _debitSideLedgerId = _assetLedger;
            _creditSideLedgerId = LedgerID.CASHAC;
          } else if (_cashOrBank == BANK) {
            print('assetBaBankPartial = 5');
            _purchaseType = PurchaseType.assetDebtBankPartial;
            _debitSideLedgerId = _assetLedger;
            _creditSideLedgerId = LedgerID.CASHAC;
          }
        }
      }
      if (_isCredit == cCashDown) {
        //transaction Type is Balo
        if (_cashOrBank == CASH) {
          //Transaction Type is Cash
          print('assetBaloCash = 2');
          _purchaseType = PurchaseType.assetCashDownCash;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = LedgerID.CASHAC;
        } else if (_cashOrBank == BANK) {
          //Transaction Type is Bank
          print('assetBaloBank = 1');
          _purchaseType = PurchaseType.assetCashDownBank;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = LedgerID.BANK;
        }
      } else {
        _debitSideLedgerId = LedgerID.PURCHASEAC;
        if (_isCredit == cCredit) {
          //Transaction is Ba
          if (_baType == cCredit) {
            print('nonAssetDebt = 8');
            _purchaseType = PurchaseType.nonAssetDebt;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = _partyId;
          } else {
            if (_cashOrBank == CASH) {
              print('nonAssetDebtCashPartial = 9');
              _purchaseType = PurchaseType.nonAssetDebtCashPartial;
              _debitSideLedgerId = LedgerID.PURCHASEAC;
              _creditSideLedgerId = LedgerID.CASHAC;
            } else if (_cashOrBank == BANK) {
              print('nonAssetDebtBankPartial = 10');
              _purchaseType = PurchaseType.nonAssetDebtBankPartial;
              _debitSideLedgerId = LedgerID.PURCHASEAC;
              _creditSideLedgerId = LedgerID.BANK;
            }
          }
        }
        if (_isCredit == cCashDown) {
          //transaction Type is Balo
          if (_cashOrBank == CASH) {
            //Transaction Type is Cash
            print('nonAssetBaloCash = 7');
            _purchaseType = PurchaseType.nonAssetCashDownCash;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = LedgerID.CASHAC;
          } else if (_cashOrBank == BANK) {
            //Transaction Type is Bank
            print('nonAssetBaloBank = 6');
            _purchaseType = PurchaseType.nonAssetCashDownBank;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = LedgerID.BANK;
          }
        }
      }
    }
    _debitSideLedgerName =
        await _ledgerMasterService.getLedgerMasterName(_debitSideLedgerId);
    _creditSideLedgerName =
        await _ledgerMasterService.getLedgerMasterName(_creditSideLedgerId);
  }

  void saveData() {
    // Asset a nih chuan debit ah assetLedger
    // Asset a nih loh chuan Purchase Ac
    if (_assetLedger == cCredit) {
    } else {}
  }

  void printData() {
    print('Amount:$_amount');
    print('Particular:$_particular');
    print('Ba or Balo:$_isCredit');
    print('Cash or Bank:$_cashOrBank');
    print('Ba Type:$_baType');
    print('Party Id:$_partyId');
    print('Party Name :$_partyName');
  }

  void getFilterdPartyLedgerMaster(String _searchString) async {
    List<LedgerMaster> _ledgerMasterList =
        await _ledgerMasterService.getFilterdPartyLedgerList(_searchString);
    print(_searchString);
    String _length = _ledgerMasterList.length.toString();
    partyList = _ledgerMasterList;
    print('The search Returned $_length result in the viewmodel');
    notifyListeners();
  }

  Future<int> newPartyLedger({
    name,
    description,
  }) async {
    var payload = LedgerMaster(
        name: name,
        description: description,
        directOrIndirect: cDirectAc,
        party: cPartyAc,
        asset: cNonASSET);
    var result = await _ledgerMasterService.insert(payload);

    notifyListeners();
    return result;
  }

  void loadParty() async {
    final _partyList = await _ledgerMasterService.getPartyList();

    partyList = _partyList;
    notifyListeners();
  }

  void loadTransactionType() async {
    transactionTypeList = await _transactionTypeService.getList();
    notifyListeners();
  }

  int getAmount() => _amount;
  void setAmount(int value) {
    _amount = value;
    notifyListeners();
  }

  String getParticular() => _particular;
  void setParticular(String value) {
    _particular = value;
    notifyListeners();
  }

  int getBaOrBalo() => _isCredit;
  void setBaOrBalo(int value) {
    _isCredit = value;
    if (_isCredit == cCashDown) {
      _partyId = null;
      _partyName = null;
      notifyListeners();
    }
    notifyListeners();
  }

  int getCashOrBank() => _cashOrBank;
  void setCashOrBank(int value) {
    _cashOrBank = value;
    notifyListeners();
  }

  DateTime getDate() => _date;
  void setDate(DateTime value) {
    _date = value;
    notifyListeners();
  }

  int getBaType() => _baType;
  void setBaType(int value) {
    _baType = value;
    notifyListeners();
  }

  int getPartyId() => _partyId;
  void setPartyId(int value) {
    _partyId = value;
    print('The new party id is$_partyId');
    notifyListeners();
  }

  String getPartyName() => _partyName;
  void setPartyName(String value) {
    _partyName = value;
    notifyListeners();
  }

  int getAssetLedger() => _assetLedger;
  void setAssetLedger(int value) {
    _assetLedger = value;
    notifyListeners();
  }

  int getTransactionTypeId() => _transactionTypeId;
  void setTransactionTypeId(int value) {
    _transactionTypeId = value;
    notifyListeners();
  }

  String getTransactionTypeName() => _transactionTypeName;
  void setTransactionTypeName(String value) {
    _transactionTypeName = value;
    notifyListeners();
  }

  String getAssetLedgerName() => _assetLedgerName;
  String getDebitSideLedgerName() => _debitSideLedgerName;
  String getCreditSideLedgerName() => _creditSideLedgerName;

  //-------Transaction Type--------

}
