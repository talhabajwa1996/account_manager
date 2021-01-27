import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelect extends StatelessWidget {
  final TransactionTypeSelectViewModel _model =
      serviceLocator<TransactionTypeSelectViewModel>();
  TransactionTypeSelect() {
    _model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Please Select Transaction Type',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<TransactionTypeSelectViewModel>(
                builder: (context, transactionTypeSelect, child) {
                  transactionTypeSelect.countTransactionTypeList();
                  return ListView.builder(
                    itemCount: transactionTypeSelect.transactionTypeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('test');
                      //   if (transactionType.checkTransactionTypeForSelection(
                      //       transactionType.transactionTypes[index].id)) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         transactionType.deSelectTransactionType(
                      //             transactionType.transactionTypes[index].id);
                      //       },
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             color: Colors.green.shade300,
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Text(transactionType
                      //                   .transactionTypes[index].name),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }
                      //   return GestureDetector(
                      //     onTap: () {
                      //       transactionType.setTransactionType(
                      //           transactionType.transactionTypes[index].id);
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         height: 50,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //             color: Colors.green.shade300,
                      //           ),
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(transactionType
                      //                 .transactionTypes[index].name),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
  }
}
