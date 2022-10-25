part of 'page.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  var formKey = GlobalKey<FormState>();
  var usernames = TextEditingController();
  var passwords = TextEditingController();
  late SharedPreferences login;
  late bool user;
  bool _CheckBox = false;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    login = await SharedPreferences.getInstance();
    user = (login.getBool('login') ?? true);
    print(user);
    if (user == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => home()));
    }
  }

  @override
  void dispose() {
    usernames.dispose();
    passwords.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset('assets/image/logo.png',
                height: 250, width: 200,),
            Container(
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40), topLeft: Radius.circular(40))),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('welcome',
                  textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 20)),

                  Text('Login',textAlign: TextAlign.left,
                      style: TextStyle(color: white, fontSize: 30)),
                  textFormField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textFormField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) => value == '' ? "Jangan Dikosongkan" : null,
              controller: usernames,
              cursorColor: white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.white),
                labelText: 'Username',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) => value == '' ? "Jangan Dikosongkan" : null,
              controller: passwords,
              cursorColor: white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.white),
                labelText: 'password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          CheckboxListTile(
              title: Text('Belajar Flutter'),
              selected: _CheckBox,
              value: _CheckBox,
              tileColor: white,
              activeColor: white,
              onChanged: (value) {
                    setState(() {
                     _CheckBox = value!;
                    });
                  },
                ), 
          ElevatedButton(
            onPressed: () {
              var username = usernames.text;
              var password = passwords.text;
              if (username != '' && password != '') {
                print('Successfull');
                login.setBool('login', false);
                login.setString('username', username);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: black),
            ),
            style: ElevatedButton.styleFrom(
              primary: color1,
              fixedSize: Size(360,50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ]),
      ),
    );
  }
}
