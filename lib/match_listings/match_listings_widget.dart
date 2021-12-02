import 'package:firebase_storage/firebase_storage.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../landing_page/landing_page_widget.dart';
import '../register_to_match_details/register_to_match_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MatchListingsWidget extends StatefulWidget {
  MatchListingsWidget({Key key}) : super(key: key);

  @override
  _MatchListingsWidgetState createState() => _MatchListingsWidgetState();
}

class _MatchListingsWidgetState extends State<MatchListingsWidget> {
  TextEditingController textController;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool playerssort = false;
  bool timesort = false;
  bool sportsort = false;
  String gameTypeValue = "null";
  String playerNoValue = "null";
  String gameTypeFil;
  String playerNoFil;

  List listView;
  callback(List listview) {
    this.listView = listview;
  }

  resetcallback(List listview) {
    listview = this.listView;
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xF350E829),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0.45),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'MATCH LISTINGS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Lexend Deca',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.45),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 3),
                    child: InkWell(
                      onTap: () async {
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(11, 10, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.445,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 2, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                insetPadding: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      SizedBox(height: 40),
                                      Center(child: Text('FILTER BY:')),
                                      SizedBox(height: 40),
                                      Row(children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Text('SPORT:'),
                                        )
                                      ]),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return FlutterFlowDropDown(
                                            options: [
                                              'Any',
                                              'Football',
                                              'Basketball',
                                              'Tennis',
                                              'Volleyball',
                                              'Badminton',
                                              'Table Tennis',
                                              'Cricket',
                                            ].toList(),
                                            onChanged: (val) => setState(
                                                () => gameTypeFil = val),
                                            width: 130,
                                            height: 40,
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.black,
                                            ),
                                            fillColor: Color(0xFFCECDCD),
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 40,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 8, 4),
                                            hidesUnderline: true,
                                          );
                                        },
                                      ),
                                      Row(children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Text('Players:'),
                                        )
                                      ]),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return FlutterFlowDropDown(
                                            options: [
                                              'Any',
                                              '<10',
                                              '10+',
                                              '20+',
                                            ].toList(),
                                            onChanged: (val) => setState(
                                                () => playerNoFil = val),
                                            width: 130,
                                            height: 40,
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.black,
                                            ),
                                            fillColor: Color(0xFFCECDCD),
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 40,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 8, 4),
                                            hidesUnderline: true,
                                          );
                                        },
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 20),
                                              child: FFButtonWidget(
                                                text: "APPLY FILTERS",
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Color(0xF350E829),
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                              ),
                                            )
                                          ])
                                    ],
                                  ),
                                ));
                          },
                        );
                      },
                      text: 'FILTER',
                      icon: Icon(
                        Icons.filter_list,
                        size: 30,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xF350E829),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.445,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 2, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding: EdgeInsets.all(100),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      SizedBox(height: 45),
                                      Center(child: Text('SORT BY:')),
                                      SizedBox(height: 45),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: FFButtonWidget(
                                              text: "Time",
                                              onPressed: () {
                                                setState(() {
                                                  timesort = !timesort;
                                                });
                                              },
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Color(0xF350E829),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: FFButtonWidget(
                                              text: "Players",
                                              onPressed: () {
                                                setState(() {
                                                  playerssort = !playerssort;
                                                });
                                              },
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Color(0xF350E829),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: FFButtonWidget(
                                              text: "Sport",
                                              onPressed: () {
                                                setState(() {
                                                  sportsort = !sportsort;
                                                });
                                              },
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Color(0xF350E829),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        text: 'SORT',
                        icon: Icon(
                          Icons.sort_outlined,
                          size: 30,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xF350E829),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                        loading: _loadingButton2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search for a game',
                        hintStyle: FlutterFlowTheme.bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF595656),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF595656),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<GamesRecord>>(
              stream: queryGamesRecord(
                queryBuilder: (gamesRecord) => gamesRecord
                    .where('GameIsOver', isEqualTo: 0)
                    .orderBy('Date')
                    .orderBy('Time'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                if (timesort == true) {
                  snapshot.data.sort((a, b) => a.date.compareTo(b.date));
                }
                if (playerssort == true) {
                  snapshot.data.sort(
                      (a, b) => a.currentPlayers.compareTo(b.currentPlayers));
                }
                if (sportsort == true) {
                  snapshot.data
                      .sort((a, b) => a.gameType.compareTo(b.gameType));
                }

                List<GamesRecord> listViewGamesRecordList = snapshot.data;

                if ((gameTypeFil == "Basketball") ||
                    (gameTypeFil == "Football") ||
                    (gameTypeFil == "Cricket") ||
                    (gameTypeFil == "Tennis") ||
                    (gameTypeFil == "Volleyball") ||
                    (gameTypeFil == "Badminton") ||
                    (gameTypeFil == "Table Tennis")) {
                  listViewGamesRecordList = listViewGamesRecordList
                      .where((i) => (i.gameType == gameTypeFil))
                      .toList();
                } else {
                  listViewGamesRecordList = listViewGamesRecordList;
                }

                if (playerNoFil == "<10") {
                  listViewGamesRecordList = listViewGamesRecordList
                      .where((i) => (i.currentPlayers < 10))
                      .toList();
                }

                if (playerNoFil == "10+") {
                  listViewGamesRecordList = listViewGamesRecordList
                      .where((i) => (i.currentPlayers > 10))
                      .toList();
                }

                if (playerNoFil == "20+") {
                  listViewGamesRecordList = listViewGamesRecordList
                      .where((i) => (i.currentPlayers > 20))
                      .toList();
                }

                if (playerNoFil == "Any") {
                  listViewGamesRecordList = listViewGamesRecordList;
                }

                callback(listViewGamesRecordList);
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewGamesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewGamesRecord =
                        listViewGamesRecordList[listViewIndex];
                    return Visibility(
                      visible: (listViewGamesRecord.currentPlayers) <
                          (listViewGamesRecord.maxPlayers),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Container(
                          width: 100,
                          height: 165,
                          decoration: BoxDecoration(
                            color: Color(0xFFCECDCD),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF595656),
                              )
                            ],
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 15, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewGamesRecord.gameType,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 5),
                                            child: Text(
                                              listViewGamesRecord.location,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 5),
                                              child: Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 14,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 5),
                                              child: Text(
                                                '${dateTimeFormat('yMMMd', listViewGamesRecord.date)}, ${listViewGamesRecord.time}',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Text(
                                            listViewGamesRecord.gameTitle,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 5, 5),
                                              child: Icon(
                                                Icons.people,
                                                color: Colors.black,
                                                size: 14,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 5),
                                              child: Text(
                                                '${listViewGamesRecord.currentPlayers.toString()}/${listViewGamesRecord.maxPlayers.toString()}',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.6, -0.3),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterToMatchDetailsWidget(
                                                registerToMatchDetails:
                                                    listViewGamesRecord
                                                        .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xF350E829),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
