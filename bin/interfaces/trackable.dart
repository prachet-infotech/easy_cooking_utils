import 'package:meta/meta.dart';

class Trackable {
  String firebaseUid;
  DateTime timestamp;

  Trackable({
    @required this.firebaseUid,
    @required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {'firebaseUid': firebaseUid, 'timestamp': timestamp.toString()};
  }

  factory Trackable.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Trackable(
      firebaseUid: json['firebaseUid'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
