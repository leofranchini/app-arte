const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router('assets/data.json'); n
const middlewares = jsonServer.defaults();

server.use(middlewares);

server.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept');
  next();
});

server.use(router);

server.listen(3000, () => {
  console.log('JSON Server is running on http://localhost:3000');
});
