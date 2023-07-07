import 'package:advert/models/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _name = TextEditingController();
  final _datatime = TextEditingController();
  final _phonenumber = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProduct'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomTextField(hintText: 'title', 
            controller: _title,
            ),
            AppSizes.height10,
            CustomTextField(hintText: 'description', controller: _description,
            maxLines: 5,),
            AppSizes.height10,
            CustomTextField(hintText: 'name',controller: _name,),
            AppSizes.height10,
            CustomTextField(hintText: 'datatime',controller: _datatime,),
            AppSizes.height10,
            CustomTextField(hintText: 'phonenumber',controller: _phonenumber,),
            AppSizes.height10,
            CustomTextField(hintText: 'address',controller: _address),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, this.controller, this.maxLines,
  });
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        hintText: hintText,
      ),
      
    );
  }
}
