var express = require('express');
var cors = require('cors');
require('dotenv').config();
// define multer and storage, and the upload middleware to handle the file upload
var multer = require('multer');
var storage = multer.memoryStorage();
let upload = multer({ dest: "uploads/", storage: storage });

var app = express();

app.use(cors());
app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// handle the file upload, with the upload middleware, and return the file information
app.post("/api/fileanalyse", upload.single("upfile"), (req, res) => {
  if (!req.file) 
    return res.status(400).send("No files were uploaded.");
  res.json({
    name: req.file.originalname,
    type: req.file.mimetype,
    size: req.file.size,
  });
});

const port = process.env.PORT || 3000;
app.listen(port, function () {
  console.log('Your app is listening on port ' + port)
});
