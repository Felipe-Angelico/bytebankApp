import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'form.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfer = [];

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transfer.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfer[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then((receivedTransfer) {
            _refresh(receivedTransfer);
          });
        },
        backgroundColor: Colors.green.shade900,
      ),
    );
  }

  void _refresh(receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() => widget._transfer.add(receivedTransfer));
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Colors.grey),
        title: Text(this._transfer.value.toStringAsFixed(2)),
        subtitle: Text(this._transfer.accountNum.toString()),
      ),
    );
  }
}
