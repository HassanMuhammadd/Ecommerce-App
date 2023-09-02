import 'package:flutter/material.dart';
import 'package:projects/Product.dart';
import 'package:projects/sqflite.dart';

class Cart extends StatefulWidget {

  Cart({super.key, required this.prods,required this.userEmail});
  final String? userEmail;
  final List<Product> prods;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String? userEmail = widget.userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
