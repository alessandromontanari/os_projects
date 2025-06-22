require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const app = express();
const dns = require("dns");

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use("/public", express.static(`${process.cwd()}/public`));

app.get("/", function (req, res) {
  res.sendFile(process.cwd() + "/views/index.html");
});

app.use(bodyParser.urlencoded({ extended: false }));

let num = 0;
let urlDatabase = [];
app.post("/api/shorturl", function (req, res) {
  const urlRegex = /(?:[\w-]+\.)+[\w-]+/;
  let urlObject = new URL(req.body.url);
  let urlBody = urlRegex.exec(urlObject);
  let dnslookup = dns.lookup(urlBody[0], (err, address, family) => {
    if (err) {
      res.json({ error: "invalid url" });
    } else {
      num++;
      urlDatabase.push({short_url: num, original_url: req.body.url});
      // urlDatabase.num = req.body.url;
      res.json({ original_url: urlObject, short_url: num });
    }
  });
});

app.get("/api/shorturl/:short_url", function (req, res) {
  const shortUrl = parseInt(req.params.short_url);
  const url = urlDatabase.find(data => data.short_url === shortUrl);
  if (url) {
    res.redirect(url.original_url);
  } else {
    res.json({ error: "No short URL found for the given input" });
  }
});

app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});
