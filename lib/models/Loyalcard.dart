


class Loyalcard {
  String? id;
  String? frontCardImg;
  String? backCardImg;
  String? cardNumber;
  String? programName;
  String? url;
  String? notes;
  String? vendorList;

  Loyalcard(
      {this.id,
        this.frontCardImg,
        this.backCardImg,
        this.cardNumber,
        this.programName,
        this.url,
        this.notes,
        this.vendorList});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['frontCardImg'] = this.frontCardImg;
    data['backCardImg'] = this.backCardImg;
    data['cardNumber'] = this.cardNumber;
    data['programName'] = this.programName;
    data['url'] = this.url;
    data['notes'] = this.notes;
    data['vendorList'] = this.vendorList;
    return data;
  }
}
