import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatefulWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  _LedgerMasterDashboardState createState() => _LedgerMasterDashboardState();
}

class _LedgerMasterDashboardState extends State<LedgerMasterDashboard> {
  LedgerMasterDashboardViewModel _model =
      serviceLocator<LedgerMasterDashboardViewModel>();

  @override
  void initState() {
    _model.loadData();
    print('init  state is called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ledger Master Dashboard'),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Consumer<LedgerMasterDashboardViewModel>(
          builder: (context, ledgerMaster, child) {
        ledgerMaster.loadData();
        return ListView.builder(
          itemCount: ledgerMaster.ledgerMasterList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewLedgerMaster()));
              },
              child: LedgerMasterListItem(
                title: ledgerMaster.ledgerMasterList[index].name,
                description: ledgerMaster.ledgerMasterList[index].description,
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(
                context,
                rNewLedgerMaster,
              ),
          child: Icon(Icons.add)),
    );
  }
}

class LedgerMasterListItem extends StatelessWidget {
  final String title;
  final String description;
  final String targetRoute;

  LedgerMasterListItem({this.title, this.targetRoute = '', this.description});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green.shade300,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,),), 
                Text(description, style: TextStyle(color: Colors.grey[700]),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
