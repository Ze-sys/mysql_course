var faker = require('@withshepherd/faker');
var mysql = require('mysql')

var connection = mysql.createConnection(
					{
		host		:	'localhost',
		user		:	'root',
		database	:   'join_us'	
					}
);
// SELECTING DATA
// var q = 'SELECT * FROM users';
// connection.query(q,function(error, results, fields) {
// 	if (error) throw error;
// 	// console.log('The solution is ', results[0].solution.toString());
// 	console.log(results);						
// })
// connection.end();

// INSERTING DATA
// var q = 'INSERT INTO users (email) VALUES ("Jakson59@yahoo.com")';
// connection.query(q,function(error, results, fields) {
// 	if (error) throw error;
// 	// console.log('The solution is ', results[0].solution.toString());
// 	console.log(results);						
// })
// connection.end();



// // INSERTING DATA take two
// var person = {email: faker.internet.email(),
// 			 created_at: faker.date.past()
// };
			 
// // var q = 'INSERT INTO users (email) VALUES ("Jakson59@yahoo.com")';
// var end_result = connection.query('INSERT INTO users SET ?', person,function(error, results) {
// 	if (error) throw error;
// 	// console.log('The solution is ', results[0].solution.toString());
// 	console.log(results);						
// })

// connection.end();




// INSERTING DATA  lots of data
var data  = [];

for (var i =0; i<500; i++){
	data.push([
	faker.internet.email(),
	faker.date.past()
]);
		
}

// console.log(data);
			 
var q = 'INSERT INTO users (email, created_at) VALUES ?';
var end_result = connection.query(q, [data],function(error, results) {
	if (error) throw error;
	// console.log('The solution is ', results[0].solution.toString());
	console.log(results);						
})

connection.end();




// // Some more random stuff
// function random_function(){
// 	let streetAddress = faker.address.streetAddress();
// 	let city = faker.address.city();
// 	let state = faker.address.state();
// 	let email = faker.internet.email();
	
// 	console.log(streetAddress);
// 	console.log(city);
// 	console.log(state);
// 	console.log(email);

// }

// random_function();
// console.log("\n")
// random_function();