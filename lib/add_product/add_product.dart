// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:advert/components/custom_text_field.dart';
import 'package:advert/models/constants/app_sizes.dart';
import 'package:advert/models/information.dart';
import 'package:advert/services/date_time_service.dart';
import 'package:advert/services/image_picker_service.dart';
import 'package:advert/services/storage_service.dart';
import 'package:advert/services/store_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  //late File imageFile;
  List<XFile> images = [];
  final service = ImagePickerService();

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
            CustomTextField(
              hintText: 'title',
              controller: _title,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'description',
              controller: _description,
              maxLines: 5,
            ),
            AppSizes.height10,
            Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(),
              ),
              child: images.isNotEmpty
                  ? GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 10),
                      children: images
                          .map(
                            (e) => ItemCard(
                              file: File(e.path),
                            ),
                          )
                          .toList(),
                    )
                  : IconButton(
                      onPressed: () async {
                        final value = await service.pickedImage();
                        if (value != null) {
                          images = value;
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'name',
              controller: _name,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'datatime',
              controller: _datatime,
              focusNode: FocusNode(),
              onTap: () async {
                await DateTimeService.showDateTimePicker(context, (value) {
                  _datatime.text = DateFormat('d MMMM y').format(
                    DateTime.parse(
                      value.toString(),
                    ),
                  );
                });
              },
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'phonenumber',
              controller: _phonenumber,
            ),
            AppSizes.height10,
            CustomTextField(hintText: 'address', controller: _address),
            AppSizes.height10,
            ElevatedButton.icon(
              onPressed: () async {
                final urls = await StorageService().uploadImages(images);
                final information = Information(
                  title: _title.text,
                  description: _description.text,
                  name: _name.text,
                  datetime: _datatime.text,
                  phonenumber: _phonenumber.text,
                  address: _address.text,
                  image: urls,
               );
               await StoreService().informationSave(information);
              },
              icon: const Icon(Icons.publish),
              label: const Text('маалыматты жонотуу!'),
            )
          ],
        ),
      ),
    );
  }
}




class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.file,
  });
  final File file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.file(
        file,
      ),
    );
  }
}
