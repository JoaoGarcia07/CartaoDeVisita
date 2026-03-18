import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

void main() {
  runApp(const CartaoVisita());
}

class CartaoVisita extends StatelessWidget {
  const CartaoVisita({super.key});

  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF009739), 
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEDD00), 
                    borderRadius: BorderRadius.circular(30), 
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 238, 0).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8), 
                      )
                    ],
                  ),
                  child: Column( 
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xFF012169), 
                        child: CircleAvatar(
                          radius: 51,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 60, color: Color(0xFF012169)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Joao Vitor Prestes Garcia', 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold, 
                          color: Color(0xFF012169),
                        ),
                      ),

                      const Text(
                        'ADS 5ª FASE | SENAC', 
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF009739),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      
                      const Divider(height: 40, color: Color(0xFF012169), thickness: 1),

                      _buildInfoCard(Icons.email, 'joao.garcia2@alunos.senac.sc.br'), 
                      _buildInfoCard(Icons.phone, '+55 (47) 99610-5015'),

                      const SizedBox(height: 20),

                      Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                            Icons.link, 
                            'LinkedIn', 
                            'https://www.linkedin.com/in/jo%C3%A3o-vitor-prestes-garcia-3a573a233/'
                          ),
                          const SizedBox(width: 40),
                          _buildSocialButton(
                            Icons.code, 
                            'GitHub', 
                            'https://github.com/JoaoGarcia07'
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icone, String texto) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icone, color: const Color(0xFF012169)),
        title: Text(
          texto,
          style: const TextStyle(color: Color(0xFF012169), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icone, String label, String url) {
    return InkWell(
      onTap: () => _abrirLink(url),
      child: Column(
        children: [
          Icon(icone, color: const Color(0xFF012169), size: 32),
          const SizedBox(height: 8),
          Text(
            label, 
            style: const TextStyle(color: Color(0xFF012169), fontWeight: FontWeight.bold, fontSize: 12)
          ),
        ],
      ),
    );
  }
}