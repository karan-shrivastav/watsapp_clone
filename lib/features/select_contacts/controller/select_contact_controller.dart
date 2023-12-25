import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/select_contact_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectedContactRepository = ref.watch(selectContactsRepositoryProvider);
  return selectedContactRepository.getContacts();
});

final selectContactControllerProvider = Provider((ref){
  final selectedContactRepository = ref.watch(selectContactsRepositoryProvider);
  return SelectContactController(
      ref: ref,
      selectedContactRepository: selectedContactRepository
  );
});

class SelectContactController {
  final ProviderRef ref;
  final SelectedContactRepository selectedContactRepository;

  SelectContactController({
    required this.ref,
    required this.selectedContactRepository,
  });

  void selectContact(Contact selectedContact, BuildContext context){
     selectedContactRepository.selectContact(selectedContact, context);
  }
}
