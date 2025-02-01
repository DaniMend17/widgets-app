import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 1.0, 'label': 'elevation 0'},
  {'elevation': 2.0, 'label': 'elevation 1'},
  {'elevation': 3.0, 'label': 'elevation 2'},
  {'elevation': 4.0, 'label': 'elevation 3'},
  {'elevation': 5.0, 'label': 'elevation 4'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Screen'),
        ),
        body: _CardsView());
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    // Otra alternativa a ListView.builder.
    return SingleChildScrollView(
      child: Column(children: [
        ...cards.map(
          (e) => _CardType1(e['label'], e['elevation']),
        ),
        ...cards.map(
          (e) => _CardType2(e['label'], e['elevation']),
        ),
      ]),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1(this.label, this.elevation);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite))),
            Align(alignment: Alignment.bottomLeft, child: Text(label))
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2(this.label, this.elevation);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.outline,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), 
          topRight: Radius.circular(20)
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite))),
            Align(alignment: Alignment.bottomLeft, child: Text('$label - outlined'))
          ],
        ),
      ),
    );
  }
}
