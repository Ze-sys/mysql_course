var express = require('express');
const { faker } = require('@faker-js/faker');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var connection = mysql.createConnection(
				{
	host		:	'localhost',
	user		:	'root',
	database	:   'join_us'	
				});

var app = express();

app.set('view engine','ejs')
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

app.get("/", function(request,response){
	var q = 'SELECT COUNT(*) AS count FROM users';
	connection.query(q, function(err,results){
	if(err) throw err;
	var count = results[0].count;
	response.render('home', {count : count});
	});
});

app.get("/random_email", function(request,response){
	response.send(faker.internet.email());
	});

app.post('/register', function(request,response){
	var person = {email: request.body.email};
	if (person) {
		 connection.query('INSERT INTO users SET ?', person, function(err, results){
		 console.log(err);
		 console.log(results);
		 response.redirect('/');
		 });
	}
	else {
		response.render('Please, enter none-empty email.');
	}
	
	});


var port_number = 3000
app.listen(port_number, function(){
	console.log('App listening at port', port_number)
	
});