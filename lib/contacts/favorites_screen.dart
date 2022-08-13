import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22three/contacts/contacts_cubit.dart';
import 'package:hti22three/contacts/contacts_screen.dart';
import 'package:hti22three/contacts/contacts_states.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContactsCubit, ContactsStates>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: context.read<ContactsCubit>().favorites.length,
            itemBuilder: (context, index) {
              print('ListView index => $index');
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
                            context.read<ContactsCubit>().favorites[index]['name'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            context.read<ContactsCubit>().favorites[index]['phone'],
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
                          favorite: 0,
                          id: context.read<ContactsCubit>().favorites[index]['id'],
                        );
                      },
                      icon: const Icon(Icons.favorite),
                    )
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
