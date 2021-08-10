import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:twinleaksflutter/widgets/small_tree.dart';

class ContractComparisonPage extends StatefulWidget {
  final Future contractComparisonFuture;

  ContractComparisonPage({required this.contractComparisonFuture});

  @override
  _ContractComparisonPageState createState() => _ContractComparisonPageState();
}

class _ContractComparisonPageState extends State<ContractComparisonPage> {
  Map _splitComparisons({required List comparisonsList}) {
    Map result = {};

    comparisonsList.sort((a, b) => b["dice_similarity_coefficient"]
        .compareTo(a["dice_similarity_coefficient"]));

    List top3SimilarComparisons = comparisonsList.sublist(0, 3);
    List remainingComparisons = comparisonsList.sublist(2);

    comparisonsList.sort((a, b) =>
        b["protocol_marketcap_usd"].compareTo(a["protocol_marketcap_usd"]));
    result["forTree"] = top3SimilarComparisons;
    result["forTable"] = remainingComparisons;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comparison",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colours.dark_bg_gray,
              ),
        ),
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

                // print(objSnapshot);

                if (objSnapshot["isError"]) {
                  return Container(
                    child: Center(
                      child: Text(objSnapshot["errorMsg"]),
                    ),
                  );
                } else {
                  List listComparisons = objSnapshot["data"];

                  Map _data =
                      _splitComparisons(comparisonsList: listComparisons);

                  List top3SimilarComparisons = _data["forTree"];

                  List comparisons = _data["forTable"];

                  print(_data);

                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: SmallTree(
                          similarProtocols: top3SimilarComparisons,
                          mainProtocol: {"name": "Your Protocol"},
                        ),
                      ),
                      Text(
                        "Other similar protocols",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      
                    ],
                  );
                }

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
