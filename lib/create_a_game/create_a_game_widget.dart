import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAGameWidget extends StatefulWidget {
  CreateAGameWidget({Key key}) : super(key: key);

  @override
  _CreateAGameWidgetState createState() => _CreateAGameWidgetState();
}

class _CreateAGameWidgetState extends State<CreateAGameWidget> {
  DateTimeRange calendarSelectedDay;
  TextEditingController textController1;
  TextEditingController textController2;
  var placePickerValue = FFPlace();
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Column(
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
                                  NavBarPage(initialPage: 'home'),
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Create a new game',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Source Sans Pro',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Game title',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter game title...',
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
                          ),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Date',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      FlutterFlowCalendar(
                        color: Color(0xFF9800A8),
                        weekFormat: true,
                        weekStartsMonday: false,
                        onChange: (DateTimeRange newSelectedDate) {
                          setState(() => calendarSelectedDay = newSelectedDate);
                        },
                        titleStyle: TextStyle(),
                        dayOfWeekStyle: TextStyle(),
                        dateStyle: TextStyle(),
                        selectedDateStyle: TextStyle(),
                        inactiveDateStyle: TextStyle(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Time',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter time...',
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
                          ),
                          style: FlutterFlowTheme.bodyText1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'This field is required!';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Location',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      FutureBuilder<dynamic>(
                        future: geoLocationCall(),
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
                          final placePickerGeoLocationResponse = snapshot.data;
                          return FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyDw3Nf3Ly6XcnHtnLfLUOEjNRlT1aeAbuMAIzaSyCjfEkAnLAuuYQLum5DnWGHFdTs0ln9FvI',
                            androidGoogleMapsApiKey:
                                'AIzaSyCWl-1mzbebP0acqU2rTi1n6diedXqvauA',
                            webGoogleMapsApiKey:
                                'AIzaSyCjfEkAnLAuuYQLum5DnWGHFdTs0ln9FvI',
                            onSelect: (place) =>
                                setState(() => placePickerValue = place),
                            defaultText: 'Select Location',
                            icon: Icon(
                              Icons.place,
                              color: Colors.white,
                              size: 16,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter location name...',
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
                          ),
                          style: FlutterFlowTheme.bodyText1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'This field is required!';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Max number of people',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController4,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter max number of people...',
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
                          ),
                          style: FlutterFlowTheme.bodyText1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'This field is required!';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 20, 0, 0),
                        child: Text(
                          'Description',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController5,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter description...',
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
                          ),
                          style: FlutterFlowTheme.bodyText1,
                          maxLines: 3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 60),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              final gamesCreateData = createGamesRecordData(
                                gameTitle: textController1.text,
                                host: currentUserEmail,
                                description: textController5.text,
                                maxPlayers: int.parse(textController4.text),
                                date: calendarSelectedDay.start,
                                time: textController2.text,
                                location: placePickerValue.address,
                              );
                              await GamesRecord.collection
                                  .doc()
                                  .set(gamesCreateData);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'home'),
                                ),
                                (r) => false,
                              );
                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'CREATE GAME',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Color(0xFF9800A8),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 3,
                          ),
                          loading: _loadingButton,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
