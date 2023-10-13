import '../models/users_model.dart';
import '../repositories/users_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<UsersModel> users = [];
  final UsersRepo usersRepo = UsersRepo();
  getUsers() async {
    users = await usersRepo.getUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit App'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        users[index].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(users[index].email),
                    ),
                  ),
                )),
    );
  }
}
