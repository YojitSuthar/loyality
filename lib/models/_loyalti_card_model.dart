
class LoyaltyCardListModel{

  List<LoyaltyCardModel>? list;

  LoyaltyCardListModel(
      this.list
      );

  LoyaltyCardListModel.fromJson(Map<String, dynamic> json) {

    if (json['list'] != null) {
      list = <LoyaltyCardModel>[];
      json['list'].forEach((v) {
        list!.add(new LoyaltyCardModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    return data;
  }

}

class LoyaltyCardModel {
  String? id;
  String? frontCardImg;
  String? backCardImg;
  String? cardNumber;
  String? programName;
  String? url;
  String? notes;
  String? vendorList;

  LoyaltyCardModel(
    this.id,
    this.frontCardImg,
    this.backCardImg,
    this.cardNumber,
    this.programName,
    this.url,
    this.notes,
    this.vendorList);

   LoyaltyCardModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
     frontCardImg = json['front_card_img'];
    backCardImg = json['back_card_img'];
    cardNumber = json['card_number'];
    programName = json['programName'];
    url = json['url'];
    notes = json['notes'];
    vendorList = json['vendor_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']= this.id;
    data['front_card_img'] = this.frontCardImg;
    data['back_card_img'] = this.backCardImg;
    data['card_number'] = this.cardNumber;
    data['programName'] = this.programName;
    data['url'] = this.url;
    data['notes'] = this.notes;
    data['vendor_list'] = this.vendorList;
    return data;
  }


}