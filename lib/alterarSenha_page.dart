import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AlterarSenhaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Senha'),
        backgroundColor: Color(0xFFFFA500),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _currentPasswordController,
                decoration: InputDecoration(labelText: 'Senha Atual'),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira sua senha atual';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'Nova Senha'),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira a nova senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmNewPasswordController,
                decoration: InputDecoration(labelText: 'Confirmar Nova Senha'),
                obscureText: true,
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Lógica para alterar a senha
                    var currentUser = await ParseUser.currentUser();
                    if (currentUser != null) {
                      var response = await ParseUser(
                        currentUser.username,
                        _currentPasswordController.text,
                        currentUser.emailAddress,
                      ).login();

                      if (response.success) {
                        currentUser.password = _newPasswordController.text;
                        var result = await currentUser.save();

                        if (result.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Senha alterada com sucesso!')),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erro ao alterar a senha')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Senha atual incorreta')),
                        );
                      }
                    }
                  }
                },
                child: Text('Alterar Senha'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFA500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
