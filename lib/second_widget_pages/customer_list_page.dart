import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Customer List"),
     
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: AdaptiveScrollbar(
          underColor: Colors.blueGrey.withOpacity(0.3),
          sliderDefaultColor: Colors.grey.withOpacity(0.7),
          sliderActiveColor: Colors.grey,
          controller: _verticalScrollController,
          child: AdaptiveScrollbar(
            controller: _horizontalScrollController,
            position: ScrollbarPosition.bottom,
            underColor: Colors.blueGrey.withOpacity(0.3),
            sliderDefaultColor: Colors.grey.withOpacity(0.7),
            sliderActiveColor: Colors.grey,
            child: SingleChildScrollView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 16.0),
                  child: DataTable(
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                        label: Center(child: Text('SI')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Customer Id')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Customer Name')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Address')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Contact No.')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      20,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
