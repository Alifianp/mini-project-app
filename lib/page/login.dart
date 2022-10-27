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
          context, new MaterialPageRoute(builder: (context) => bottomnav()));
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
        backgroundColor: Color(0xFFDBF1F7),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: FadeInUp(
          child: Container(
            margin: EdgeInsets.only(top: 12),
            child: Column(
              children: [
                Image.asset(
                  'assets/image/logo.png',
                  height: 250,
                  width: 200,
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFF136673),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('WELCOME',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text('LOGIN',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                        ],
                      ),
                      textFormField(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Padding textFormField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              validator: (value) => value == '' ? "Jangan Dikosongkan" : null,
              controller: usernames,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.white),
                labelText: 'Username',
                hintStyle: TextStyle(color: Colors.white),
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
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
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
          SizedBox(
            height: 45,
          ),
          ElevatedButton(
            onPressed: () {
              var username = usernames.text;
              var password = passwords.text;
              if (username != '' && password != '') {
                print('Successfull');
                login.setBool('login', false);
                login.setString('username', username);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => bottomnav()));
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFDBF1F7),
              fixedSize: Size(360, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ]),
      ),
    );
  }
}
