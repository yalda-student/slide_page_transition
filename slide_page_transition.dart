import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: PageOne(),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(PageSlideTransition(const PageTwo()));
                },
                child: const Text('Page 2'))
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: const Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Text(
            'Welcome to Page Two',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}

class PageSlideTransition extends PageRouteBuilder {
  final dynamic page;

  PageSlideTransition(this.page)
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        var tween =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
