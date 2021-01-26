import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class NewTransactionType extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

List<String> localData = ['Purchase Account', 'Sales account', 'Machinery'];

class _AppState extends State<NewTransactionType> {
  NewTransactionTypeViewModel _transactionTypeViewModel =
      serviceLocator<NewTransactionTypeViewModel>();
  Map<String, String> selectedDebitSideLedger = Map();
  Map<String, String> selectedCreditSideLedger = Map();
  String dropdownValue = 'Hralh';

  @override
  void initState() {
    _transactionTypeViewModel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<NewTransactionTypeViewModel>(
          builder: (context, model, child) {
            print(model.ledgerMasterList.length.toString());
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Container(
                        child: Center(
                          child: Text(
                            'New Transaction Type',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 13,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(fontSize: 16),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 13,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: TextField(
                            decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 16),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 13,
                      ),
                      child: Container(
                        width: 370,
                        child: DropdownButtonFormField<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),

                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Lei', 'Hralh', 'Lakluh', 'Pekchhuah']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      
                          decoration: InputDecoration(
                            labelText: 'Sum Chetna',
                            labelStyle: TextStyle(fontSize: 16.0),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 35,
                        horizontal: 13,
                      ),
                      child: Container(
                        width: 400,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     border: Border.all(color: Colors.green[300])),
                        child: debitSideLedgerSelect(localData, "local"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 35,
                        horizontal: 13,
                      ),
                      child: Container(
                        width: 400,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     border: Border.all(color: Colors.green[300])),
                        child: creditSideLedgerSelect(localData, "local"),
                      ),
                    ),
                    GestureDetector(
                      // onTap: () {
                      //   var _payload = TransactionType(
                      //     name: 'Purchase of Material',
                      //     description:
                      //         'Purchase of Material for Resell or Raw Material',
                      //     type: 1,
                      //     debitSideLedger: 1,
                      //     creditSideLedger: 1,
                      //   );
                      //   model.newTransactionType(_payload);
                      //   // Navigator.pushNamed(
                      //   //   context,
                      //   //   rTransactionTypeDashboard,
                      //   // );
                      // },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 420,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            border: Border.all(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget debitSideLedgerSelect(List<String> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: items,
      value: selectedDebitSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select Debit side Ledger',
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedDebitSideLedger[mapKey] = value;
        });
      },
    );
  }

  Widget creditSideLedgerSelect(List<String> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: items,
      value: selectedCreditSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text('Select Credit side Ledger'),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedCreditSideLedger[mapKey] = value;
        });
      },
    );
  }
}
