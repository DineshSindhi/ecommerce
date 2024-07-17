import 'package:ecommerce_app/data/app_pref.dart';
import 'package:ecommerce_app/domain/api_data/api.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/get_order/get_order_bloc/get_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../on_board/login_page.dart';
import 'order_data/get_order/get_order_page.dart';

class ProfilePage extends StatelessWidget {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 110,
          width: 110,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ekxesXBWGbfsKGm4bVyudWOKC-2_fW4cPw&s',
                fit: BoxFit.fill,
              )),
        ),
        myDetail('jayesh@gmail.com'),
        myDetail('Jayesh'),
        myDetail('12345678'),
        myDetail('1234567890'),
        myContainer('Your Orders', () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => GetOrderBloc(apiHelper: ApiHelper()),
                  child: GetOrderPage(),
                ),
              ));
        }, Icon(Icons.shopping_bag_outlined)),
        myContainer('Sign Out', () {
          AppPrefs().setToken('');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }, Icon(Icons.logout)),
      ],
    ));
  }

  myContainer(String text, VoidCallback? onTap, Icon? icon) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange.shade500),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            InkWell(onTap: onTap, child: icon)
          ],
        ),
      ),
    );
  }

  myDetail(String text) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange.shade500),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
