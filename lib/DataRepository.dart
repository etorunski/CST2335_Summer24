

//responsible for loading and saving itself
import 'dart:async';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class DataRepository{

  static String firstName = ""; //initially it's empty string
  static String lastName = "";

  static void loadData()
  {
    //load your variables here
    var prefs = EncryptedSharedPreferences();
    prefs.getString("firstName").then( (endProduct) {firstName = endProduct;}    );
    //firstName =  await prefs.getString("firstName");
  }


  static void saveData()
  {
    //save your variables
    var prefs = EncryptedSharedPreferences();
    prefs.setString("firstName", firstName);
  }
}