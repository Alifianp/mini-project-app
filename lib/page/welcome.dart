part of 'page.dart';
// ignore_for_file: prefer_const_constructors

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('assets/image/Lake 1.jpg',
                height: 100, fit: BoxFit.fill),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."There is no one who loves pain itself, who seeks after it and wants to have it,simply because it is pain..."',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()));},
                child: Text(
                  'Started',
                  style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.w400, 
                      color: color1),
                ),
                style: ElevatedButton.styleFrom(
                  primary: color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
