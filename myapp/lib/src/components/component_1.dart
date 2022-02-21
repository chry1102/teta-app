import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageComponentA1 extends StatefulWidget {
  const PageComponentA1({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageComponentA1>
    with SingleTickerProviderStateMixin {
  int c = 1;

  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFF000000),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    await Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageEntryPoint(),
                      ),
                    );
                  },
                  child: ('''${c}''' == '1')
                      ? Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA5A5A5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Center(
                            child: Text(r'''10:00 - 11:00''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1.0),
                          ),
                        )
                      : const SizedBox(),
                ),
                TextButton(
                  onPressed: () async {},
                  child: ('''${c}''' == '2')
                      ? Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA5A5A5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Center(
                            child: Text(r'''11:00 - 12:00''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1.0),
                          ),
                        )
                      : const SizedBox(),
                ),
                TextButton(
                  onPressed: () async {},
                  child: ('''${c}''' == '3')
                      ? Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA5A5A5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Center(
                            child: Text(r'''12:00 - 13:00''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1.0),
                          ),
                        )
                      : const SizedBox(),
                ),
                TextButton(
                  onPressed: () async {},
                  child: ('''${c}''' == '4')
                      ? Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA4A4A4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Center(
                            child: Text(r'''13:00 - 14:00''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1.0),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
