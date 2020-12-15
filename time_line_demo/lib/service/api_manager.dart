import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:time_line_demo/service/models/patient_data.dart';
import 'models/event_details.dart';
import '../contants/strings.dart';

class ApiManager {
  Future<EventDetails> getAllEvents(String patientId) async {
    var client = http.Client();
    var eventDetails = null;

    try {
      var response = await client
          .get('${Strings.base_url}/event/getAllForPatient/$patientId');
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = jsonDecode(jsonstring);

        eventDetails = EventDetails.fromJson(jsonMap);
      }
    } catch (Exception) {
      return eventDetails;
    }

    return eventDetails;
  }

  Future<PatientsData> getAllPatient() async {
    var client = http.Client();
    var patientData = null;

    try {
      var response = await client.get('${Strings.base_url}/patient/getAll');
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = jsonDecode(jsonstring);

        patientData = PatientsData.fromJson(jsonMap);
      }
    } catch (Exception) {
      return patientData;
    }

    return patientData;
  }
}
