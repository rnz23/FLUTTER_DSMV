import 'package:flutter/material.dart';
import 'user_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0), // ← Más padding
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // ← Centrar verticalmente
            children: [
              // TÍTULO
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 32),

              // EMAIL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(), // ← Borde mejorado
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  if (!value.contains('@')) {
                    return 'Debe ser un correo válido';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 20),

              // PASSWORD
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(), // ← Borde mejorado
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es obligatoria';
                  }
                  if (value.length < 6) {
                    return 'Debe tener al menos 6 caracteres';
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Debe tener al menos una mayúscula';
                  }
                  if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Debe tener al menos un número';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 32),

              // BOTÓN INGRESAR
              SizedBox(
                width: double.infinity, // ← Botón ancho completo
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserListScreen(email: _email),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ¿OLVIDASTE TU CONTRASEÑA?
              TextButton(
                onPressed: () {
                  // Aquí podrías navegar a pantalla de recuperación
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Función de recuperación en desarrollo'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 16),

              // SEPARADOR
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[400])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'o',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400])),
                ],
              ),
              const SizedBox(height: 16),

              // BOTÓN CREAR CUENTA
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Aquí podrías navegar a pantalla de registro
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Función de registro en desarrollo'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  child: const Text(
                    'Crear Cuenta',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}