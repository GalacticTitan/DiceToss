class UserData {
  UserData({
      this.lastDiceValue, 
      this.count, 
      this.score, 
      this.email,});

  UserData.fromJson(dynamic json) {
    lastDiceValue = json['lastDiceValue'];
    count = json['count'];
    score = json['score'];
    email = json['email'];
  }
  int? lastDiceValue;
  int? count;
  int? score;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lastDiceValue'] = lastDiceValue;
    map['count'] = count;
    map['score'] = score;
    map['email'] = email;
    return map;
  }

}