import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/account/view%20model/account_view_model.dart';
import 'package:todo/style/theme/app_colors.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class AccountMainList extends StatelessWidget {
  const AccountMainList({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AccountViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DrawerHeader(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PhysicalModel(
                color: Colors.black12,
                shape: BoxShape.circle,
                elevation: 10.0,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30.0,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.center,
                child: const AppHeading('Pawan Kumar', shadows: [
                  Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 1.0,
                    color: Colors.black,
                  ),
                ]),
              ),
            ],
          )),
        ),
        if (viewModel.account != null) ...[
          ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.account?.iconCard.length,
            itemBuilder: (context, i) {
              var data = viewModel.account?.iconCard[i];

              return Column(
                children: [
                  if (i == 3)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                  _ProfileOptionsCard(
                    icon: IconData(data?.iconCodePoint as int,
                        fontFamily: viewModel.account?.iconFontFamily,
                        fontPackage: viewModel.account?.iconFontPackage),
                    tag: data?.tag as String,
                    isLogout: data?.id == 4,
                  )
                ],
              );
            },
          ),
        ]
      ],
    );
  }
}

class _ProfileOptionsCard extends StatelessWidget {
  final IconData icon;
  final String tag;
  final bool isLogout;
  const _ProfileOptionsCard(
      {required this.icon, required this.tag, this.isLogout = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Column(
        children: [
          Card(
            color: AppColor.cardColor,
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(icon)),
                  AppText(tag),
                  const Spacer(),
                  Visibility(
                    visible: !isLogout,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: const Icon(CupertinoIcons.chevron_right)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
