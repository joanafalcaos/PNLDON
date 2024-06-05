import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'biblioteca_page.dart';
import 'config_page.dart';
import 'livro_page.dart';

class PerfilPage extends StatefulWidget {
  final String? imagePath;

  PerfilPage({this.imagePath});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  int _selectedIndex = 2; // Índice da página de Perfil
  String _imagePath = 'assets/5.png'; // Caminho padrão da imagem

  @override
  void initState() {
    super.initState();
    if (widget.imagePath != null) {
      _imagePath = widget.imagePath!;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InicioPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BibliotecaPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PerfilPage(imagePath: _imagePath)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFFFA500), // Cor laranja
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfigPage(imagePath: _imagePath)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 50,
              backgroundColor:
                  Colors.transparent, // Define o fundo como transparente
              backgroundImage: AssetImage(_imagePath),
            ),
            SizedBox(height: 16),
            Text(
              'Mariana Silva dos Santos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Quantidade de Livros Lidos: 2',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            _buildSectionHeader("Lista de Leitura"),
            SizedBox(height: 16),
            _buildReadingList(),
            Divider(),
            SizedBox(height: 25),
            _buildSectionHeader("Avaliações"),
            SizedBox(height: 16),
            _buildReviews(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.grey),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.orange),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.orange, // Cor laranja
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildReadingList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          String imageName;
          if (index == 0) {
            imageName = 'contos.jpg';
          } else if (index == 1) {
            imageName = 'dezmil.jpg';
          } else {
            imageName = 'tinha.jpg';
          }

          return GestureDetector(
            onTap: () {
              if (imageName == 'contos.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LivroPage()), // Navegue para a página LivroPage.dart
                );
              } else if (imageName == 'dezmil.jpg' ||
                  imageName == 'tinha.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LivroPage()), // Navegue para a página LivroPage.dart
                );
              }
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[150],
              ),
              child: Image.asset(
                'assets/$imageName',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviews() {
    return Column(
      children: [
        ListTile(
          title: Text('Haiti'),
          leading: Image.asset('assets/haiti.jpg', width: 50, height: 50),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Avaliação: 4.5/5'),
              SizedBox(height: 4),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(), // Linha divisória
        ListTile(
          title: Text('Eu Sou Malala'),
          leading: Image.asset('assets/malala.jpg', width: 50, height: 50),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Avaliação: 5/5'),
              SizedBox(height: 4),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
