import 'package:flutter/material.dart';

import '../utils/coin_data.dart';

class PickerButton extends StatelessWidget {
  const PickerButton(
      {Key? key, required this.index, required this.onSelectedCurrency})
      : super(key: key);
  final int index;
  final void Function(int) onSelectedCurrency;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          onSelectedCurrency(index);
          Navigator.pop(context);
        },
        child: Text(currenciesList[index]),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 15),
          primary: Colors.black.withOpacity(0.3),
          elevation: 0,
        ),
      ),
    );
  }
}
