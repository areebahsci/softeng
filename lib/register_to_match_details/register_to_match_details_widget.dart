import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../list_of_users_registered_upcoming/list_of_users_registered_upcoming_widget.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterToMatchDetailsWidget extends StatefulWidget {
  RegisterToMatchDetailsWidget({
    Key key,
    this.registerToMatchDetails,
  }) : super(key: key);

  final DocumentReference registerToMatchDetails;

  @override
  _RegisterToMatchDetailsWidgetState createState() =>
      _RegisterToMatchDetailsWidgetState();
}

class _RegisterToMatchDetailsWidgetState
    extends State<RegisterToMatchDetailsWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GamesRecord>(
      stream: GamesRecord.getDocument(widget.registerToMatchDetails),
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
        final registerToMatchDetailsGamesRecord = snapshot.data;
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: StreamBuilder<GamesRecord>(
                    stream:
                        GamesRecord.getDocument(widget.registerToMatchDetails),
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
                      final rowGamesRecord = snapshot.data;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 35, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBarPage(
                                        initialPage: 'matchListings'),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0.45),
                              child: Text(
                                rowGamesRecord.gameTitle,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<GamesRecord>(
                  stream:
                      GamesRecord.getDocument(widget.registerToMatchDetails),
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
                    final listViewGamesRecord = snapshot.data;
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Image.network(
                          'https://picsum.photos/seed/516/600',
                          width: 100,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                                child: Text(
                                  'Type of Game',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Text(
                                listViewGamesRecord.gameType,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Location',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-0.15, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: Text(
                                      registerToMatchDetailsGamesRecord
                                          .location,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 65, 0),
                                child: Text(
                                  'Time',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-0.31, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 79, 0),
                                    child: Text(
                                      '${dateTimeFormat('yMMMd', registerToMatchDetailsGamesRecord.date)}, ${registerToMatchDetailsGamesRecord.time}',
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                                child: Text(
                                  'Amount  of\npeople',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 155, 0),
                                    child: Text(
                                      '${registerToMatchDetailsGamesRecord.currentPlayers.toString()}/${registerToMatchDetailsGamesRecord.maxPlayers.toString()}',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                child: Text(
                                  'Hosted By',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-0.3, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 85, 0),
                                    child: Text(
                                      registerToMatchDetailsGamesRecord.host,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Text(
                            'Description',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              registerToMatchDetailsGamesRecord.description,
                              'no description available',
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton1 = true);
                              try {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListOfUsersRegisteredUpcomingWidget(
                                      gamesParameter:
                                          widget.registerToMatchDetails,
                                    ),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton1 = false);
                              }
                            },
                            text: 'VIEW PLAYERS LIST',
                            icon: Icon(
                              Icons.people,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 350,
                              height: 40,
                              color: Color(0xF350E829),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton2 = true);
                              try {
                                if (!(registerToMatchDetailsGamesRecord
                                    .currentPlayersList
                                    .contains(currentUserReference))) {
                                  final gamesUpdateData = {
                                    'currentPlayers': FieldValue.increment(1),
                                    'currentPlayersList': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  };
                                  await widget.registerToMatchDetails
                                      .update(gamesUpdateData);
                                }
                                final usersUpdateData = {
                                  'gamesList': FieldValue.arrayUnion(
                                      [widget.registerToMatchDetails]),
                                };
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'home'),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton2 = false);
                              }
                            },
                            text: 'SIGN UP',
                            icon: Icon(
                              Icons.assignment_ind,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 350,
                              height: 40,
                              color: Color(0xF350E829),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton2,
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
