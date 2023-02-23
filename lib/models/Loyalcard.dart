


class Loyalcard {
  String? id;
  String? frontCardImg;
  String? backCardImg;
  String? cardNumber;
  String? programName;
  String? url;
  String? notes;
  String? vendorList;

  Loyalcard({
    this.id='',
    required this.frontCardImg,
    required this.backCardImg,
    required this.cardNumber,
    required this.programName,
    required this.url,
    required this.notes,
    required this.vendorList
  });

  Loyalcard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    frontCardImg = json['frontCardImg'];
    backCardImg = json['backCardImg'];
    cardNumber = json['cardNumber'];
    programName = json['programName'];
    url = json['url'];
    notes = json['notes'];
    vendorList = json['vendorList'];
  }

  Map<String, dynamic> toJson() => {
    'id' : this.id,
    'frontCardImg' : this.frontCardImg,
    'backCardImg' : this.backCardImg,
    'cardNumber' : this.cardNumber,
    'programName' : this.programName,
    'url' : this.url,
    'notes' : this.notes,
    'vendorList' : this.vendorList
  };
}
