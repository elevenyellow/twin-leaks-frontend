import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twinleaksflutter/pages/contract_comparison_page.dart';
import 'package:twinleaksflutter/pages/tree_page.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:twinleaksflutter/utils/backend_utils.dart';
import 'package:twinleaksflutter/utils/consts.dart';
import 'package:twinleaksflutter/widgets/top_protocol_row.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedChain = supportedChainList[0];

  late Future compareContractFuture;
  late String _contractAddress;

  _compareContract() {
    print(_contractAddress);
    print(selectedChain);
    compareContractFuture = compareContract(
        contractAddress: _contractAddress, chain: selectedChain);

    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) => TreeViewPage(),
    //   ),
    // );

    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => ContractComparisonPage(
        contractComparisonFuture: compareContractFuture,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 50,
          width: 300,
          child: SvgPicture.asset("/icons/icon_svg.svg"),
        ),
      )

          // Text(
          //   "Twin Leaks",
          //   style: Theme.of(context).textTheme.headline2!.copyWith(color: Colours.twin_leaks_purple),
          // ),

          ),
      body: Container(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                // height: constraints.maxHeight * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Text(
                    "Twin Leaks lets you compare various protocols using their bytecode. It provides you a measure of similarity between two protocols as a percentage.",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // width: constraints.maxWidth * 0.5,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colours.twin_leaks_purple),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      onChanged: (String value) {
                        _contractAddress = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colours.twin_leaks_purple),
                          icon: Icon(
                            Icons.search_sharp,
                            color: Colours.twin_leaks_purple,
                            size: 36,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    hint: Text("chain"),
                    value: selectedChain,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: Theme.of(context).textTheme.headline1,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedChain = newValue!;
                      });
                    },
                    items: supportedChainList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colours.twin_leaks_purple)),
                  onPressed: () {
                    _compareContract();
                  },
                  child: Text(
                    "Compare",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colours.twin_leaks_purple),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                // height: constraints.maxHeight * 0.2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                  child: Text(
                    "Find similar contracts of top DeFi projects",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TopProtocolRow()
            ],
          )),
    );
  }
}
