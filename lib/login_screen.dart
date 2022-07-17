import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              "Login Screen",
              style: TextStyle(
                fontSize: 33,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              maxLength: 12,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                // border: InputBorder.none,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: Text("Forget password?"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Login"),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Regitser"),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
