import 'package:ecommerce_app/presentation/screens/pages/add_cart/add_cart_bloc/add_cart_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/add_cart/add_cart_bloc/add_cart_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/add_cart/add_cart_bloc/add_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatefulWidget {
  int productId;
  String imgUrl;
  String pName;
  String pPrice;

  ItemDetailPage(
      {required this.imgUrl,
      required this.pName,
      required this.pPrice,
      required this.productId});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int quantity = 1;

  List<Map<String, dynamic>> listColor = [
    {'color': Colors.orange},
    {'color': Colors.black},
    {'color': Colors.brown},
    {'color': Colors.blueGrey},
    {'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3e3),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                        )),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.share_outlined,
                              size: 30,
                            )),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                                child: Icon(
                              Icons.favorite_border,
                              size: 28,
                            ))),
                      ],
                    ),
                  ],
                ),
              ),
              Image.network(
                widget.imgUrl,
                height: 300,
                width: 300,
              ),
              SizedBox(
                height: 500,
                child: Container(
                  height: 100,
                  width: 550,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pName,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Text("\u{20B9}${widget.pPrice}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Seller : Jack',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffff660e),
                                ),
                                child: Center(
                                  child: Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                    Text('4.8',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white))
                                  ]),
                                ),
                              ),
                              Text(
                                ' (536 Review)',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text('Color',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 65,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listColor.length,
                                itemBuilder: (BuildContext c, i) => Container(
                                      width: 45,
                                      height: 45,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: listColor[i]['color']),
                                    )),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0xffff660e),
                                    ),
                                    child: Center(
                                      child: Text('Discription',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    )),
                                Text(
                                  'Specification',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Review',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                          Text(
                              'Airdopes Atom 81 offer a total playtime of up to 50HRS, including up to 10HRS of playtime per earbud.Clear Voice Call unwanted background noises during calls.',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade600)),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 77,
                width: 410,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff000000),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 44,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                if (quantity > 1) {
                                  quantity--;
                                }
                                setState(() {});
                              },
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          Text('${quantity}',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          InkWell(
                              onTap: () {
                                quantity++;
                                setState(() {});
                              },
                              child: Text('+',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  BlocListener<AddCartBloc, AddCartState>(
                    listener: (context, state) {
                      if(state is AddCartLoadingState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularProgressIndicator(),
                            Text('Adding..'),
                          ],
                        )));
                      }else if(state is AddCartErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                      } else if(state is AddCartLoadedState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Add to Cart Successfully'))));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          context.read<AddCartBloc>().add(AddCartEvent(
                              productId: widget.productId, quantity: quantity));
                        },
                        child: Container(
                            height: 55,
                            width: 210,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Color(0xffff660e),
                            ),
                            child: Center(
                              child: Text('Add to Cart',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            )),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}