import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();

    // FILTRAR USUARIOS ACTIVOS
    final usuariosActivos = viewModel.usuarios.where((user) => user.activo).toList();

    // VARIABLE PARA CONTROLAR EL FILTRO
    bool _mostrarSoloActivos = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // BOTÓN DE FILTRO
          StatefulBuilder(
            builder: (context, setState) {
              return IconButton(
                icon: Icon(
                  _mostrarSoloActivos ? Icons.filter_alt : Icons.filter_alt_off,
                  color: _mostrarSoloActivos ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _mostrarSoloActivos = !_mostrarSoloActivos;
                  });
                },
              );
            },
          ),
        ],
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          final listaMostrar = _mostrarSoloActivos ? usuariosActivos : viewModel.usuarios;

          return Column(
            children: [
              // INDICADOR DE FILTRO
              if (_mostrarSoloActivos)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.blue[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list, color: Colors.blue[700], size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'Mostrando solo usuarios activos: ${usuariosActivos.length}',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

              // LISTA DE USUARIOS
              Expanded(
                child: listaMostrar.isEmpty
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _mostrarSoloActivos
                            ? 'No hay usuarios activos'
                            : 'No hay usuarios registrados\nPresiona el botón + para agregar uno',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView.builder(
                  itemCount: listaMostrar.length,
                  itemBuilder: (context, index) {
                    final user = listaMostrar[index];
                    final originalIndex = viewModel.usuarios.indexOf(user);

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: user.genero == 'Masculino'
                              ? Colors.blue[100]
                              : Colors.pink[100],
                          child: Text(
                            user.nombre[0].toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          user.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${user.genero} - ${user.edad} años'),
                            Text(
                              user.email,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              user.activo ? '🟢 Activo' : '🔴 Inactivo',
                              style: TextStyle(
                                color: user.activo ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () async {
                                final actualizado = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UserFormScreen(
                                      usuario: user,
                                      indice: originalIndex,
                                    ),
                                  ),
                                );
                                if (actualizado != null && actualizado is User) {
                                  viewModel.editarUsuario(originalIndex, actualizado);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Usuario actualizado correctamente'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Eliminar Usuario'),
                                    content: Text('¿Estás seguro de eliminar a ${user.nombre}?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          viewModel.eliminarUsuario(originalIndex);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Usuario eliminado correctamente'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          if (nuevoUsuario != null && nuevoUsuario is User) {
            viewModel.agregarUsuario(nuevoUsuario);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuario agregado correctamente'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}