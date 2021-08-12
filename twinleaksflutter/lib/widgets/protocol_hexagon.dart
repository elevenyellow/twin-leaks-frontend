import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProtocolHexgaon extends StatelessWidget {
  final String name;
  final String? similarity;
  final double? elevation;
  final String? url;

  ProtocolHexgaon(
      {required this.name, this.similarity, this.elevation, this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (url != null) {
          await canLaunch(this.url.toString())
              ? await launch(this.url.toString())
              : throw 'Could not launch';
        }
      },
      child: HexagonWidget.flat(
        cornerRadius: 20,
        elevation: elevation != null ? elevation : 0,
        width: 120,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colours.twin_leaks_purple),
                ),
              ),
            ),
            similarity != null
                ? Text(similarity.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colours.twin_leaks_purple))
                : Container()
          ],
        ),
      ),
    );
  }
}
