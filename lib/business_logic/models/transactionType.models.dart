class TransactionType {
  int id;
  String name;
  String description;
  int sumChetVelDanType; // 0--for buy 1-- sell
  int debitSideLedger;
  int creditSideLedger;
  int partyLedger;

  // 0 - when Incomplete and 1- when Complete

  TransactionType({
    this.name,
    this.description,
    this.sumChetVelDanType,
    this.debitSideLedger,
    this.creditSideLedger,
    this.partyLedger,
  });
  TransactionType.widthId({
    this.id,
    this.name,
    this.description,
    this.sumChetVelDanType,
    this.debitSideLedger,
    this.creditSideLedger,
    this.partyLedger,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['sumChetVelDanType'] = sumChetVelDanType;
    map['debitSideLedger'] = debitSideLedger;
    map['creditSideLedger'] = creditSideLedger;
    map['partyLedger'] = partyLedger;

    return map;
  }

  factory TransactionType.fromMap(Map<String, dynamic> map) {
    return TransactionType.widthId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      sumChetVelDanType: map['sumChetVelDanType'],
      debitSideLedger: map['debitSideLedger'],
      creditSideLedger: map['creditSideLedger'],
      partyLedger: map['partyLedger'],
    );
  }
}
