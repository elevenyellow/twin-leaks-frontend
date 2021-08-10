import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:twinleaksflutter/styles/colors.dart';
import 'package:twinleaksflutter/widgets/protocol_hexagon.dart';

class SmallTree extends StatefulWidget {
  final Map mainProtocol;
  final List similarProtocols;

  SmallTree({required this.similarProtocols, required this.mainProtocol});

  @override
  _SmallTreeState createState() => _SmallTreeState();
}

class _SmallTreeState extends State<SmallTree> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        // decoration: BoxDecoration(border: Border.all()),
        child: InteractiveViewer(
          panEnabled: false,
          scaleEnabled: false,
          alignPanAxis: true,
          constrained: false,
          child: GraphView(
            graph: graph,
            algorithm:
                BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
            paint: Paint()
              ..color = Colours.twin_leaks_purple
              ..strokeWidth = 2
              ..style = PaintingStyle.stroke,
            builder: (Node node) {
              var a = node.key.value as int;

              if (a == 1) {
                return ProtocolHexgaon(name: widget.mainProtocol["name"]);
              } else {
                double _similarity = double.parse(widget.similarProtocols[a - 2]
                        ["dice_similarity_coefficient"]
                    .toString());

                return ProtocolHexgaon(
                  name: widget.similarProtocols[a - 2]["comparisonTo"],
                  similarity: _similarity.toStringAsFixed(4),
                );
              }
            },
          ),
        ));
  }
}
