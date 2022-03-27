import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/try/newPage.dart';
import 'package:flutter_firebase/try/widgets/number.dart';
import 'package:flutter_firebase/try/widgets/passShow.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  int num = 0;
  List<int> pass = [0, 0, 0, 0, 0, 0];
  List<int> correctPass = [1, 2, 3, 4, 5, 6];
  int pos = 0;
  String tex = 'Submit';
  List<int> pass1 = [];

  void Edit(int num2) {
    try {
      setState(() {
        pass[pos] = num2;
        if (pos == 5) {
          passwordVerifier();
          if (tex == 'Wrong Password') {
            const snackbar = SnackBar(
                content: Text('Wrong Password',
                    style: TextStyle(color: Colors.red)));
            Scaffold.of(context).showSnackBar(snackbar);
          }
        }
      });
    } catch (e) {
      final snackbar = SnackBar(
        content: Text(
          '$e',
          style: const TextStyle(color: Colors.red),
        ),
        duration: const Duration(seconds: 2),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }

    setState(() {
      pos++;
    });
    setState(() {
      pass1 = pass;
    });
    if (pos == 6) {
      reset();
    }
  }

  void reset() {
    setState(() {
      pos = 0;
      pass[0] = 0;
      pass[1] = 0;
      pass[2] = 0;
      pass[3] = 0;
      pass[4] = 0;
      pass[5] = 0;
    });
  }

  void passwordVerifier() {
    if (pass1.length == 6) {
      if (pass1.toString() == correctPass.toString()) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewScreen()));
        setState(() {
          tex = 'Access Granted';
        });
      }
    }
    if (pass1.toString() != correctPass.toString()) {
      setState(() {
        tex = 'Wrong Password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Password Please',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: h * 0.15,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 6,
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: widgets1(
                        num: pass[index],
                      ),
                    );
                  }),
            ),
            Container(
              height: 350,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 65,
                            mainAxisSpacing: 35),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Numbers1(
                          num: index + 1,
                        ),
                        onTap: () {
                          Edit(index + 1);
                        },
                      );
                    }),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              FlatButton(
                  onPressed: () {
                    passwordVerifier();
                  },
                  child: Text('$tex')),
              FlatButton(
                  onPressed: () {
                    reset();
                  },
                  child: Text('Reset')),
            ]),
          ],
        ),
      ),
    );
  }
}
