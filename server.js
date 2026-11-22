const http=require("http"),fs=require("fs");
const o=fs.existsSync("/o.txt")?fs.readFileSync("/o.txt","utf8"):"(none)";
http.createServer((q,r)=>{if(q.url==="/api/health"){r.writeHead(200);r.end("ok");return}r.writeHead(200,{"content-type":"text/plain"});r.end(o)}).listen(3000);
