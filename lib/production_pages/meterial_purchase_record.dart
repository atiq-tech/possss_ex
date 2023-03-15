import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MeterialPurchaseRecord extends StatefulWidget {
  const MeterialPurchaseRecord({super.key});

  @override
  State<MeterialPurchaseRecord> createState() => _MeterialPurchaseRecordState();
}

class _MeterialPurchaseRecordState extends State<MeterialPurchaseRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 114, 165),
        centerTitle: true,
        title: Text("Meterial Purchase Record"),
      ),
    );
  }
}
