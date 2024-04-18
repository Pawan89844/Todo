import 'package:flutter/cupertino.dart';
import 'package:todo/module/account/model/account_model.dart';
import 'package:todo/presentation/account_static.dart';

class AccountViewModel extends ChangeNotifier with AccountStatic {
  //OBJECTS
  AccountModel? account;

  // final AccountStatic _accounts = AccountStatic();
  // LISTS

  // PRIMITIVE TYPES

  // METHODS AND FUNCTIONS

  void getAccountOptions() async {
    AccountModel accmodel = await parseAccount();
    account = accmodel;
    notifyListeners();
  }
}
