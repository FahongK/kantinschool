import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Pembuatan Variable Yang Akan Dipakai
  TextEditingController inputNama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kantin School"),
        backgroundColor: Color.fromARGB(104, 30, 66, 36),
      ),
      //Color.fromARGB( opacity, red, gren, blue)
      backgroundColor: Color.fromARGB(245, 49, 180, 82),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              child: TextFormField(
                // Dekorasi untuk TextFormField
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 38, 148, 71),
                  hintText: 'Masukan Nama Anda',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                // controller untuk ...
                controller: inputNama,
                // Ketika Dikirim nanti
                onFieldSubmitted: (values) {
                  // isi blablabla ...
                  inputNama.text = values;
                },
              ),
            ),
          ),

          //untuk kasih jarak antar widget
          Padding(
            padding: EdgeInsets.all(20),
          ),

          // Tombol
          ElevatedButton(
            child: Text("Tampilkan Nama"),
            onPressed: () {
              print(inputNama.text);
            },
          ),
        ],
      ),
    );
  }
}