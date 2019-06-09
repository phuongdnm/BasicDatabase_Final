var faker = require('faker');
var fs = require('fs');
var dateFormat = require('dateformat');
var book = 'INSERT INTO Books( title, published_date, ISBN, price, stock_quantity, author_id) VALUES \n';
var author = 'INSERT INTO Authors( first_name, last_name, company_name) VALUES \n';
var rating = 'INSERT INTO Ratings( book_id, customer_id, rating) VALUES \n';
var customer = 'INSERT INTO Customers( first_name, last_name, street, city, phone_number, email) VALUES \n';
var order = 'INSERT INTO Orders( customer_id, date, shipper_id, status) VALUES \n';
var ord_detail = 'INSERT INTO Order_details( order_id, book_id, quantity) VALUES \n';
var shipper = 'INSERT INTO Shippers( name, phone_number) VALUES \n';

for (var i = 0; i < 100; i ++){
    var n = new Date(faker.date.past());
    book += '(\'' + faker.commerce.productName() +'\', \'' + 
            dateFormat(n, "yyyy-mm-dd") + '\', ' + 'NULL, ' + 
            faker.finance.amount(10,20,2) + ', ' + 
            Math.floor(faker.commerce.price()) + ', ' + 
            (Math.floor(Math.random() * 39) +1) + '),' + '\n';
    rating += '(' + (Math.floor(Math.random() * 100)+1) + ', ' + 
            (Math.floor(Math.random() * 100)+1) + ', ' + 
            faker.random.number({min: 2, max: 10, precision:0.5}).toFixed(1) + '),' + '\n';
    customer += '(\'' + faker.name.firstName().replace(/'/g, '') + '\', \'' + 
            faker.name.lastName().replace(/'/g, '') + '\', \'' + 
            faker.address.streetName().replace(/'/g, '') + '\', \'' + 
            faker.address.city().replace(/'/g, '') + '\', ' + 
            faker.phone.phoneNumber('#########') + ', \'' + 
            faker.internet.email() + '\'),' + '\n';
};
for (var i = 0; i < 40; i ++){
    author += '(\'' + faker.name.firstName().replace(/'/g, '') + '\', \'' + 
            faker.name.lastName().replace(/'/g, '') + '\', \'' + 
            faker.company.companyName().replace(/'/g, '') + '\'),' + '\n';
    shipper += '(\'' + faker.name.firstName() + 
            faker.name.lastName() + '\', ' + 
            faker.phone.phoneNumber('#########') + '),' + '\n';
};
for (var i = 0; i < 200; i ++){
    var o = new Date(faker.date.past());
    var statusArray = ['Received', 'Ongoing', 'Shipped'];
    var status = '' + statusArray[Math.floor(Math.random()*statusArray.length)];
    order += '(' + (Math.floor(Math.random() * 100)+1) + ', \'' + 
            dateFormat(o, "yyyy-mm-dd") + '\', ' + 
            (Math.floor(Math.random() * 40)+1) + ',\'' + 
            status + '\'),' + '\n';
    ord_detail += '(' + (Math.floor(Math.random() * 200)+1) + ', ' + 
            (Math.floor(Math.random() * 100)+1) + ', ' + 
            Math.floor(Math.random() * 14) + '),' + '\n';
};
fs.writeFile('test.txt', author, function(err){
    if(err){
        return console.log(err)
    };
    fs.appendFileSync('test.txt', book);
    fs.appendFileSync('test.txt', customer);
    fs.appendFileSync('test.txt', shipper);
    fs.appendFileSync('test.txt', order);
    fs.appendFileSync('test.txt', ord_detail);
    fs.appendFileSync('test.txt', rating);
    console.log("Data generated into file test.txt!");
    console.log("\nREMEMBER TO END YOU QUERIES WITH SEMICOLOMS \';\'");
});