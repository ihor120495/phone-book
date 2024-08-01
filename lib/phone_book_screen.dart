import 'package:flutter/material.dart';
import 'package:phone_book/contact_model.dart';
import 'package:phone_book/item_component.dart';

class PhoneBookScreen extends StatefulWidget {
  const PhoneBookScreen({super.key});

  @override
  State<PhoneBookScreen> createState() => _PhoneBookScreenState();
}

class _PhoneBookScreenState extends State<PhoneBookScreen> {
  final List<ContactModel> contacts = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  void _showAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: birthdayController,
                decoration: const InputDecoration(labelText: 'birthday'),
                keyboardType: TextInputType.datetime,
              ),


  ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contacts.add(ContactModel(
                    name: nameController.text,
                    phone: phoneController.text,
                     email: emailController.text.isNotEmpty ? emailController.text : null,
                     birthday: birthdayController.text.isNotEmpty ? birthdayController.text: null,
                  ));
                  nameController.clear();
                  phoneController.clear();
                  emailController.clear();
                  birthdayController.clear();


                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Book'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final ContactModel contact = contacts[index];
          return ItemComponent(
            phone: contact.phone,
            name: contact.name,
            email: contact.email,
            birthday: contact.birthday,
            onPressed: () => _deleteContact(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddContactDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

