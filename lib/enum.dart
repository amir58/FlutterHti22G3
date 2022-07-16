void main(){

  saveData(Keys.username, "Amir");
  saveData(Keys.email, "amir@gmail.com");
  saveData(Keys.language, "ar");
  saveData(Keys.theme, "dark");
  saveData(Keys.userId, "1");

  getData(Keys.username);
  getData(Keys.email);
  getData(Keys.language);
  getData(Keys.theme);
}

enum Keys{
  username,
  email,
  language,
  theme,
  userId
}

void saveData(Keys key, String value){

}

String getData(Keys key){
  return "";
}