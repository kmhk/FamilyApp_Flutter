class UserDetail {
  final String uid;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String oldPassword;
  final String img;
  final String token;
  final String type;

  UserDetail({
    this.uid,
    this.name,
    this.phone,
    this.oldPassword,
    this.email,
    this.password,
    this.img,
    this.type,
    this.token,
  });

  UserDetail fromMap(Map data) => UserDetail(
      uid: data['UID'],
      name: data['name'],
      phone: data['phone'],
      token: data['token'],
      email: data['email'],
      oldPassword: data['oldPassword'],
      password: data['password'],
      img: data['img'],
      type: data['type']);

  Map<String, dynamic> toJson() => {
    'UID' : uid,
    'name' : name,
    'phone' : phone,
    'token' : token,
    'email' : email,
    'oldPassword' : oldPassword,
    'password' : password,
    'img' : img,
    'type' : type,
  };
}