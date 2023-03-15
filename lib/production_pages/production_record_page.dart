import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductionRecordPage extends StatefulWidget {
  const ProductionRecordPage({super.key});

  @override
  State<ProductionRecordPage> createState() => _ProductionRecordPageState();
}

class _ProductionRecordPageState extends State<ProductionRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 114, 165),
        centerTitle: true,
        title: Text("Production Record"),
      ),
    );
  }
}