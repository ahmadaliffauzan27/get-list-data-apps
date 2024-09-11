import 'package:aplikasi_sederhana/common/components/font_weight.dart';
import 'package:aplikasi_sederhana/presentation/cart/widgets/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/space_height.dart';
import '../../../common/constants/app_text_style.dart';
import '../../../common/constants/colors.dart';
// ignore: library_prefixes
import '../bloc/bloc/cart_bloc.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final CartModel data;

  void initState() {
    // ignore: avoid_print
    print('data: ${data.product.avatar}');
  }

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: NeutralColor.ne04),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              widget.data.product.avatar,
              width: 72.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
          ),
          const SpaceWidth(12.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.product.firstName,
                        style: AppTextStyle.body4.semiBold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (widget.data.quantity > 0) {
                          context
                              .read<CartBloc>()
                              .add(CartEvent.remove(widget.data));
                        }
                      },
                      child: Container(
                        color: ColorName.white,
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: Center(
                        child: Text(widget.data.quantity.toString()),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<CartBloc>()
                            .add(CartEvent.add(widget.data));
                      },
                      child: Container(
                        color: ColorName.white,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Text(
                //       int.parse(widget.data.product.attributes.price.toString())
                //           .currencyFormatRp,
                //       style: AppTextStyle.body4.semiBold.copyWith(
                //         color: PrimaryColor.pr10,
                //       ),
                //     ),
                //     const Spacer(),
                //     Container(
                //       padding: const EdgeInsets.all(1.0),
                //       decoration: const BoxDecoration(
                //         color: ColorName.border,
                //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //       ),
                //       child: Row(
                //         children: [
                // GestureDetector(
                //   onTap: () {
                //     if (widget.data.quantity > 0) {
                //       context
                //           .read<CartBloc>()
                //           .add(CartEvent.remove(widget.data));
                //     }
                //   },
                //   child: Container(
                //     color: ColorName.white,
                //     child: const Icon(Icons.remove),
                //   ),
                // ),
                // SizedBox(
                //   width: 40.0,
                //   child: Center(
                //     child: Text(widget.data.quantity.toString()),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     context
                //         .read<CartBloc>()
                //         .add(CartEvent.add(widget.data));
                //   },
                //   child: Container(
                //     color: ColorName.white,
                //     child: const Icon(Icons.add),
                //   ),
                // ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
