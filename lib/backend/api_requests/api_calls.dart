import 'api_manager.dart';

Future<dynamic> geoLocationCall() {
  final body = '''
{
  "location": {
    "lat": 37.421875199999995,
    "lng": -122.0851173
  },
  "accuracy": 120
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'geoLocation',
    apiUrl:
        'https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyDw3Nf3Ly6XcnHtnLfLUOEjNRlT1aeAbuM',
    callType: ApiCallType.POST,
    headers: {},
    params: {},
    body: body,
    bodyType: BodyType.JSON,
    returnResponse: true,
  );
}
