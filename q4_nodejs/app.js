const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;
const rawjson=[{"username":"ali","hair_color":"brown","height":1.2},{"username":"marc","hair_color":"blue","height":1.4},{"username":"joe","hair_color": "brown","height":1.7},{"username":"zehua","hair_color":"black","height": 1.8}];
const newjson ='{"h":["username","hair_color","height"],"d":[]}';
const obj = JSON.parse(newjson);

for (let i=0; i<rawjson.length; i++){
    obj["d"].push([rawjson[i].username,rawjson[i].hair_color,rawjson[i].height]);
}

console.log(obj)
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json');
//res.end(JSON.stringify(rawjson));
  res.end(JSON.stringify(obj))
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});