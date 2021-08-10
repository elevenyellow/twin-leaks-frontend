import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:twinleaksflutter/widgets/protocol_hexagon.dart';

class TopProtocolRow extends StatelessWidget {
  const TopProtocolRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProtocolHexgaon(
            name: "UniswapV2",
          ),
          ProtocolHexgaon(
            name: "Aave",
          ),
          ProtocolHexgaon(
            name: "Compound",
          ),
          ProtocolHexgaon(
            name: "PancakeSwap",
          ),
          ProtocolHexgaon(
            name: "DonutSwap",
          ),
          ProtocolHexgaon(
            name: "SaltSwap",
          ),
        ],
      ),
    );
  }
}
