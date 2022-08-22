import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22three/contacts/contacts_cubit.dart';
import 'package:hti22three/contacts/contacts_states.dart';

import 'main_contacts_screen.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ContactsCubit>().getContacts();
  }

  // final List<MyContact> myContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContactsCubit, ContactsStates>(
        buildWhen: (previous, current) => current is GetContactsState,
        builder: (context, state) {
          print('Contacts State => $state');
          return ListView.builder(
            itemCount: state is GetContactsState ? state.contacts.length : 0,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.read<ContactsCubit>().contacts[index]
                                ['name'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            context.read<ContactsCubit>().contacts[index]
                                ['phone'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<ContactsCubit>().updateContact(
                                favorite: context
                                            .read<ContactsCubit>()
                                            .contacts[index]['favorite'] ==
                                        0
                                    ? 1
                                    : 0,
                                id: context
                                    .read<ContactsCubit>()
                                    .contacts[index]['id'],
                              );
                        },
                        icon: Icon(context.read<ContactsCubit>().contacts[index]
                                    ['favorite'] ==
                                0
                            ? Icons.favorite_border
                            : Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          context.read<ContactsCubit>().deleteContact(
                                id: context
                                    .read<ContactsCubit>()
                                    .contacts[index]['id'],
                              );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyContact {
  String name;
  String phone;

  MyContact(this.name, this.phone);
}
