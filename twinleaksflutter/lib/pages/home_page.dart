import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twinleaksflutter/pages/contract_comparison_page.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:twinleaksflutter/utils/backend_utils.dart';
import 'package:twinleaksflutter/utils/consts.dart';
import 'package:twinleaksflutter/widgets/top_protocol_row.dart';

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
        title: Text(
          "Twin Leaks",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {},
        ),
        backgroundColor: Colours.dark_bg_color,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.copy_sharp,
                color: Colors.white,
                size: 120,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                // height: constraints.maxHeight * 0.2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                  child: Text(
                    "Twin Leaks lets you compare various protocols using their bytecode. It provides you a measure of similarity between two protocols as a percentage.",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // width: constraints.maxWidth * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colours.dark_green),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      onChanged: (String value) {
                        _contractAddress = value;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.search_sharp,
                            color: Colors.white,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colours.dark_green)),
                  onPressed: () {
                    _compareContract();
                  },
                  child: Text(
                    "Compare",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colours.dark_green),
                  ),
                ),
              ),
              Container(
                // height: constraints.maxHeight * 0.2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                  child: Text(
                    "Find similar contracts of top DeFi projects",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
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
