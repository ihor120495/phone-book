import 'package:flutter/material.dart';

class ItemComponent extends StatelessWidget {
  final String name;
  final String phone;
  final String? email;
  final String? birthday;
  final Function()? onPressed;

  const ItemComponent({
    super.key,
    required this.phone,
    required this.name,
    this.email,
    this.birthday,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                Text(phone),
                if (email != null) Text(email!),
                birthday != null ? Text(birthday!) : const Icon(Icons.abc),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
