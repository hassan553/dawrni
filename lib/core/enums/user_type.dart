enum UserType {
  client('client'),
  company('company');
  const UserType(this.type);
  final String type;
}

extension ConvertMessage on String{
  UserType? toUserType(){
    switch(this){
      case 'client':
        return UserType.client;
      case 'company':
        return UserType.company;
      default:
        return null;
    }
  }
}