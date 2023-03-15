import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
import 'package:my_second_poss_app/hive_model/customerEntry_item.dart';

class CustomerEntryPage extends StatefulWidget {
  const CustomerEntryPage({super.key});

  @override
  State<CustomerEntryPage> createState() => _CustomerEntryPageState();
}

class _CustomerEntryPageState extends State<CustomerEntryPage> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _officePhoneController = TextEditingController();
  final TextEditingController _previousDueController = TextEditingController();
  final TextEditingController _creditLimitController = TextEditingController();

  late final Box boxCE;

  double h1TextSize = 16.0;
  double h2TextSize = 14.0;

  @override
  void initState() {
    super.initState();
    boxCE = Hive.box('customerEntryBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    boxCE.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  String lavel = "Retails";
  String dropdownCustomerValue = 'Shakib';
  String dropdownOwnerValue = 'Rohiz Uddin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Customer Entry"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Customer Name",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 36.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 5.0, left: 5.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 90, 149, 238)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 77, 137, 226)),
                            ),
                            filled: true,
                          ),
                          dropdownColor: Colors.greenAccent,
                          value: dropdownCustomerValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownCustomerValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Shakib',
                            'Shoib',
                            'Hasan Ali',
                            'Jannatul Ferdows Rubel',
                            'Bristy Akter',
                            'Atiq Hasan',
                            'Mamun Miah',
                            'Rasel Hossine'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Owner Name",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 36.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 5.0, left: 5.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 90, 149, 238)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 77, 137, 226)),
                            ),
                            filled: true,
                          ),
                          dropdownColor: Colors.greenAccent,
                          value: dropdownOwnerValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownOwnerValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Rohiz Uddin',
                            'Juwel Sharker',
                            'Shaidul Islam',
                            'Jannatul Ferdows Rubel',
                            'Shohail Rana',
                            'Iftikar Islam Atiq',
                            'Mamun Miah',
                            'Rasel Hossine'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Address",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 28.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Mobile",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 28.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Office Phone",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 28.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _officePhoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Previous Due",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 28.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _previousDueController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 4, 100, 145),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Credit Limit",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 28.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _creditLimitController,
                          decoration: InputDecoration(
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
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
                  child: Container(
                    height: 25.0,
                    width: double.infinity,
                    color: Color.fromARGB(255, 5, 114, 165),
                    child: Center(
                        child: Text(
                      "Customer Type",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.15,
                          child: Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 5, 114, 165),
                              ),
                              value: "Retails",
                              groupValue: lavel,
                              onChanged: (value) {
                                setState(() {
                                  lavel = value.toString();
                                });
                              }),
                        ),
                        Text("Retails"),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.15,
                          child: Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 5, 114, 165),
                              ),
                              value: "Wholesale",
                              groupValue: lavel,
                              onChanged: (value) {
                                setState(() {
                                  lavel = value.toString();
                                });
                              }),
                        ),
                        Text("Wholesale"),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: InkWell(
                    onTap: () {
                      CustomerEntryDetails customerEntryDetails =
                          CustomerEntryDetails(
                              customerNameCE: dropdownCustomerValue,
                              ownerName: dropdownOwnerValue,
                              addressCE: _addressController.text,
                              mobileCE: int.parse(_mobileController.text),
                              officePhone:
                                  int.parse(_officePhoneController.text),
                              previousDue:
                                  int.parse(_previousDueController.text),
                              CreditLimit:
                                  int.parse(_creditLimitController.text));
                      boxCE.add(customerEntryDetails);
                      _addressController.text = '';
                      _mobileController.text = '';
                      _officePhoneController.text = '';
                      _previousDueController.text = '';
                      _creditLimitController.text = '';
                    },
                    child: Container(
                      height: 35.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 114, 165),
                        borderRadius: BorderRadius.circular(4.0),
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
                  ),
                ),
                Container(
                  height: 320.0,
                  width: double.infinity,
                  child: ValueListenableBuilder(
                    valueListenable: boxCE.listenable(),
                    builder: (context, Box boxCE, widget) {
                      if (boxCE.isEmpty) {
                        return Center(
                          child: Text('No Product in Cart'),
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: boxCE.length,
                                itemBuilder: (context, index) {
                                  var currentBox = boxCE;
                                  var CustomerEntryData =
                                      currentBox.getAt(index)!;
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 140,
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 6),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 2, 105, 150),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10.0))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                        "${index}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.0),
                                                      ))
                                                      // Text(
                                                      //   "Customer Name:  ${itemData.customerName}",
                                                      //   style: TextStyle(
                                                      //     color: Colors.white,
                                                      //     fontWeight:
                                                      //         FontWeight.bold,
                                                      //     fontSize: h1TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Phone No:  ${itemData.mobile}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Address:  ${itemData.address}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Product:  ${itemData.product}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Available Stock:  ${itemData.stock}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Sales Rate:  \$${itemData.salseRate}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   "Quantity:  ${itemData.quantity}",
                                                      //   style: TextStyle(
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     color: Colors.white,
                                                      //     fontSize: h2TextSize,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: FloatingActionButton(
                                                      heroTag: null,
                                                      onPressed: () {
                                                        _deleteProduct(index);
                                                        setState(() {
                                                          boxCE.length;
                                                        });
                                                      },
                                                      mini: true,
                                                      shape:
                                                          const CircleBorder(),
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                            255, 3, 3, 3),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
