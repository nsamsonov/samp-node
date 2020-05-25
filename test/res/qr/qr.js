// import qrcode from "qrcode-generator";
//
// async function generateQRCodeForSamp(context) {
//     let typeNumber = 4;
//     let errorCorrectionLevel = 'L';
//     let qr = qrcode(typeNumber, errorCorrectionLevel);
//     qr.addData(context);
//     qr.make();
//     let newQRCode = "";
//
//     let QRLines = qr.createASCII().split("\n");
//     await QRLines.map((line, index) => {
//         let string1 = "";
//         let string2 = "\n";
//         for (let i = 0; i < line.length; i++) {
//             if (line.charAt(i) == "█") {
//                 string1 += 'g';
//                 string2 += 'g';
//             } else if (line.charAt(i) == "▄") {
//                 string1 += 'c';
//                 string2 += 'g';
//             }
//             else if (line.charAt(i) == "▀") {
//                 string1 += 'g';
//                 if (QRLines.length - 1 != index)
//                     string2 += 'c';
//             }
//             else if (line.charAt(i) == " ") {
//                 string1 += 'c';
//                 string2 += 'c';
//             }
//         }
//         newQRCode += "\n" + string1 + string2;
//     })
//
//     return newQRCode;
// }
samp.on(EVENT_GAME_MODE_INIT, () => {
    samp.logprint("test");
});

samp.on(EVENT_PLAYER_COMMAND, async (playerid, cmdtext) => {
    if (cmdtext == "/qrobj") {

        const out = samp.callNative("GetPlayerPos", "iFFF", playerid);
        const pos = {
            x: out[0],
            y: out[1],
            z: out[2]
        };
        const objectid = samp.callNative("CreateObject", "ifffffff", 19371, pos.x + 1, pos.y + 1, pos.z + 1, 0, 0, 0, 300);
    }
})
