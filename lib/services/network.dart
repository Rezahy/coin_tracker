import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestCrypto {
  static const String apiKey = '898AFED2-7857-4BD8-9AD8-0D16675B94E1';
  static const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

  static Future<String?> getCryptoCurrencyRateData(
      {currency = 'USD', required crypto}) async {
    try {
      http.Response response = await http
          .get(Uri.parse('$coinApiUrl/$crypto/$currency?apiKey=$apiKey'));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        debugPrint(body['rate'].toString());

        return body['rate'].toStringAsFixed(2);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List<String?>> getCryptosListBasedOnCurrencyRateData(
      BuildContext context,
      {required selectedCurrency}) async {
    var btc = await getCryptoCurrencyRateData(
        crypto: 'BTC', currency: selectedCurrency);
    var eth = await getCryptoCurrencyRateData(
        crypto: 'ETH', currency: selectedCurrency);
    var ltc = await getCryptoCurrencyRateData(
        crypto: 'LTC', currency: selectedCurrency);
    if (btc == null && eth == null && ltc == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'can\'t connect to the server!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFE71D36),
      ));
    }
    return [btc ?? '!', eth ?? '!', ltc ?? '!'];
  }
}
