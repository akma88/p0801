import 'package:flutter/material.dart';
import 'package:p0801/calculator.dart';

class PowerOfTwo extends StatefulWidget {
  final Calculator calculator;

  const PowerOfTwo({Key? key, required this.calculator}) : super(key: key);

  @override
  State<PowerOfTwo> createState() => _PowerOfTwoState();
}

class _PowerOfTwoState extends State<PowerOfTwo> {
  final _controller = TextEditingController();

  String _result = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_getResult);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To the power of two:',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextField(
          key: const Key('textField_powerOfTwo'),
          controller: _controller,
          keyboardType: TextInputType.number,
        ),
        const Divider(),
        Text(
          'Result: $_result',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
      ],
    );
  }

  void _getResult() async {
    try {
      final input = double.tryParse(_controller.text);
      final powerOfTwoResult = await widget.calculator.powerOfTwo(input!);
      setState(() {
        _result = powerOfTwoResult.toString();
      });
    } catch (_) {
      setState(() {
        _result = '';
      });
    }
  }
}
