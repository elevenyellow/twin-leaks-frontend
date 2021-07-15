import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twinleaksflutter/styles/colors.dart';

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
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "Aave",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          ),
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "UniswapV2",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          ),
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "Compound",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          ),
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "PancakeSwap",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          ),
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "DonutSwap",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          ),
          HexagonWidget.flat(
            cornerRadius: 20,
            elevation: 16,
            width: 120,
            height: 80,
            child: Text(
              "SaltSwap",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colours.twin_leaks_purple),
            ),
          )
        ],
      ),
    );
  }
}
