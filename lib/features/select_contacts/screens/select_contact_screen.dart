import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watsapp_clone/common/error.dart';
import '../../../widgets/loader.dart';
import '../controller/select_contact_controller.dart';

class SelectedContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contacts';
  const SelectedContactsScreen({Key? key}) : super(key: key);

  void selectContact(WidgetRef ref, Contact selectedContact, BuildContext context){
    ref.read(selectContactControllerProvider).selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contact'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
        data: (contactList) => ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return InkWell(
                onTap: () => selectContact(ref, contact, context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      contact.displayName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: contact.photo == null
                        ? null
                        : CircleAvatar(
                      backgroundImage: MemoryImage(contact.photo!),
                      radius: 30,
                    ),
                  ),
                ),
              );
            }),
        error: (err, trace) => ErrorScreen(error: err.toString()),
        loading: () => const Loader(),
      ),
    );
  }

}


