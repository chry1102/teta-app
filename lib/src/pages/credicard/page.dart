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

class PageCredicard extends StatefulWidget {
  const PageCredicard({
    Key? key,
    this.name = 'Dimitri',
    this.email = 'test@gmail.com',
    this.balance = 0,
    this.state = 'NOT ACTIVE',
    this.country = 'IT',
  }) : super(key: key);

  final String name;

  final String email;

  final int balance;

  final String state;

  final String country;

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageCredicard>
    with SingleTickerProviderStateMixin {
  int num = 0;

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
          FutureBuilder(
              future: Supabase.instance.client
                  .from('''cc''')
                  .select('''id, num, date, cvc''')
                  .order('''name''')
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

                return Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border(
                      left: BorderSide(width: 0, color: Color(0xFF000000)),
                      top: BorderSide(width: 0, color: Color(0xFF000000)),
                      right: BorderSide(width: 0, color: Color(0xFF000000)),
                      bottom: BorderSide(width: 0, color: Color(0xFF000000)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 150,
                          bottom: 25,
                        ),
                        child: Center(
                          child: Text(r'''Your Credit Card''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 1),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 12,
                          top: 20,
                          right: 12,
                        ),
                        padding: EdgeInsets.zero,
                        width: double.maxFinite,
                        height: 215,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                          border: Border(
                            left:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            top: BorderSide(width: 0, color: Color(0xFF000000)),
                            right:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            bottom:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    top: 70,
                                    bottom: 5,
                                  ),
                                  child: Icon(
                                    MdiIcons.fromString(
                                        '''camera-metering-matrix'''),
                                    size: 50,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 210,
                                    top: 15,
                                  ),
                                  child: Icon(
                                    MdiIcons.fromString(
                                        '''contactless-payment'''),
                                    size: 48,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 32,
                              ),
                              child: Text(
                                  ((datasets['Supabase future builder']
                                                  as List<dynamic>)[index]
                                              as Map<String, dynamic>)['num']
                                          as String? ??
                                      '',
                                  style: GoogleFonts.aldrich(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 32,
                                top: 15,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      right: 75,
                                    ),
                                    child: Text(
                                        ((datasets['Supabase future builder']
                                                        as List<dynamic>)[index]
                                                    as Map<String, dynamic>)[
                                                'date'] as String? ??
                                            '',
                                        style: GoogleFonts.aldrich(
                                          textStyle: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: Text(
                                        ((datasets['Supabase future builder']
                                                        as List<dynamic>)[index]
                                                    as Map<String, dynamic>)[
                                                'cvc'] as String? ??
                                            '',
                                        style: GoogleFonts.aldrich(
                                          textStyle: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 280,
                                top: -15,
                              ),
                              child: Image.network(
                                r'''https://loghi-famosi.com/wp-content/uploads/2020/09/Mastercard-Logo.png''',
                                width: 57,
                                height: 35,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 50,
                                ),
                                child: BouncingWidget(
                                  duration: const Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  child: GestureDetector(
                                      child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF050505),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12),
                                            ),
                                            border: null,
                                          ),
                                          child: Text(
                                            '''NEW''',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: const Color(0xFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                ),
                              ),
                              BouncingWidget(
                                duration: const Duration(milliseconds: 100),
                                scaleFactor: 1.5,
                                child: GestureDetector(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF000000),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          border: null,
                                        ),
                                        child: Text(
                                          '''OLD''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                            onTap: () async {
                              await Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageHomePage(),
                                ),
                              );
                            },
                            child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  border: null,
                                ),
                                child: Text(
                                  '''BACK''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
