class Register{
  final String fullName, userName, password, level;

  Register({this.fullName, this.userName, this.password, this.level});

  factory Register.fromJson(Map<String, dynamic> json){
    return Register(
      fullName: json['fullName'],
      userName: json['userName'],
      password: json['password'],
      level: json['level']
    );
  }

  Map registerToMap(){
    Map map = new Map<String, dynamic>();

    return map;
  }
}