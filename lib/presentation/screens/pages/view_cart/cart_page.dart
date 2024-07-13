import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/view_cart/view_cart_bloc/view_cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPage extends StatefulWidget {
  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  void initState() {
    super.initState();
    context.read<ViewCartBloc>().add(ViewCartEvent());
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
                SizedBox(width: MediaQuery.of(context).size.width<600?110:MediaQuery.of(context).size.width>600&&MediaQuery.of(context).size.width<900?220:MediaQuery.of(context).size.width>900&&MediaQuery.of(context).size.width<1300?400:550),
                Text(
                  'My Cart',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            BlocBuilder<ViewCartBloc, ViewCartState>(
              builder: (context, state) {
                if (state is ViewCartLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                } else if (state is ViewCartErrorState) {
                  return Center(child: Text(state.msg),);
                } else if (state is ViewCartLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.viewCartData.length,
                    itemBuilder: (c, index) {
                      var data=state.viewCartData[index];
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width<900?150:200,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width>580?130:120,
                                width: MediaQuery.of(context).size.width>580?130:120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffe3e3e3)),
                                child: Image.network('${data.image}'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width<600?320:MediaQuery.of(context).size.width>600&&MediaQuery.of(context).size.width<850?390:620,
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${data.name}',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500)),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30,
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
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              '-',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('${data.quantity}',
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );},
                  );
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
                          Text('\$2737.00',
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
                          Text('\$2737.00',
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
                          child: Center(
                            child: Text('Ceckout',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
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
