import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAGameWidget extends StatefulWidget {
  CreateAGameWidget({Key key}) : super(key: key);

  @override
  _CreateAGameWidgetState createState() => _CreateAGameWidgetState();
}

class _CreateAGameWidgetState extends State<CreateAGameWidget> {
  DateTimeRange calendarSelectedDay;
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  var placePickerValue = FFPlace();
  TextEditingController textController3;
  int countControllerValue;
  TextEditingController textController4;
  GamesRecord newGame;
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
                          'Game Type',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      FlutterFlowDropDown(
                        initialOption: dropDownValue ??= 'Football',
                        options: [
                          'Football',
                          'Basketball',
                          'Tennis',
                          'Squash',
                          'Baseball',
                          'Golf',
                          'Volleyball',
                          'Badminton',
                          'Boxing',
                          'Table Tennis',
                          'Cricket',
                          'Rugby',
                          'Pool',
                          'Bowling',
                          'Ice Hockey',
                          'Karate',
                          'Horse racing',
                          'Running',
                          'Cycling'
                        ].toList(),
                        onChanged: (val) => setState(() => dropDownValue = val),
                        width: 130,
                        height: 40,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        fillColor: Color(0xFFCECDCD),
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                        hidesUnderline: true,
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
                      FlutterFlowPlacePicker(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFCFC9C9),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFF9E9E9E),
                              width: 1,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.minus,
                              color: enabled
                                  ? Color(0xDD000000)
                                  : Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            incrementIconBuilder: (enabled) => FaIcon(
                              FontAwesomeIcons.plus,
                              color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                              size: 20,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            count: countControllerValue ??= 10,
                            updateCount: (count) =>
                                setState(() => countControllerValue = count),
                            stepSize: 1,
                          ),
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
                          controller: textController4,
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
                              final gamesCreateData = {
                                ...createGamesRecordData(
                                  gameTitle: valueOrDefault<String>(
                                    textController1.text,
                                    'no title',
                                  ),
                                  host: currentUserEmail,
                                  description: textController4.text,
                                  maxPlayers: countControllerValue,
                                  date: calendarSelectedDay.start,
                                  time: textController2.text,
                                  location: textController3.text,
                                  currentPlayers: 1,
                                  gameIsOver: 0,
                                  geolocation: placePickerValue.latLng,
                                  gameType: valueOrDefault<String>(
                                    dropDownValue,
                                    'Football',
                                  ),
                                ),
                                'currentPlayersList': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              };
                              final gamesRecordReference =
                                  GamesRecord.collection.doc();
                              await gamesRecordReference.set(gamesCreateData);
                              newGame = GamesRecord.getDocumentFromData(
                                  gamesCreateData, gamesRecordReference);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'home'),
                                ),
                                (r) => false,
                              );

                              setState(() {});
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
