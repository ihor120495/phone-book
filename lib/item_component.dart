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
        borderRadius:BorderRadius.circular(10),
      ),

      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                Text(phone),
                if(email !=null) Text(email!),
                birthday !=null ? Text(birthday!) :Icon(Icons.abc) ,

            
              ],
            
            ),

          ),
          IconButton(onPressed: onPressed, icon:Icon(Icons.delete) )

        ],


      ),




    );






    // return ListTile(
    //   isThreeLine: true,
    //   title: Text(name),
    //   subtitle: Text('$phone, $birthday'),
    //
    //   leading: Text(email!),
    //
    //   trailing: IconButton(
    //     icon: const Icon(Icons.delete),
    //     onPressed: onPressed,
    //   ),




    // );
  }
}
