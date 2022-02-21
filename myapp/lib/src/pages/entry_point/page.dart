import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageEntryPoint extends StatefulWidget {
  const PageEntryPoint({
    Key? key,
    this.zozo = 0,
  }) : super(key: key);

  final int zozo;

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageEntryPoint>
    with SingleTickerProviderStateMixin {
  String or = '10';

  String o = '0';

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
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                left: 25,
                top: 125,
                right: 25,
                bottom: 125,
              ),
              padding: EdgeInsets.zero,
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF000000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                  bottomLeft: Radius.circular(24.0),
                ),
              ),
              child: FutureBuilder(
                  future: Supabase.instance.client
                      .from('''ordini''')
                      .select('''ora,quantita''')
                      .order('''''')
                      .range((1 * 1) - 1, 1 * 15)
                      .execute(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final doc = snapshot.data as PostgrestResponse?;
                    if (doc == null) return const SizedBox();

                    final datasets = this.datasets;
                    datasets['Supabase Query'] =
                        doc.data as List<dynamic>? ?? <dynamic>[];
                    const index = 0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                          ),
                          child: Center(
                            child: Text(r'''SCEGLI L'ORARIO''',
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 50,
                            top: 50,
                            right: 50,
                            bottom: 50,
                          ),
                          padding: EdgeInsets.zero,
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF432424),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: TextButton(
                              onPressed: () async {
                                await showModalBottomSheet<void>(
                                  context: context,
                                  builder: (context) => PageComponent1(),
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 50,
                                    ),
                                    child: Text(r'''ORARI''',
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
                                  Icon(
                                    MdiIcons.fromString('''arrow-down'''),
                                    size: 32,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(r'''HAI SCELTO :''',
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
                        Center(
                          child: ('''${widget.zozo}''' == '0')
                              ? Text(r'''ancora non hai scelto!''',
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
                                  maxLines: 1.0)
                              : const SizedBox(),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 50,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  o = '''zozo''';
                                });
                              },
                              child: Text(r'''ok''',
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
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
