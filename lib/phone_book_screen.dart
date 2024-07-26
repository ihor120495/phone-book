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
                  ));
                  nameController.clear();
                  phoneController.clear();
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
