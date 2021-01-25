import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  // ------TABLE -1-COMPANY PROFILE TABLE------------
  static const String companyProfileTable = 'companyProfile_table';
  String comId = 'id';
  String comName = 'name';
  String comAddress = 'address';
  String comCity = 'city';
  String comState = 'state';
  String comCountry = 'Country';
  String comEmail = 'email';
  String comGsttin = 'gstTin';
  String comPhoneNumber = 'phoneNumber';

  // -----TABLE -2 ACCOUNTING YEAR TABLE----------

  // -------TABLE -3 LEDGER MASTER TABLE----------
  static const String masterLedgerTable = 'masterLedger_table';
  String mledgerId = 'id';
  String mledgerName = 'name';
  String mledgerDescription = 'description';

  // -----TABLE 4-TRANSACTION TYPE TABLE-----------
  String transactionTypeTable = 'transactionType_table';
  String transactionTypeId = 'id';
  String transactionTypeName = 'name';
  String transactionTypeDescription = 'description';
  String transactionTypeType = 'type';
  String transactionTypedebitSideLedger = 'debitSideLedger';
  String transactionTypecreditSideLedger = 'creditSideLedger';

  //------TABLE 5 TRANSACTION TABLE ---------------
  String transactionTable = 'transaction_table';
  String transactionId = 'id';
  String transactionAmount = 'amount';
  String transactionDate = 'date';
  String transactionParticulars = 'particulars';
  String transactionTransactionTypeId = 'transactionTypeId';
  String transactionBaOrPektlak = 'baOrPektlak';
  String transactionCashOrBank = 'cashOrBank';

  //------TABLE 6 LEDGER TRANSACTION TABLE---------
  String ledgerTransactionTable = 'ledgerTranction_table';
  String ledgerTransactionId = 'id';
  String ledgerTransactionLedgerId = 'ledgerId';
  String ledgerTransactionDate = 'date';
  String ledgerTransactionAmount = 'amount';
  String ledgerTransactionParticular = 'particular';
  String ledgerTransactionDebitOrCredit = 'debitOrCredit';
  String ledgerTransactionCashOrBank = 'cashOrBank';

  //------TABLE 7 AUTHENTICATION PIN

  Future<Database> get db async {
    if (_db == null) {
      print('null');
      _db = await _initDb();
    }
    print(_db.toString());
    return _db;
  }

// To enable foreign key in sqflite
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDb() async {
    print('inside initiDb');
    Directory dir = await getApplicationDocumentsDirectory();
    print('database location :' + dir.path);

    String path = dir.path + '/account_manager.db';
    print('path is $path');
    final accountManagerDb = await openDatabase(
      path,
      version: 2,
      onCreate: _createDb,
      onConfigure: _onConfigure,
    );
    return accountManagerDb;
  }

  void _createDb(Database db, int version) async {
    // Table 1- Company Profile
    await db.execute(
      'CREATE TABLE $companyProfileTable($comId INTEGER PRIMARY KEY AUTOINCREMENT, $comName TEXT, $mledgerDescription TEXT)',
    );
    // Table 2- Accounting Year

    // Table 3 - LedgerMaster Table
    await db.execute(
      'CREATE TABLE $masterLedgerTable($mledgerId INTEGER PRIMARY KEY AUTOINCREMENT, $mledgerName TEXT, $mledgerDescription TEXT)',
    );
    // Table 4 - TransactionType Table
    await db.execute(
      'CREATE TABLE $transactionTypeTable($transactionTypeId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionTypeName TEXT, $transactionTypeDescription TEXT, $transactionTypeType INT,$transactionTypedebitSideLedger INT,$transactionTypecreditSideLedger INT)',
    );
    // Table 5 - Transaction Table
    await db.execute(
      'CREATE TABLE $transactionTable($transactionId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionAmount INT, $transactionDate TEXT, $transactionParticulars TEXT, $transactionTransactionTypeId INTEGER, $transactionBaOrPektlak INTEGER,$transactionCashOrBank INTEGER)',
    );
    // Table 6 - Ledger Transaction Table
    await db.execute(
      'CREATE TABLE $ledgerTransactionTable($ledgerTransactionId INTEGER PRIMARY KEY AUTOINCREMENT, $ledgerTransactionLedgerId INT, $transactionDate TEXT, $ledgerTransactionAmount INT, $ledgerTransactionParticular TEXT, $ledgerTransactionDebitOrCredit INTEGER,$ledgerTransactionCashOrBank INTEGER)',
    );

    // Table 7 - Authenticaion PIN
  }
}
