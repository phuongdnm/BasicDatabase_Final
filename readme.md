# Basic database project: Bookstore database management.

### Installation

This project requires [MySQL](https://www.mysql.com/) to run.
> If you're using **Linux**, you many need to [disable AUTO_FULL_GROUP_BY](https://stackoverflow.com/questions/23921117/disable-only-full-group-by) in MySQL.

> **Optional**: If you want to explore all feature, you may need to install [Node.JS](https://nodejs.org/en/) and [nmp](https://www.npmjs.com/get-npm).

1. Clone this repository to your local machine:
```sh
$ git clone https://github.com/phuongminh2303/BasicDatabase_Final.git
```
2. Install the Bookstore schemas and data.
```sh
mysql> source bookstore.sql
mysql> source newdb.sql
```
3. Now you can use the database normally, but if you want to create other data sample for this database yourself, you can continue reading.
> Here we use [Faker.js](https://www.npmjs.com/package/Faker) to generate sample data and [fs](https://www.npmjs.com/package/fs) to write data to a text file.

- Install frameworks:
```sh
$ sudo npm install
```
- Run the data.js file:
```sh
$ node data.js
```
- You will get a 'test.txt' file after running those command. Then you can copy all the data inside that file to 'newdb.sql'. **Remember to change the last ',' in the end of each queries by a ';' .**