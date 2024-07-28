import 'dart:convert';
import 'dart:io';

import 'package:c_enam/Features/Chat/Model/merchant_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiUtilites {
  static GeminiUtilites shared = GeminiUtilites();
  static String apiKey = "AIzaSyAaId5V1ZcXcjbJIDU8LMoHS_upOh-WZnM";

  final String _explainerPrompt = """
Act like you were integrated to food delivery app, you can access all data that available from data that i passed on. Generate top 3 food that suitable most to the users input in JSON code format with structure:
And also give the output based on 3 of data that I already passed on.
1. [Your general response]
2. [Food Information:
    1. Image
    2. Name
    3. Restaurant Name
    4. Price (in Indonesia Rupiah (IDR))
    5. Estimated delivery time (Ceiling value in minutes)
    6. Restaurant distance (in Kilometer (km))
    7. Deals]


write all suitable unit. you aren't able to ask additional information after user send the input

  """;

  final _modelGemini15pro = GenerativeModel(
    model: 'gemini-1.5-pro-latest',
    apiKey: apiKey,
  );
}

// Explainer
extension GeminiExplainer on GeminiUtilites {
  Future<String> askFood(String prompt, List<Data> data) async {
    List<Map<String, dynamic>> jsonList =
        data.map((model) => model.toJson()).toList();

    // Convert the list of JSON objects to a JSON array string
    String jsonDataArray = jsonEncode(jsonList);
    final content = [
      Content.multi([
        TextPart(_explainerPrompt),
        TextPart(prompt),
        TextPart(jsonDataArray)
      ])
    ];

    final response = await _modelGemini15pro.generateContent(content);
    return response.text ?? "No Response Provided";
  }
}
