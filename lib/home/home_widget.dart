import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_a_game/create_a_game_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../history/history_widget.dart';
import '../landing_page/landing_page_widget.dart';
import '../main.dart';
import '../upcoming_match_details/upcoming_match_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final CurrentMonth = DateTime.now().month;
  final CurrentDate = DateTime.now().day;
  final CurrentYear = DateTime.now().year;
  final CurrentHour = DateTime.now().hour;

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
              color: Color(0xFF50E839),
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
                        'HOME',
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 9, 3),
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.95, 0),
                    child: AuthUserStreamWidget(
                      child: Text(
                        currentUserDisplayName,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton1 = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAGameWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton1 = false);
                }
              },
              text: 'Host A Game',
              icon: Icon(
                Icons.add,
                size: 15,
              ),
              options: FFButtonOptions(
                width: 350,
                height: 40,
                color: Color(0xF350E829),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton2 = true);
                try {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavBarPage(initialPage: 'matchListings'),
                    ),
                    (r) => false,
                  );
                } finally {
                  setState(() => _loadingButton2 = false);
                }
              },
              text: 'Browse Games',
              icon: Icon(
                Icons.search,
                size: 15,
              ),
              options: FFButtonOptions(
                width: 350,
                height: 40,
                color: Color(0xF350E829),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton3 = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton3 = false);
                }
              },
              text: 'View History',
              icon: Icon(
                Icons.history,
                size: 17,
              ),
              options: FFButtonOptions(
                width: 350,
                height: 40,
                color: Color(0xF350E829),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton3,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
            child: Text(
              'Upcoming Matches',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<GamesRecord>>(
              stream: queryGamesRecord(
                queryBuilder: (gamesRecord) => gamesRecord
                    .where('currentPlayersList',
                        arrayContains: currentUserReference)
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
                List<GamesRecord> listViewGamesRecordList = snapshot.data;
                listViewGamesRecordList = listViewGamesRecordList
                    .where((i) => ((CurrentYear <= i.date.year) &&
                        (CurrentMonth <= i.date.month) &&
                        (CurrentDate <= i.date.day)))
                    .toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewGamesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewGamesRecord =
                        listViewGamesRecordList[listViewIndex];
                    return Padding(
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
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 5),
                                            child: Icon(
                                              Icons.access_time,
                                              color: Colors.black,
                                              size: 14,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Text(
                                              '${dateTimeFormat('yMMMd', listViewGamesRecord.date)}, ${listViewGamesRecord.time}',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 5),
                                            child: Icon(
                                              Icons.people,
                                              color: Colors.black,
                                              size: 14,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Text(
                                              '${listViewGamesRecord.currentPlayers.toString()}/${listViewGamesRecord.maxPlayers.toString()}',
                                              style: FlutterFlowTheme.bodyText1
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
                                                UpcomingMatchDetailsWidget(
                                              upcomingMatchDetails:
                                                  listViewGamesRecord.reference,
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
