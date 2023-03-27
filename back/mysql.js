var mysql = require("mysql2");
const util = require("util");

const connection = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  port: 3306,
  password: "root",
  database: "softbarv4",
});

const queryAsync = util.promisify(connection.query).bind(connection);

module.exports = { connection, queryAsync };