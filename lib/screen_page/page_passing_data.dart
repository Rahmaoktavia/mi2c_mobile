import 'package:flutter/material.dart';

class PagePassingData extends StatelessWidget {
  const PagePassingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Passing Data'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text('Judul Berita ke ${index}'),
              subtitle: Text('ini sub judul berita ke ${index}'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageGetData(index)));
              },
            ),
          );
        },
      ),
    );
  }
}

class PageGetData extends StatelessWidget {
  final int index;
  const PageGetData(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Page Get Data'),
      ),

      body: Center(
        child: Column(
          children: [
            Text('Ini adalah judul berita ke ${index}'),
            Text('Ini adalah sub judul berita ke ${index}'),
          ],
        ),
      ),
    );
  }
}


class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  // untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Page Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                hintText: 'Input Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: txtPassword,
              obscureText: true, // biar pw nya gak kelihatan
              decoration: InputDecoration(
                hintText: 'Input Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            MaterialButton(
              onPressed: () {
                // cara get data dari text from field
                String username = txtUsername.text;
                String pwd = txtPassword.text;

                // periksa apakah username dan password cocok
                if (username == 'admin' && pwd == '123456') {
                  // Jika cocok, pindah ke halaman lain dengan pesan sambutan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(username: username),
                    ),
                  );
                } else {
                  // Jika tidak cocok, tampilkan snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Username atau password salah.'),
                    ),
                  );
                }
              },
              child: Text('Login'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String username;

  const WelcomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Welcome Admin'),
      ),
      body: Center(
        child: Text(
          'Hello, Selamat Datang Admin',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
