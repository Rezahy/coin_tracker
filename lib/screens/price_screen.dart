import 'package:coin_tracker/services/network.dart';
import '../utils/coin_data.dart';
import '../widgets/custom_coin_picker.dart';
import '../widgets/reusable_card.dart';
import 'package:flutter/material.dart';

const String apiKey = '898AFED2-7857-4BD8-9AD8-0D16675B94E1';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<String?> cryptosCurrencyRateDataList = ['?', '?', '?'];

  void customPickerOnSelectedCurrency(int selectedIndex) {
    setState(() {
      selectedCurrency = currenciesList[selectedIndex];
      getCryptosCurrencyRateDataList();
      cryptosCurrencyRateDataList = ['?', '?', '?'];
    });
  }

  @override
  void initState() {
    super.initState();
    getCryptosCurrencyRateDataList();
  }

  void getCryptosCurrencyRateDataList() async {
    var newCryptosCurrenciesRateDataList =
        await RequestCrypto.getCryptosListBasedOnCurrencyRateData(context,
            selectedCurrency: selectedCurrency);
    setState(() {
      cryptosCurrencyRateDataList = newCryptosCurrenciesRateDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coin Tracker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [
                ReusableCard(
                    selectedCurrency: selectedCurrency,
                    crypto: cryptoList[0],
                    result: cryptosCurrencyRateDataList[0]),
                ReusableCard(
                    selectedCurrency: selectedCurrency,
                    crypto: cryptoList[1],
                    result: cryptosCurrencyRateDataList[1]),
                ReusableCard(
                    selectedCurrency: selectedCurrency,
                    crypto: cryptoList[2],
                    result: cryptosCurrencyRateDataList[2]),
              ],
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Material(
          color: const Color(0xFF333333),
          elevation: 3,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                selectedCurrency,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => CustomCoinPicker(
                  onSelectedCurrency: customPickerOnSelectedCurrency,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
          ),
        ));
  }
}
