enum UserType {
  client('client'),
  company('company');
  const UserType(this.type);
  final String type;
}

extension ConvertMessage on String{
  UserType? toUserType(){
    switch(this){
      case 'company':
      case 'True':
        return UserType.company;
      case 'client':
      case 'False':
        return UserType.client;
      default:
        return null;
    }
  }
}

extension Parameter on UserType {
  String toParameter() {
    switch (this) {
      case UserType.company:
        return "company";
      default:
        return "client";
    }
  }
}