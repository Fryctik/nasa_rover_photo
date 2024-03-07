
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getNasaData() async {
  Uri url = Uri.parse(
    'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=Jg7nnbsbjlxQ1hGZUpbVOG8JMDD1DGv8B3rY0g0I'
  );
  final responce = await http.get(url);

  if(responce.statusCode == 200){
    return json.decode(responce.body);
  } else {
    throw Exception('Error: ${responce.reasonPhrase}');
  }
}