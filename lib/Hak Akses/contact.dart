import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_application_1/Hak%20Akses/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var _contacts;

  Future<void> getContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    print(contacts);
    setState(() {
      _contacts = contacts;
      print(_contacts);
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ContactProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Contact')),
        body: _contacts != null && _contacts.length != 0
            ? ListView.builder(
                itemCount: _contacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact? contact = _contacts?.elementAt(index);
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    tileColor: (contact == prov.darurat
                        ? Colors.red[200]
                        : Colors.white),
                    leading:
                        (contact?.avatar != null && contact!.avatar!.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar!),
                              )
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(contact!.initials()),
                              ),
                    trailing: (contact == prov.darurat
                        ? Icon(Icons.emoji_emotions)
                        : SizedBox()),
                    title: Text(contact.displayName ?? ''),
                    subtitle: Text(contact.phones![0].value!),
                    onLongPress: contact == prov.darurat
                        ? null
                        : () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Kamu akan menjadikan "${contact.displayName}" sebagai kontak daruratmu?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            prov.setDarurat(contact);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ya')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Batal')),
                                    ],
                                  );
                                });
                          },
                  );
                },
              )
            : Center(
                child: Text('Kontak Kosong'),
              ));
  }
}
