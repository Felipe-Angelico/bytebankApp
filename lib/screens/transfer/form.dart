import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando Transferência';
const _valueLabel = 'Valor';
const _valueHint = '0.00';
const _accountNumLabel = 'Número da Conta';
const _accountNumHint = '0000';
const _elevatedButtonText = 'Confirmar';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumController = TextEditingController();

  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
            newController: _accountNumController,
            newLabel: _accountNumLabel,
            newHint: _accountNumHint,
          ),
          Editor(
            newController: _valueController,
            newLabel: _valueLabel,
            newHint: _valueHint,
            newIcon: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text(_elevatedButtonText),
            onPressed: () => _createTransfer(context),
          ),
        ]),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNum = int.tryParse(_accountNumController.text);
    final double? value = double.tryParse(_valueController.text);
    if (accountNum != null && value != null) {
      final newTransfer = Transfer(value, accountNum);
      Navigator.pop(context, newTransfer);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Transferencia{valor: $value, numeroConta: $accountNum}',
          ),
        ),
      );
    }
  }
}
