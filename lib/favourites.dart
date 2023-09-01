import 'package:flutter/material.dart';
import 'package:projects/Product.dart';

class Favourites extends StatefulWidget {
  Favourites({super.key, required this.prods,required this.userEmail});
  final String? userEmail;
  final List<Product> prods;

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  late String? userEmail = widget.userEmail;

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
