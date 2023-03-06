class CollegeDataModel {
  String? stateProvince;
  List<String>? domains;
  String? country;
  List<String>? webPages;
  String? name;
  String? alphaTwoCode;

  CollegeDataModel(
      {this.stateProvince,
        this.domains,
        this.country,
        this.webPages,
        this.name,
        this.alphaTwoCode});

  CollegeDataModel.fromJson(Map<String, dynamic> json) {
    stateProvince = json['state-province'];
    domains = json['domains'].cast<String>();
    country = json['country'];
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
    alphaTwoCode = json['alpha_two_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state-province'] = this.stateProvince;
    data['domains'] = this.domains;
    data['country'] = this.country;
    data['web_pages'] = this.webPages;
    data['name'] = this.name;
    data['alpha_two_code'] = this.alphaTwoCode;
    return data;
  }
}
