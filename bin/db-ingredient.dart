import 'interfaces/trackable.dart';
import 'package:meta/meta.dart';

class DbIngredient {
  String uid;
  String readableKey;
  String displayNameEnglish;
  double denesityInKgPerLiter;
  List<Trackable> createUpdateData;

  DbIngredient({
    @required this.uid,
    @required this.readableKey,
    @required this.displayNameEnglish,
    @required this.denesityInKgPerLiter,
    @required this.createUpdateData,
  });

  Map<String, dynamic> toDocument() {
    return {
      "readableKey": readableKey,
      "displayNameEnglish": displayNameEnglish,
      "denesityInKgPerLiter": denesityInKgPerLiter,
      "createUpdateData": createUpdateData.map((data) => data.toJson()).toList()
    };
  }

  factory DbIngredient.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    // return DbIngredient(
    //   firebaseUid: json['firebaseUid'],
    //   timestamp: DateTime.parse(json['timestamp']),
    // );
  }
}
