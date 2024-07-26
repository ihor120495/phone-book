import 'package:flutter/material.dart';

class ItemComponent extends StatelessWidget {
  final String name;
  final String phone;
  final Function()? onPressed;

  const ItemComponent({
    super.key,
    required this.phone,
    required this.name,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(phone),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onPressed,
      ),
    );
  }
}
