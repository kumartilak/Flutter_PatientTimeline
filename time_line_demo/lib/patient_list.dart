import 'package:flutter/material.dart';
import 'package:time_line_demo/service/api_manager.dart';
import 'package:time_line_demo/service/models/patient_data.dart';
import 'time_line/timeline.dart';

class PatientList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientListState();
  }
}

class _PatientListState extends State<PatientList> {
  Future<PatientsData> _patientData;

  @override
  void initState() {
    _patientData = ApiManager().getAllPatient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<PatientsData>(
          future: _patientData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.blueAccent,
                      ),
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var patient = snapshot.data.data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimelinePage(
                                      patient: patient,
                                    )));
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    patient.photo,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 16),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  patient.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(patient.gender),
                                Text('${patient.age} years'),
                                Text(patient.address)
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
