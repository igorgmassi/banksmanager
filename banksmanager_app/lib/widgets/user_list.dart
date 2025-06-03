import 'package:flutter/material.dart';
import 'package:banksamanager_app/services/user_service.dart';
import 'package:banksamanager_app/widgets/edit_user_dialog.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 8),
          const Text(
            'Usuários já cadastrados',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: FutureBuilder(
              future: UserService.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final users = snapshot.data;
                  if (users == null || users.isEmpty) {
                    return const Text('No users found');
                  }
                  return ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 165, 215, 255),
                          child: Text(
                            user.name![0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          user.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(user.email ?? ''),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detalhes/usuario',
                            arguments: user.id,
                          );
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              tooltip: 'Editar',
                              onPressed: () async {
                                final result = await showDialog(
                                  context: context,
                                  builder: (_) => EditUserDialog(user: user),
                                );
                                if (result == true) {
                                  // Atualiza a lista após edição
                                  (context as Element).markNeedsBuild();
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'Excluir',
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Excluir usuário'),
                                    content: const Text('Tem certeza que deseja excluir este usuário?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(ctx, false),
                                        child: const Text('Cancelar'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(ctx, true),
                                        child: const Text('Excluir'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await UserService.deleteUser(user.id!);
                                  (context as Element).markNeedsBuild();
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('No users found');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}