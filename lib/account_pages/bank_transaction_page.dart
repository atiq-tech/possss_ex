import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart' as jiffy;
import 'package:jiffy/jiffy.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
import 'package:my_second_poss_app/models/product_list.dart';

class BankTransactionPage extends StatefulWidget {
  const BankTransactionPage({super.key});

  @override
  State<BankTransactionPage> createState() => _BankTransactionPageState();
}

class _BankTransactionPageState extends State<BankTransactionPage> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String? _selectedAccount;
  List<String> _selectedAccountList = [
    'Happy Product-020069(Agrani Bank)',
    'Happy Product-070075(Brac Bank)',
    'Happy Product C.C-1358(Mercentile Bank)',
    'Happy Product-01009(Jonota Bank)',
    'New Happy Product-20069(Islami Bank)',
    'Happy Product C.D-069(Mercentile Bank)',
    'Happy Product-256524(City Bank)',
  ];
  String? _transactionType;
  List<String> _transactionTypeList = [
    'Deposit',
    'Withdraw',
  ];
  String? firstPickedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bank Transaction"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 215.0,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
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
                              "Date",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 12,
                            child: GestureDetector(
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050));
                                if (selectedDate != null) {
                                  setState(() {
                                    firstPickedDate = Jiffy(selectedDate)
                                        .format("dd - MMM - yyyy");
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5, right: 5, bottom: 5),
                                height: 32,
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 5, right: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      firstPickedDate == null
                                          ? Jiffy(DateTime.now())
                                              .format("dd - MMM - yyyy")
                                          : firstPickedDate!,
                                    ),
                                    Icon(
                                      Icons.calendar_month,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Account",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 12,
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
                                        color:
                                            Color.fromARGB(255, 170, 167, 167)),
                                  ), // Not necessary for Option 1
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
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 31, 30, 30)),
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Transaction Type",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 12,
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
                                    'Select Type',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 100, 98, 98)),
                                  ), // Not necessary for Option 1
                                  value: _transactionType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _transactionType = newValue!;
                                    });
                                  },
                                  items: _transactionTypeList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        location,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 126, 125, 125)),
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 12,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _amountController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Note",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 12,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _noteController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 35.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 131, 224, 146),
                                width: 2.0),
                            color: Color.fromARGB(255, 5, 120, 165),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "SAVE TRANSACTIONS",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black38, width: 1)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        hintText: 'Filter...',
                        border: InputBorder.none),
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
                              label: Center(child: Text('Transaction Date')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Account Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Account Number')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Bank Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Transaction Type')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Note')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Amount')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Action')),
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
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
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
      ),
    );
  }
}
