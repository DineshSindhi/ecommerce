import 'dart:async';

import 'package:ecommerce_app/presentation/screens/pages/decrement_quantity_bloc/decrement_quantity_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/decrement_quantity_bloc/decrement_quantity_state.dart';
import 'package:ecommerce_app/presentation/screens/pages/delete_cart_bloc/delete_cart_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/delete_cart_bloc/delete_cart_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/delete_cart_bloc/delete_cart_state.dart';
import 'package:ecommerce_app/presentation/screens/pages/navigation_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/create_order/create_order_bloc/create_order_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/create_order/create_order_bloc/create_order_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/create_order/create_order_bloc/create_order_state.dart';
import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/model/view_cart_model.dart';
import '../decrement_quantity_bloc/decrement_quantity_bloc.dart';

class MyCartPage extends StatefulWidget {
  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  bool isOrderPlacing = false;
  num totalAmount = 0;

  @override
  void initState() {
    super.initState();
    context.read<ViewCartBloc>().add(ViewCartEvent());
  }

  void getOrderAmount(List<ViewCartModel> allItem) {
    totalAmount = 0.0;

    Timer(
      Duration(seconds: 2),
      () {
        for (ViewCartModel eachData in allItem) {
          totalAmount += double.parse(eachData.price!) * eachData.quantity!;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffe3e3e3),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                      )),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 600
                        ? 110
                        : MediaQuery.of(context).size.width > 600 &&
                                MediaQuery.of(context).size.width < 900
                            ? 220
                            : MediaQuery.of(context).size.width > 900 &&
                                    MediaQuery.of(context).size.width < 1300
                                ? 400
                                : 550),
                Text(
                  'My Cart',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            BlocBuilder<ViewCartBloc, ViewCartState>(
              builder: (context, state) {
                if (state is ViewCartLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ViewCartErrorState) {
                  return Center(
                    child: Text(state.msg),
                  );
                } else if (state is ViewCartLoadedState) {
                   bool data= state.viewCartData.isNotEmpty;
                  getOrderAmount(state.viewCartData);
                  return state.viewCartData.isNotEmpty?ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.viewCartData.length,
                    itemBuilder: (c, index) {
                      var data = state.viewCartData[index];
                      int quantity = data.quantity!;

                      return Container(
                        width: double.infinity,
                        height:
                            MediaQuery.of(context).size.width < 900 ? 150 : 200,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width > 580
                                    ? 130
                                    : 120,
                                width: MediaQuery.of(context).size.width > 580
                                    ? 130
                                    : 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffe3e3e3)),
                                child: Image.network('${data.image}'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width < 600
                                    ? 320
                                    : MediaQuery.of(context).size.width > 600 &&
                                            MediaQuery.of(context).size.width <
                                                850
                                        ? 390
                                        : 620,
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${data.name}',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500)),
                                      BlocListener<DeleteCartBloc, DeleteCartState>(
                                        listener: (context, state) {
                                          if (state is DeleteCartLoadingState) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Loading')));
                                          }
                                          if (state is DeleteCartErrorState) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(state.msg)));
                                          }
                                          if (state is DeleteCartLoadedState) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Loaded')));
                                          }
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            context
                                                .read<DeleteCartBloc>()
                                                .add(DeleteCartEvent());
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('\u{20B9}${data.price}',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700)),
                                      Container(
                                          height: 25,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xffe3e3e3),
                                          ),
                                          child: BlocListener<
                                              DecrementQuantityBloc,
                                              DecrementQuantityState>(
                                            listener: (context, state) {
                                              if (state is DecrementQuantityLoadedState) {}
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            DecrementQuantityBloc>()
                                                        .add(
                                                            DecrementQuantityEvent(
                                                                productId: data
                                                                    .productId!,
                                                                quantity: 1));
                                                  },
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text('$quantity',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text('+',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ):Center(child: Text('Not'),);
                }
                return Container();
              },
            ),
            SizedBox(
              height: 300,
              child: Container(
                height: 100,
                width: 550,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 15, left: 15),
                      child: Container(
                        height: 60,
                        width: 410,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffe3e3e3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enter Discount Code',
                                style: TextStyle(
                                    fontSize: 23, color: Colors.grey.shade600),
                              ),
                              Text('Apply',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffff660e)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 30, color: Colors.grey.shade600),
                          ),
                          Text('\u{20B9}$totalAmount',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 425,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffe3e3e3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text('\u{20B9}${totalAmount + totalAmount * 0.1}',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                          height: 65,
                          width: 410,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffff660e),
                          ),
                          child:
                              BlocListener<CreateOrderBloc, CreateOrderState>(
                            listener: (context, state) {
                              if (state is CreateOrderLoadingState) {
                                isOrderPlacing = true;
                                setState(() {});
                              } else if (state is CreateOrderErrorState) {
                                isOrderPlacing = false;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.msg)));
                              } else if (state is CreateOrderLoadedState) {
                                isOrderPlacing = false;
                                setState(() {});
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 150,
                                              width: 150,
                                              child: Lottie.asset(
                                                  'asset/lottie/order_place.json')),
                                          Text('Order Place Succesfully '),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                Timer(
                                  Duration(seconds: 2),
                                  () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NavigationPage(),
                                        ));
                                  },
                                );
                              }
                            },
                            child: isOrderPlacing
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                        Text('Order Placing')
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<CreateOrderBloc>()
                                            .add(CreateOrderEvent());
                                      },
                                      child: Text('Ceckout',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                  ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
