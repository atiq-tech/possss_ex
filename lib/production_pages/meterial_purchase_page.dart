import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MeterialPurchasePage extends StatefulWidget {
  const MeterialPurchasePage({super.key});

  @override
  State<MeterialPurchasePage> createState() => _MeterialPurchasePageState();
}

class _MeterialPurchasePageState extends State<MeterialPurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 114, 165),
        centerTitle: true,
        title: Text("Meterial Purchase"),
      ),
    );
  }
}