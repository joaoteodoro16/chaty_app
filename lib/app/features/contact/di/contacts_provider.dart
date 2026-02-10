import 'package:chaty_app/app/features/contact/presentation/pages/contacts_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ContactsProvider {
  ContactsProvider._();

  static Widget get provider => MultiProvider(
    providers: [Provider(create: (context) => Object())],
    child: ContactsPage(),
  );
}
