import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class ProfitLossReportPage extends StatefulWidget {
  const ProfitLossReportPage({super.key});

  @override
  State<ProfitLossReportPage> createState() => _ProfitLossReportPageState();
}

class _ProfitLossReportPageState extends State<ProfitLossReportPage> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _Date2Controller = TextEditingController();
  String? _selectedType;
  List<String> _selectedTypeList = [
    'Received',
    'Payment',
  ];
  String? _selectedAccount;
  List<String> _selectedAccountList = [
    'Auto Vara',
    'Capital',
    'Transport bill',
    'Sallary',
    'Discount',
    'Withdraw',
    'Van Survice',
    'Machine Survice',
    'Factory Rent',
    'Purchase',
    'Truck Vara',
    'Mobile Recharge',
    'Production bill',
    'Interest',
    'Instolment',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profit & Loss Report"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 135.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 5, 107, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Customer",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 28.0,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 5, 107, 155),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  'Select account',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                dropdownColor: Color.fromARGB(255, 231, 251,
                                    255), // Not necessary for Option 1
                                value: _selectedAccount,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedAccount = newValue!;
                                  });
                                },
                                items: _selectedAccountList.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      location,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Date: ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              controller: _DateController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 20.0,
                                ),
                                suffixIconColor:
                                    Color.fromARGB(255, 3, 95, 216),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onTap: () async {
                                DateTime? pickdate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickdate != null) {
                                  setState(() {
                                    _DateController.text =
                                        DateFormat("dd/MM/yyyy")
                                            .format(pickdate);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "to",
                          style:
                              TextStyle(color: Color.fromARGB(255, 51, 50, 50)),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              controller: _Date2Controller,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 20.0,
                                ),
                                suffixIconColor:
                                    Color.fromARGB(255, 3, 95, 216),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onTap: () async {
                                DateTime? pickdate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickdate != null) {
                                  setState(() {
                                    _Date2Controller.text =
                                        DateFormat("dd/MM/yyyy")
                                            .format(pickdate);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35.0,
                          width: 85.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 75, 196, 201),
                                width: 2.0),
                            color: Color.fromARGB(255, 87, 113, 170),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "Search",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.43,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      // color: Colors.red,
                      // padding:EdgeInsets.only(bottom: 16.0),
                      child: DataTable(
                        showCheckboxColumn: true,
                        border:
                            TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchase Rate')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchased Total')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Amount')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Profit/Loss')),
                          ),
                        ],
                        rows: List.generate(
                          30,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              ),
                              DataCell(
                                Center(child: Text('Row $index')),
                              )
                            ],
                          ),
                        ),
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
