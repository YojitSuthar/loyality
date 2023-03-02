class LoyalCard {
  String? id;
  String? frontCardImg;
  String? backCardImg;
  String? cardNumber;
  String? programName;
  String? url;
  String? notes;
  String? vendorList;

  LoyalCard(  {
    this.id='',
     this.frontCardImg,
     this.backCardImg,
     this.cardNumber,
     this.programName,
     this.url,
     this.notes,
     this.vendorList
  });

  LoyalCard.fromJson(Map<String, dynamic> json) {
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
