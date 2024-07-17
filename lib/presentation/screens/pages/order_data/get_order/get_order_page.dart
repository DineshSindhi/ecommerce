import 'package:ecommerce_app/presentation/screens/pages/order_data/get_order/get_order_bloc/get_order_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/get_order/get_order_bloc/get_order_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/order_data/get_order/get_order_bloc/get_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderPage extends StatefulWidget {
  const GetOrderPage({super.key});

  @override
  State<GetOrderPage> createState() => _GetOrderPageState();
}

class _GetOrderPageState extends State<GetOrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetOrderBloc>().add(GetOrderEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3e3),
      body: BlocBuilder<GetOrderBloc, GetOrderState>(
        builder: (context, state) {
          if (state is GetOrderLoadingState) {
            return Center(child: CircularProgressIndicator(),);
          } else if (state is GetOrderErrorState) {
            return Center(child: Text(state.msg),);
          } else if (state is GetOrderLoadedState) {
            return ListView.builder(
              itemCount: state.getOrder.orders!.length,
              itemBuilder: (c, index) {
                var mData=state.getOrder.orders![index];
                var data=mData.product![0];

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
                            title: Text('${data.name}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\u{20B9}${data.price}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700)),
                                    Container(
                                      height: 45,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: Color(0xffe3e3e3),
                                      ),
                                      child: Center(child: Text('Quantity ${data.quantity}'),),
                                    ),
                                  ],
                                ),
                                Text('CreatedAt - ${mData.createdAt}',
                                    style: TextStyle(fontWeight: FontWeight.w500)),
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
    );
  }
}
