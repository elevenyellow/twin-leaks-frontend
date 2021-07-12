import 'dart:convert';

import 'package:flutter/material.dart';

class ContractComparisonPage extends StatefulWidget {
  final Future contractComparisonFuture;

  ContractComparisonPage({required this.contractComparisonFuture});

  @override
  _ContractComparisonPageState createState() => _ContractComparisonPageState();
}

class _ContractComparisonPageState extends State<ContractComparisonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparison"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: widget.contractComparisonFuture,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return Container();
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                var objSnapshot = jsonDecode(snapshot.data.toString());
                if (objSnapshot["isError"]) {
                  return Container(
                    child: Center(
                      child: Text(objSnapshot["errorMsg"]),
                    ),
                  );
                } else {
                  List listComparisons = objSnapshot["data"];

                  return ListView.builder(
                    itemBuilder: (ctx, position) {
                      return ListTile(
                        title: Text(listComparisons[position]["comparisonTo"]
                            .toString()),
                        subtitle: Text(listComparisons[position]
                                ["dice_similarity_coefficient"]
                            .toString()),
                      );
                    },
                    itemCount: listComparisons.length,
                  );
                }
                return Container();

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
