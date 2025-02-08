import 'package:flutter/material.dart';

class UiControlsSreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ui controls'),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transport { plane, car, train, boat }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = false;
  Transport selectedTransportation = Transport.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo seleccionado'),
          subtitle: Text(selectedTransportation.name),
          children: [
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transport.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transport.boat;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar por carro'),
              value: Transport.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transport.car;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transport.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transport.plane;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text('By train'),
              subtitle: const Text('Viajar por tren'),
              value: Transport.train,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = Transport.train;
                setState(() {});
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Lunch?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Dinner?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
