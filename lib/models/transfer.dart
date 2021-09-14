class Transfer {
  final double value;
  final int accountNum;

  Transfer(
    this.value,
    this.accountNum,
  );

  @override
  String toString() {
    return 'Transferencia{valor: $value, numeroConta: $accountNum}';
  }
}
