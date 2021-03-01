enum PatientState {
  preOperation,
  postOperationHome,
  postOperationHospital,
}

String enumToString(PatientState patientState) {
  var returnString;
  switch (patientState) {
    case PatientState.preOperation:
      returnString = 'Pre-Operation';
      break;
    case PatientState.postOperationHospital:
      returnString = 'Post-Operation@Hospital';
      break;
    case PatientState.postOperationHome:
      returnString = 'Post-Operation@Home';
      break;
  }
  return returnString;
}
