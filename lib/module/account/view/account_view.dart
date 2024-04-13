import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/account/components/account_main_list.dart';
import 'package:todo/module/account/view%20model/account_view_model.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: ChangeNotifierProvider(
        create: (context) => AccountViewModel()..getAccountOptions(),
        child: const AccountMainList(),
      ),
    );
  }
}
