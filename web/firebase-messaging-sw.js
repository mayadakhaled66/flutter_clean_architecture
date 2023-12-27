importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

const firebaseConfig = {
  apiKey: "AIzaSyDzmxbNn1CTDX1JaLfnBboOZlQCrCovtHs",
  authDomain: "flutter-clean-architectu-9cffc.firebaseapp.com",
  projectId: "flutter-clean-architectu-9cffc",
  storageBucket: "flutter-clean-architectu-9cffc.appspot.com",
  messagingSenderId: "497999446278",
  appId: "1:497999446278:web:aa15fe09bcbcbc2f1fde87",
  measurementId: "G-FW8NRRVYSW"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log("onBackgroundMessage", payload);

//      const notificationTitle = payload.notification.title;
//      const notificationOptions = {
//        body: payload.notification.body,
//      };
//
//      self.registration.showNotification(notificationTitle,
//        notificationOptions);
});

