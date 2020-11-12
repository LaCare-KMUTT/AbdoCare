import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as moment from "moment";
admin.initializeApp(functions.config().firebase);
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

export const calculateAge = functions.https.onCall((data, context) => {
  const dobString = data['dob'];
  const dob = moment(dobString, 'MM-DD-YYYY').toDate();
  const age = moment().diff(dob, "years");
  console.log(age);
  return {
    age: age,
  };
});
