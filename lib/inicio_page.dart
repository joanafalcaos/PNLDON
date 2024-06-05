import 'package:flutter/material.dart';
import 'package:pnldon/haitiDetalhes_page.dart';
import 'package:pnldon/tinhaDetalhes_page.dart';
import 'biblioteca_page.dart';
import 'livro_page.dart';
import 'perfil_page.dart';
import 'megeraDetalhes_page.dart';
import 'nasciDetalhes_page.dart';
import 'livroDetalhes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Color(0xFFFFA500),
      ),
      body: Container(
        color: Color(0xFFFAFAFA),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              _buildSectionHeader("Continuar Leitura"),
              SizedBox(height: 16),
              _buildBookRow(context),
              SizedBox(height: 24),
              _buildSectionHeader("Para Você"),
              SizedBox(height: 16),
              _buildForYouCarousel(context),
              SizedBox(height: 32),
              _buildSectionHeader("Top 3"),
              SizedBox(height: 16),
              _buildTop10Books(context),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffff6f00), Color(0xFFFFA500)],
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Biblioteca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: (int index) {
            if (index == 0) {
              // Navega para a tela de início
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InicioPage()),
              );
            } else if (index == 1) {
              // Navega para a tela de biblioteca
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BibliotecaPage()),
              );
            } else if (index == 2) {
              // Navega para a tela de perfil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilPage()),
              );
            }
          },
        ),
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

  Widget _buildBookRow(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          String imageName;
          double progress = 0.5; // Simulando o progresso
          if (index == 0) {
            imageName = 'malala.jpg'; // Alterado para a primeira imagem
          } else {
            imageName = 'dezmil.jpg'; // Alterado para a segunda imagem
          }
          return GestureDetector(
            onTap: () {
              // Navega para a tela de livro ao clicar na imagem
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LivroPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 150,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          Image.asset('assets/$imageName', fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 120, // Ajuste do comprimento da barra de progresso
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildForYouCarousel(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          String imageName;
          if (index == 0) {
            imageName = 'nasci.jpg';
          } else if (index == 1) {
            imageName = 'megera.jpg';
          } else if (index == 2) {
            imageName = 'tinha.jpg';
          } else {
            imageName = 'haiti.jpg';
          }
          return GestureDetector(
            onTap: () {
              if (imageName == 'megera.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MegeraDetalhesPage()),
                );
              } else if (imageName == 'nasci.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NasciDetalhesPage()),
                );
              } else if (imageName == 'tinha.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TinhaDetalhesPage()),
                );
              } else if (imageName == 'haiti.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HaitiDetalhesPage()),
                );
              }
              ;
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 150, // Altura da imagem
              width: 100, // Largura da imagem
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/$imageName',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTop10Books(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          String imageName;
          if (index == 0) {
            imageName = 'megera.jpg';
          } else if (index == 1) {
            imageName = 'nasci.jpg';
          } else {
            imageName = 'malala.jpg';
          }
          return GestureDetector(
            onTap: () {
              if (imageName == 'megera.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MegeraDetalhesPage()),
                );
              } else if (imageName == 'nasci.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NasciDetalhesPage()),
                );
              } else if (imageName == 'malala.jpg') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LivroDetalhesPage()),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/$imageName',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
