import 'package:flutter/material.dart';
import 'package:pnldon/livro_page.dart';
import 'inicio_page.dart';
import 'biblioteca_page.dart';
import 'perfil_page.dart';

class NarizDetalhesPage extends StatefulWidget {
  @override
  _NarizDetalhesPageState createState() => _NarizDetalhesPageState();
}

class _NarizDetalhesPageState extends State<NarizDetalhesPage> {
  int _selectedIndex = 1; // Índice da página de Biblioteca

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
          MaterialPageRoute(builder: (context) => PerfilPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Livro'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color(0xffffffff),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/narizdevidro.jpg',
                      height: 200,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nariz de Vidro',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mario Quintana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star_border, color: Colors.orange, size: 16),
                        Icon(Icons.star_border, color: Colors.orange, size: 16),
                        SizedBox(width: 8),
                        Text(
                          '3.0 (50 avaliações)',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LivroPage(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffffff),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Iniciar Leitura',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sinopse',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nariz de Vidro é uma obra clássica que explora os limites da percepção humana. O livro conta a história de um homem comum que, após um acidente, começa a enxergar o mundo de uma maneira totalmente nova. Uma leitura que desafia a mente e toca o coração.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Avaliações',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildReview('Ana Silva',
                      'Uma história envolvente que me fez refletir.'),
                  Divider(),
                  _buildReview(
                      'Pedro Santos', 'Interessante, porém um pouco confuso.'),
                ],
              ),
            ),
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
            icon: Icon(Icons.library_books, color: Colors.orange),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
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

  Widget _buildReview(String name, String review) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(
          name[0],
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(name),
      subtitle: Text(review),
    );
  }
}
