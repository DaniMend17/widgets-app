import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress indicator'),
        ),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black26,
          ),
          SizedBox(
            height: 30,
          ),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(
          Duration(milliseconds: 100),
          (value) {
            return value / 100;
          },
        ).takeWhile(
          (value) => value < 100,
        ),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValue,
                ))
              ],
            ),
          );
        });
  }
}
