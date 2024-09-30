import 'package:flutter/material.dart';
import 'package:bus_buddy2/screens/signin_screen.dart';
import 'package:bus_buddy2/theme/theme.dart';
import 'package:bus_buddy2/widgets/custom_scaffold.dart';
import 'package:bus_buddy2/api_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = false; // Change default value to false
  final _apiService = ApiService();

  String _fullname = '';
  String _email = '';
  String _password = '';
  Color buttonColor = const Color.fromARGB(255, 8, 2, 66);

  Future<void> _register() async {
    if (_formSignupKey.currentState!.validate() && agreePersonalData) {
      try {
        final success =
            await _apiService.registerUser(_fullname, _email, _password);
        if (success['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(success['message'])),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else if (!agreePersonalData) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please agree to the processing of personal data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_white.png',
            height: 250.0,
            fit: BoxFit.contain,
          ),
          const Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          fontFamily: 'GabrielSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Log in to your account',
                        style: TextStyle(
                          fontFamily: 'GabrielSans',
                          fontSize: 16.0,
                          color: Color.fromARGB(247, 11, 11, 11),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      TextFormField(
                        onChanged: (value) => _fullname = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Full Name',
                            style: TextStyle(fontFamily: 'GabrielSans'),
                          ),
                          hintText: 'Enter Full Name',
                          hintStyle: const TextStyle(
                            fontFamily: 'GabrielSans',
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        onChanged: (value) => _email = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Email',
                            style: TextStyle(fontFamily: 'GabrielSans'),
                          ),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            fontFamily: 'GabrielSans',
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        onChanged: (value) => _password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Password',
                            style: TextStyle(fontFamily: 'GabrielSans'),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            fontFamily: 'GabrielSans',
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: agreePersonalData
                                  ? Colors.grey
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                agreePersonalData ? Icons.check : null,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  agreePersonalData = !agreePersonalData;
                                });
                              },
                              padding: EdgeInsets
                                  .zero, // Remove padding from IconButton
                              constraints:
                                  const BoxConstraints(), // Remove constraints to fit the icon
                            ),
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              fontFamily: 'GabrielSans',
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontFamily: 'GabrielSans',
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontFamily: 'GabrielSans',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'GabrielSans',
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'GabrielSans',
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.shadow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
