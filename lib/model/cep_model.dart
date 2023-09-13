class CepModel {
  List<Results> results = [];

  CepModel({required this.results});

  CepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  String? objectId;
  String cep;
  String street;
  String district;
  String city;
  String state;

  Results({this.objectId = '', required this.cep, required this.street, required this.district, required this.city, required this.state});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'objectId': objectId,
      'cep': cep,
      'street': street,
      'district': district,
      'City': city,
      'state': state,
    };
  }

  factory Results.fromJson(Map<String, dynamic> map) {
    return Results(
      objectId: map['objectId'] as String,
      cep: map['cep'] as String,
      street: map['street'] as String,
      district: map['district'] as String,
      city: map['City'] as String,
      state: map['state'] as String,
    );
  }
}
