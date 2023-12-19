importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");
const firebaseConfig = {
  apiKey: "AIzaSyDzmxbNn1CTDX1JaLfnBboOZlQCrCovtHs",
  authDomain: "flutter-clean-architectu-9cffc.firebaseapp.com",
  projectId: "flutter-clean-architectu-9cffc",
  storageBucket: "flutter-clean-architectu-9cffc.appspot.com",
  messagingSenderId: "497999446278",
  appId: "1:497999446278:web:aa15fe09bcbcbc2f1fde87",
  measurementId: "G-FW8NRRVYSW"
};

firebase.initializeApp(firebaseConfig});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});