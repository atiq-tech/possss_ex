import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart' as jiffy;
import 'package:jiffy/jiffy.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
import 'package:my_second_poss_app/models/product_list.dart';
import 'package:my_second_poss_app/pages_common/account_information_page.dart';

class CashTransactionPage extends StatefulWidget {
  const CashTransactionPage({super.key});

  @override
  State<CashTransactionPage> createState() => _CashTransactionPageState();
}

class _CashTransactionPageState extends State<CashTransactionPage> {
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _AmountController = TextEditingController();

  String? _selectedType;
  List<String> _selectedTypeList = [
    'Cash Receive',
    'Cash Payment',
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
  String? firstPickedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cash Transaction"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 250.0,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 6.0, left: 10.0, right: 8.0),
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
                            flex: 5,
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Transaction Type",
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
                                    'Select Type',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  dropdownColor: Color.fromARGB(255, 231, 251,
                                      255), // Not necessary for Option 1
                                  value: _selectedType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedType = newValue!;
                                    });
                                  },
                                  items: _selectedTypeList.map((location) {
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Account",
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
                          SizedBox(width: 5.0),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AccountInformationPage()));
                                });
                              },
                              child: Container(
                                height: 28.0,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 75, 196, 201),
                                        width: 1)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 45.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
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
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Amount",
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
                              child: TextField(
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
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 35.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 75, 196, 201),
                                  width: 2.0),
                              color: Color.fromARGB(255, 105, 170, 88),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "SAVE",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                          SizedBox(width: 4.0),
                          Container(
                            height: 35.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 75, 196, 201),
                                  width: 2.0),
                              color: Color.fromARGB(255, 196, 81, 65),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "CANCEL",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                              label: Center(child: Text('Transaction Id')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Account Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Date')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Description')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Received Amount ')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Paid Amount ')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Saved By ')),
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
