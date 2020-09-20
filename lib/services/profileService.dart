class ProfileService{
  ProfileInfo getProfileInfo([String username]){
    return ProfileInfo("Roman","Levkovych","assets/profile.jpg","PMi-33","Applied Mathematics and Informatics");
  }
}

class ProfileInfo{
  final String Name;
  final String Surname;
  final String Photo;
  final String Group;
  final String Faculty;
  ProfileInfo(this.Name,this.Surname,this.Photo,this.Group,this.Faculty);
}