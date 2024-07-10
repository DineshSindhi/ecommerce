import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/domain/ui_data.dart';
import 'package:ecommerce_app/presentation/screens/pages/category_bloc/category_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/category_bloc/category_events.dart';
import 'package:ecommerce_app/presentation/screens/pages/poduct_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(ProductsE());
    context.read<CategoryBloc>().add(CategoryE());

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffe3e3e3)),
                    child: Icon(
                      Icons.menu,
                      size: 32,
                    )),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffe3e3e3)),
                    child: Icon(Icons.notifications_none_outlined, size: 32)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: SizedBox(height: 65,width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffe3e3e3),
                  suffixIcon: SizedBox(
                    width: 60,
                    height: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.filter_list_rounded,
                            size: 32,
                          ),
                          // Icon(Icons.image,size: 32,),
                        ],
                      ),
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 23,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 38,
                  ),
                  hintText: 'Search...',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      borderSide: BorderSide(color: Color(0xffe3e3e3))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      borderSide: BorderSide(color: Color(0xffe3e3e3))),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CarouselSlider(items: UiData.listPost.map((eachUrl){
                return SizedBox(
                 width: double.infinity,
                  child: Image.network(eachUrl,fit: BoxFit.fill,),
                );
              }).toList(), options: CarouselOptions(
                autoPlay: true,
                pageSnapping: false,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.width<550?240:310
              )),
            ),
          ),
          SizedBox(
            height: 150,
            child: CategoryItem(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Special For You',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              ),
              Text(
                ' See all ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(
            height: double.maxFinite,
              child: ProductPage())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.orange,

        onPressed: (){},
        child: Icon(Icons.home_filled,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Icon(Icons.menu,size: 35,color: Colors.grey,),
          Icon(Icons.favorite_border,size: 35,color: Colors.grey),
          Icon(Icons.shopping_cart_rounded,size: 35,color: Colors.grey),
          Icon(Icons.account_circle,size: 35,color: Colors.grey),
        ],),
        elevation: 11,
        notchMargin: 5,
        shadowColor: Colors.grey,
        shape: CircularNotchedRectangle(),
        surfaceTintColor: Colors.white,
      ),
    );
  }
}

