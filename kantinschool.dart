import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Splash(),
      title: 'kantinschool',
      debugShowCheckedModeBanner: false,
    ));

// ==========================================
// BACKGROUND HIJAU GLOBAL
// ==========================================
class GreenBg extends StatelessWidget {
  final Widget child;
  const GreenBg({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B4D24), Color(0xFF2A7337)],
            ),
          ),
          child: SafeArea(child: child),
        ),
      );
}

// ==========================================
// 1. SPLASH SCREEN
// ==========================================
class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) => GreenBg(
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Login())),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80, height: 80, alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                child: const Text('KS', style: TextStyle(color: Colors.white, fontSize: 32)),
              ),
              const SizedBox(height: 10),
              const Text('kantinschool', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              Container(margin: const EdgeInsets.symmetric(vertical: 30), width: 250, height: 350, color: Colors.white24),
              const Text('Tap layar', style: TextStyle(color: Colors.white54)),
            ],
          ),
        ),
      );
}

// ==========================================
// 2. LOGIN SCREEN
// ==========================================
class Login extends StatelessWidget {
  const Login({super.key});
  
  @override
  Widget build(BuildContext context) => GreenBg(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Silahkan Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _input('username:', false),
              const SizedBox(height: 15),
              _input('password:', true),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Menu())),
                child: const Text('Login', style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      );
      
  Widget _input(String label, bool isPass) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white)),
      const SizedBox(height: 5),
      TextField(obscureText: isPass, decoration: const InputDecoration(filled: true, fillColor: Colors.white)),
    ],
  );
}

// ==========================================
// 3. MENU SCREEN
// ==========================================
class Menu extends StatelessWidget {
  const Menu({super.key});
  
  @override
  Widget build(BuildContext context) => GreenBg(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: ['Mie ayam Enak\nBanget 20k', 'Bakso Ayam Enak\nBanget 20k', 'Nasgor Enak\nBanget 20k']
                    .map((m) => _item(context, m)).toList(),
              ),
            ),
            Container(
              height: 60,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.green[800], size: 30),
                  const Icon(Icons.circle, size: 35),
                  Icon(Icons.account_circle, color: Colors.green[800], size: 35),
                ],
              ),
            )
          ],
        ),
      );

  Widget _item(BuildContext ctx, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          leading: const CircleAvatar(radius: 30, backgroundColor: Colors.white24),
          title: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          trailing: ElevatedButton(
            onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const Detail())),
            child: const Text('Beli', style: TextStyle(color: Colors.black)),
          ),
        ),
      );
}

// ==========================================
// 4. DETAIL SCREEN
// ==========================================
class Detail extends StatelessWidget {
  const Detail({super.key});
  
  @override
  Widget build(BuildContext context) => GreenBg(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20), width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
                child: const Column(
                  children: [
                    Text('Detail Jual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text('Mie ayam 2 porsi\n20.000x2\n=Rp40.000\n\nBakso 1 porsi\nNasgor 2 porsi\n20.000x3\n=50.000', textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Text('TOTAL BAYAR\nRp90.000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text('Beli Lagi?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), 
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('', style: TextStyle(color: Colors.black)),
                )
              )
            ],
          ),
        ),
      );
}