import 'package:flutter/material.dart';
import 'package:phone_book/model/contact_model.dart';
class EditContactScreen extends StatelessWidget {
  final ContactModel contact;
  final TextEditingController nameControlLer;
  final TextEditingController phoneController;

   EditContactScreen({super.key,
    required this.contact,

  })

   : nameControlLer = TextEditingController(text: contact.name),
  phoneController =TextEditingController(text: contact.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Edit contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameControlLer,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: nameControlLer,
            decoration: const InputDecoration(labelText: 'Phone'),
          ),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(ContactModel(
              name: nameControlLer.text,
              phone: phoneController.text,
          ),
          ),
              child: const Text('Save'),
          )
        ],
      ),



    );
  }
}
