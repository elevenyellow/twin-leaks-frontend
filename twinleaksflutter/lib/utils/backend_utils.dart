import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> compareContract(
    {required String contractAddress, required String chain}) async {
  Map<String, String> dataToPost = {
    "contractAddress": contractAddress,
    "chain": chain.toString(),
  };

  print(dataToPost);

  // Uri uri = Uri.http("192.168.1.47:8000", "/compareContractToTopDefiProtocols");
  Uri uri = Uri.http("172.20.10.4:8000", "/compareContractToTopDefiProtocols");

  final compareContractApiResponse = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{"contractAddress": contractAddress, "chain": chain}),
  );

  // print(compareContractApiResponse.request.toString());

  if (compareContractApiResponse.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (compareContractApiResponse.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to connect to API');
  }
}
