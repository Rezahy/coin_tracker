import 'package:coin_tracker/widgets/picker_button.dart';
import 'package:flutter/material.dart';

import '../utils/coin_data.dart';

class CustomCoinPicker extends StatefulWidget {
  const CustomCoinPicker({Key? key, required this.onSelectedCurrency})
      : super(key: key);
  final void Function(int) onSelectedCurrency;

  @override
  State<CustomCoinPicker> createState() => _CustomCoinPickerState();
}

class _CustomCoinPickerState extends State<CustomCoinPicker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          color: const Color(0xFF312F2F)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.3,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFCBD2D0).withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: currenciesList.length,
                  itemBuilder: (context, index) => PickerButton(
                      index: index,
                      onSelectedCurrency: widget.onSelectedCurrency)))
        ],
      ),
    );
  }
}

// 312F2F
// 363537
//0xFF5A5353
