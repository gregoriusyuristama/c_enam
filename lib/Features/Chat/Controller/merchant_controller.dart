import 'dart:convert';

import 'package:c_enam/Features/Chat/Model/merchant_model.dart';
import 'package:http/http.dart' as http;

class MerchantController {
  static Future<RespMerchants> fetchMerchants() async {
    final response = await http.get(Uri.parse(
        'https://c-enam-angelhack-be-production.up.railway.app/api/v1/merchants/foods'));

    if (response.statusCode == 200) {
      return RespMerchants.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
