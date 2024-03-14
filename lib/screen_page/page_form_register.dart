import 'package:flutter/material.dart';

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PageFormRegister extends StatefulWidget {
  const PageFormRegister({super.key});

  @override
  State<PageFormRegister> createState() => _PageFormRegisterState();
}

class _PageFormRegisterState extends State<PageFormRegister> {
  //untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  String? valAgam, valJk;
  //validasi form
  GlobalKey<FormState> keyForm= GlobalKey<FormState>();
  //untuk datepicker
  Future selectDate() async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if(pickedDate != null){
      setState(() {
        txtTglLahir.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Form Register'),
      ),

      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtFullName,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtEmail,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  onTap: (){
                    selectDate();
                  },
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtTglLahir,
                  decoration: InputDecoration(
                      hintText: 'Tanggal Lahir',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtPassword,
                  obscureText: true,//biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valAgam,
                    underline: Container(),
                    isExpanded: true,
                    hint: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Pilih Agama'),
                    ),
                    items: [
                      "Islam",
                      "Kristen",
                      "Protestan",
                      "Budha"
                    ].map((e){
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val){
                      setState(() {
                        valAgam = val;
                        print('hasil agama: ${valAgam}');
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: "Laki-laki",
                        groupValue: valJk,
                        onChanged: (val){
                          setState(() {
                            valJk = val;
                          });
                        },
                        activeColor: Colors.green,
                        title: Text(
                            'Laki-Laki'
                        ),
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        value: "Perempuan",
                        groupValue: valJk,
                        onChanged: (val){
                          setState(() {
                            valJk = val;
                          });
                        },
                        activeColor: Colors.green,
                        title: Text(
                            'Perempuan'
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),
                MaterialButton(onPressed: (){
                  //cara get data dari text form field
                  setState(() {
                    String username = txtUsername.text;
                    String pwd = txtPassword.text;

                    print('Hasil login: ${username} dan pwd = ${pwd}');
                  });

                },
                  child: Text('Simpan'),
                  color: Colors.green,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}