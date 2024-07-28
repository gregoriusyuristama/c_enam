import 'dart:convert';
import 'dart:io';

import 'package:c_enam/Features/Chat/Model/merchant_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiUtilites {
  static GeminiUtilites shared = GeminiUtilites();
  static String apiKey = "AIzaSyAaId5V1ZcXcjbJIDU8LMoHS_upOh-WZnM";

  final String _explainerPrompt = """
Act like you were integrated to food delivery app, you can access all data that available from data that i passed on. Generate top 3 food that suitable most to the users input in JSON code format with structure:
And also give the output based on 3 of data that I already passed on. And please don't markdown the json
1. [response]
2. [food_information]:
    1. image_src
    2. name
    3. merchant_name
    4. price (in Indonesia Rupiah (IDR))


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

    final schema = Schema(SchemaType.object, properties: {
      'response': Schema(SchemaType.string),
      'food_information': Schema(SchemaType.array,
          items: Schema(SchemaType.object, properties: {
            'image_src': Schema(SchemaType.string),
            'name': Schema(SchemaType.string),
            'merchant_name': Schema(SchemaType.string),
            'price': Schema(SchemaType.string),
          })),
    });

    final response =
        await GeminiUtilites.shared._modelGemini15pro.generateContent(
      content,
      generationConfig: GenerationConfig(
        responseMimeType: "application/json",
        responseSchema: schema,
      ),
    );

    return response.text ?? "No Response Provided";
  }
}
