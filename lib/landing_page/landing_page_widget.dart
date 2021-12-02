import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../signup/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageWidget extends StatefulWidget {
  LandingPageWidget({Key key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget>
    with TickerProviderStateMixin {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      scale: 0.4,
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      slideOffset: Offset(0, -70),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      slideOffset: Offset(0, -100),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xF350E829),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ff_logo_white.png',
            width: 140,
            height: 140,
            fit: BoxFit.fitHeight,
          ).animated([animationsMap['imageOnPageLoadAnimation']]),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Text(
              'Whistle',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ).animated([animationsMap['textOnPageLoadAnimation1']]),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 120),
            child: Text(
              'Blow the whistle, start the game',
              style: FlutterFlowTheme.title3.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ).animated([animationsMap['textOnPageLoadAnimation2']]),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton1 = true);
                try {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                    (r) => false,
                  );
                } finally {
                  setState(() => _loadingButton1 = false);
                }
              },
              text: 'LOGIN',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: Color(0xF3000000),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 3,
              ),
              loading: _loadingButton1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton2 = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton2 = false);
                }
              },
              text: 'SIGNUP',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: Color(0xF3000000),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 3,
              ),
              loading: _loadingButton2,
            ),
          )
        ],
      ).animated([animationsMap['columnOnPageLoadAnimation']]),
    );
  }
}
