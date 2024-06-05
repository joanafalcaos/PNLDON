import 'package:flutter/material.dart';

class SelecionarImagemPage extends StatelessWidget {
  final Function(String) onImageSelected;

  SelecionarImagemPage({required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Imagem de Perfil'),
        backgroundColor: Colors.orange,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          String imageName;
          if (index == 0) {
            imageName = 'assets/1.png';
          } else if (index == 1) {
            imageName = 'assets/2.png';
          } else if (index == 2) {
            imageName = 'assets/3.png';
          } else if (index == 3) {
            imageName = 'assets/4.png';
          } else if (index == 4) {
            imageName = 'assets/5.png';
          } else {
            imageName = 'assets/6.png';
          }

          return GestureDetector(
            onTap: () {
              onImageSelected(imageName);
              Navigator.pop(context);
            },
            child: Image.asset(imageName),
          );
        },
      ),
    );
  }
}
