import 'package:aplikasi_sederhana/common/components/font_weight.dart';
import 'package:aplikasi_sederhana/presentation/cart/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/space_height.dart';
import '../../../common/constants/app_text_style.dart';
import '../../../common/gen/assets.gen.dart';
import '../bloc/bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  // void initState() {
  //   context.read<GetAddressBloc>().add(const GetAddressEvent.getAddress());
  //   super.initState();
  // }

  // List<Item> items = [];
  // ignore: override_on_non_overriding_member
  int localTotalPrice = 0;

  int idAddress = 0;

  String courierName = 'jne';
  int courierPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: AppTextStyle.body2.semiBold,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       size: 16,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (carts) {
              if (carts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Assets.images.ilustrationNoData.image(),
                      ),
                      Text(
                        'Belum ada barang di keranjang',
                        style: AppTextStyle.body3.semiBold,
                      )
                    ],
                  ),
                );
              }
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        loaded: (carts) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SpaceHeight(16.0),
                            itemCount: carts.length,
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                data: carts[index],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SpaceHeight(16.0),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Button.filled(
                  //     width: 60,
                  //     onPressed: () async {
                  //       // idAddress = await Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //       builder: (context) =>
                  //       //           const ShippingAddressPage()),
                  //       // );
                  //       setState(() {});
                  //     },
                  //     label: 'Pilih Alamat Pengiriman',
                  //   ),
                  // ),
                  // const SpaceHeight(16.0),
                  // show alamat pengiriman
                  // if (carts.isNotEmpty)
                  // BlocBuilder<GetAddressBloc, GetAddressState>(
                  //   builder: (context, state) {
                  //     return state.maybeWhen(
                  //       orElse: () {
                  //         return const Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       },
                  //       loaded: (response) {
                  //         if (response.data.isEmpty) {
                  //           return const Center(
                  //             child: Text('Belum ada alamat tersimpan'),
                  //           );
                  //         }

                  //         final address = idAddress != 0
                  //             ? response.data.firstWhere(
                  //                 (element) => element.id == idAddress,
                  //                 orElse: () => response.data.first)
                  //             : response.data.last;

                  //         context.read<GetCostBloc>().add(
                  //               GetCostEvent.getCost(
                  //                 origin: subDistrictOrigin, //plered
                  //                 destination: address.attributes.subdistrictId
                  //                     .toString(),
                  //                 courier: 'jne',
                  //               ),
                  //             );
                  //         idAddress = address.id;

                  //         return Container(
                  //           padding: const EdgeInsets.all(16.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius:
                  //                 const BorderRadius.all(Radius.circular(5.0)),
                  //             border: Border.all(color: NeutralColor.ne04),
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Alamat Pengiriman',
                  //                 style: AppTextStyle.body4.semiBold,
                  //               ),
                  //               const SpaceHeight(16.0),
                  //               Text(
                  //                 address.attributes.name,
                  //                 style: AppTextStyle.body4.regular,
                  //               ),
                  //               const SpaceHeight(8.0),
                  //               Text(
                  //                 address.attributes.address,
                  //                 style: AppTextStyle.body4.regular,
                  //               ),
                  //               const SpaceHeight(8.0),
                  //               Text(
                  //                 address.attributes.phone,
                  //                 style: AppTextStyle.body4.regular,
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                  // const SpaceHeight(16.0),
                  // container for dropdown courier
                  // if (carts.isNotEmpty)
                  // Container(
                  //   padding: const EdgeInsets.all(16.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius:
                  //         const BorderRadius.all(Radius.circular(5.0)),
                  //     border: Border.all(color: NeutralColor.ne04),
                  //   ),
                  //   child: CustomDropdown<Courier>(
                  //     value: couriers.first,
                  //     items: couriers,
                  //     label: 'Kurir',
                  //     onChanged: (value) {
                  //       courierName = value!.kode;
                  //       context.read<GetCostBloc>().add(
                  //             GetCostEvent.getCost(
                  //               origin: subDistrictOrigin, //plered
                  //               destination: idAddress.toString(),
                  //               courier: value.kode,
                  //             ),
                  //           );
                  //     },
                  //   ),
                  // ),
                  // const SpaceHeight(16.0),
                  // // if (carts.isNotEmpty)
                  // Container(
                  //   padding: const EdgeInsets.all(16.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius:
                  //         const BorderRadius.all(Radius.circular(5.0)),
                  //     border: Border.all(color: NeutralColor.ne04),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       // BlocBuilder<CartBloc, CartState>(
                  //       //   builder: (context, state) {
                  //       //     return state.maybeWhen(
                  //       //       orElse: () {
                  //       //         return RowText(
                  //       //           label: 'Total',
                  //       //           value: 0.currencyFormatRp,
                  //       //         );
                  //       //       },
                  //       //       loa: (carts) {
                  //       //         int totalPrice = 0;
                  //       //         for (var element in carts) {
                  //       //           totalPrice += int.parse(element
                  //       //                   .product.attributes.price
                  //       //                   .toString()) *
                  //       //               element.quantity;
                  //       //         }
                  //       //         localTotalPrice = totalPrice;
                  //       //         items = carts
                  //       //             .map((e) => Item(
                  //       //                 id: e.product.id,
                  //       //                 productName: e.product.attributes.name,
                  //       //                 qty: e.quantity,
                  //       //                 price: int.parse(e
                  //       //                     .product.attributes.price
                  //       //                     .toString())))
                  //       //             .toList();
                  //       //         return RowText(
                  //       //           label: 'Total',
                  //       //           value: totalPrice.currencyFormatRp,
                  //       //           valueColor: PrimaryColor.pr10,
                  //       //           fontWeight: FontWeight.w700,
                  //       //         );
                  //       //       },
                  //       //     );
                  //       //   },
                  //       // ),
                  //       // const SpaceHeight(12.0),
                  //       // BlocBuilder<GetCostBloc, GetCostState>(
                  //       //   builder: (context, state) {
                  //       //     return state.maybeWhen(
                  //       //       orElse: () {
                  //       //         return RowText(
                  //       //           label: 'Biaya Pengiriman',
                  //       //           value: 0.currencyFormatRp,
                  //       //         );
                  //       //       },
                  //       //       loading: () {
                  //       //         return const CircularProgressIndicator();
                  //       //       },
                  //       //       loaded: (response) {
                  //       //         courierPrice = response.rajaongkir.results.first
                  //       //             .costs.first.cost.first.value;
                  //       //         return RowText(
                  //       //           label: 'Biaya Pengiriman',
                  //       //           value: response.rajaongkir.results.first.costs
                  //       //               .first.cost.first.value.currencyFormatRp,
                  //       //         );
                  //       //       },
                  //       //     );
                  //       //   },
                  //       // ),
                  //       // const SpaceHeight(40.0),
                  //       // Divider(color: NeutralColor.ne04),
                  //       // const SpaceHeight(12.0),
                  //       // BlocBuilder<GetCostBloc, GetCostState>(
                  //       //   builder: (context, state2) {
                  //       //     return BlocBuilder<CartBloc, CartState>(
                  //       //       builder: (context, state) {
                  //       //         return state.maybeWhen(
                  //       //           orElse: () {
                  //       //             return RowText(
                  //       //               label: 'Total Harga',
                  //       //               value: 0.currencyFormatRp,
                  //       //             );
                  //       //           },
                  //       //           success: (carts) {
                  //       //             int courierPrice = state2.maybeWhen(
                  //       //                 orElse: () => 0,
                  //       //                 loaded: (cost) => cost
                  //       //                     .rajaongkir
                  //       //                     .results
                  //       //                     .first
                  //       //                     .costs
                  //       //                     .first
                  //       //                     .cost
                  //       //                     .first
                  //       //                     .value);
                  //       //             int totalPrice = 0;
                  //       //             for (var element in carts) {
                  //       //               totalPrice += int.parse(element
                  //       //                       .product.attributes.price
                  //       //                       .toString()) *
                  //       //                   element.quantity;
                  //       //             }
                  //       //             totalPrice += courierPrice;
                  //       //             localTotalPrice = totalPrice;

                  //       //             return RowText(
                  //       //               label: 'Total Harga',
                  //       //               value: totalPrice.currencyFormatRp,
                  //       //               valueColor: PrimaryColor.pr10,
                  //       //               fontWeight: FontWeight.w700,
                  //       //             );
                  //       //           },
                  //       //         );
                  //       //       },
                  //       //     );
                  //       //   },
                  //       // ),
                  //       // const SpaceHeight(16.0),
                  //       // BlocConsumer<OrderBloc, OrderState>(
                  //       //   listener: (context, state) {
                  //       //     state.maybeWhen(
                  //       //       orElse: () {},
                  //       //       success: (response) {
                  //       //         context
                  //       //             .read<CartBloc>()
                  //       //             .add(const CartEvent.started());
                  //       //         Navigator.push(context,
                  //       //             MaterialPageRoute(builder: (_) {
                  //       //           return PaymentPage(
                  //       //             invoiceUrl: response.invoiceUrl,
                  //       //             orderId: response.externalId,
                  //       //           );
                  //       //         }));
                  //       //       },
                  //       //     );
                  //       //   },
                  //       //   builder: (context, state) {
                  //       //     return state.maybeWhen(
                  //       //       orElse: () {
                  //       //         return Button.filled(
                  //       //           onPressed: () async {
                  //       //             final userId =
                  //       //                 await AuthLocalDataSource().getUser();
                  //       //             // ignore: use_build_context_synchronously
                  //       //             context.read<OrderBloc>().add(
                  //       //                   OrderEvent.order(
                  //       //                     OrderRequestModel(
                  //       //                         data: Data(
                  //       //                       items: items,
                  //       //                       totalPrice: localTotalPrice,
                  //       //                       deliveryAddress:
                  //       //                           'Cirebon, plered',
                  //       //                       courierName: courierName,
                  //       //                       courierPrice: courierPrice,
                  //       //                       status: 'waiting-payment',
                  //       //                       buyerId: userId.id!,
                  //       //                     )),
                  //       //                   ),
                  //       //                 );
                  //       //           },
                  //       //           label: 'Bayar Sekarang',
                  //       //         );
                  //       //       },
                  //       //       loading: () {
                  //       //         return const Center(
                  //       //           child: CircularProgressIndicator(),
                  //       //         );
                  //       //       },
                  //       //     );
                  //       //   },
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
