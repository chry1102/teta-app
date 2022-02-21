import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:myapp/src/pages/entry_point/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase.initialize(
    url: 'https://yzlbnobhhyphnsgtnvpu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzOTY3NTQxNywiZXhwIjoxOTU1MjUxNDE3fQ.nzkwPhPpac7xZ9Yp4b-et4g2fxRadEeYik1Evd3b7Tk',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'contest',
      home: SplashScreenView(
        navigateRoute: PageEntryPoint(),
        duration: 2200,
        imageSize: 140,
        imageSrc: "teta-app.png",
        text: "",
        textType: TextType.NormalText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
