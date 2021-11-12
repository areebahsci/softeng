import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../landing_page/landing_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF00A898),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0.5),
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Source Sans Pro',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.45),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(330, 0, 9, 3),
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
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.5),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() => _loadingButton1 = true);
                  try {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('About'),
                          content: Text(
                              'This is a sports event management app made for the course COE420. We hope you like it! '),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  } finally {
                    setState(() => _loadingButton1 = false);
                  }
                },
                text: 'Help\n',
                icon: Icon(
                  Icons.help_outlined,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
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
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton2 = true);
                try {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Tell a friend!'),
                        content: Text(
                            'Copy the following link so that your friends don\'t miss out on the app! fakelink.com'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                } finally {
                  setState(() => _loadingButton2 = false);
                }
              },
              text: 'Tell a Friend',
              icon: Icon(
                Icons.share,
                size: 15,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20,
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
          Align(
            alignment: AlignmentDirectional(0, 0.5),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() => _loadingButton3 = true);
                  try {
                    await signOut();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPageWidget(),
                      ),
                    );
                  } finally {
                    setState(() => _loadingButton3 = false);
                  }
                },
                text: 'Logout',
                icon: Icon(
                  Icons.logout,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
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
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.5),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() => _loadingButton4 = true);
                  try {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('DELETE ACCOUNT'),
                          content: Text(
                              'Are you sure you want to delete your account?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(alertDialogContext);
                                await currentUserReference.delete();
                                ;
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        );
                      },
                    );
                    await signOut();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPageWidget(),
                      ),
                    );
                  } finally {
                    setState(() => _loadingButton4 = false);
                  }
                },
                text: 'Delete your account',
                icon: Icon(
                  Icons.delete,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
                loading: _loadingButton4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
