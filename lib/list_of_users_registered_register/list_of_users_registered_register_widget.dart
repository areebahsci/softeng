import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../register_to_match_details/register_to_match_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfUsersRegisteredRegisterWidget extends StatefulWidget {
  ListOfUsersRegisteredRegisterWidget({Key key}) : super(key: key);

  @override
  _ListOfUsersRegisteredRegisterWidgetState createState() =>
      _ListOfUsersRegisteredRegisterWidgetState();
}

class _ListOfUsersRegisteredRegisterWidgetState
    extends State<ListOfUsersRegisteredRegisterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF00A898),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 35, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterToMatchDetailsWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.45),
                        child: Text(
                          'List of users registered',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Source Sans Pro',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(),
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
                List<UsersRecord> listViewUsersRecordList = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewUsersRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewUsersRecord =
                        listViewUsersRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Text(
                                listViewUsersRecord.displayName,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Text(
                                listViewUsersRecord.email,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            )
                          ],
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
