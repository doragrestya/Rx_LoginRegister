import 'package:flutter/material.dart';
import 'package:rx_logreg/src/screens/register_screen.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Center(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/gb.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Hello,',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Welcome in My Apps,',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 105),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            color: Colors.blue,
                            child: Text(
                              'L',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            color: Colors.blue,
                            child: Text(
                              'O',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            color: Colors.blue,
                            child: Text(
                              'G',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            color: Colors.blue,
                            child: Text(
                              'I',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            color: Colors.blue,
                            child: Text(
                              'N',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 40),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                emailField(bloc),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                ),
                                passwordField(bloc),
                                Container(
                                  margin: EdgeInsets.only(top: 25.0),
                                ),
                                submitButton(bloc),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                ),
                                Text(
                                  'Or',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
        ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Email Address',
                errorText: snapshot.error,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.blue),
                labelText: 'Password',
                errorText: snapshot.error,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return SizedBox(
          height: 50,
          width: 320,
          child: RaisedButton(
            child: Text('Sign In', style: TextStyle(
                color: Colors.white, fontSize: 20),),
            color: Colors.blue,
            onPressed: snapshot.hasData ? bloc.submit : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
