import 'dart:async';
import 'package:ecommerce_app/data/app_pref.dart';
import 'package:ecommerce_app/domain/api_data/api.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/home_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../on_board/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    login();
    // Timer(Duration(seconds: 5), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
    //       create: (context) => LoginBloc(apiHelper: ApiHelper()),
    //       child: LoginScreen()),));
    //
    // });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("E-Commerce"),
            SizedBox(width: 200,height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                  child: Image.asset('assets/images/logo.png',fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
    );
  }
  login() async {
    var login =await AppPrefs().getToken();

    Timer(Duration(seconds: 5), () {
      if(login!=''){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) => LoginBloc(apiHelper: ApiHelper()),
            child: LoginScreen()),));
      }

    });
  }
}