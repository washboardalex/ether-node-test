require('dotenv').config();
const express= require('express');
const app =express();
const routes = require('./routes');
const Web3 = require('web3');
const MongoClient = require('mongodb').MongoClient;
const contract = require('truffle-contract');
app.use(express.json());

const client = new MongoClient(process.env.DB, { useNewUrlParser: true, useUnifiedTopology: true });

client.connect(err => {
    const db =client.db('Cluster0');
    //home
    routes(app,db);
    app.listen(process.env.PORT || 8082, () => {
        console.log('listening on port 8082');
    });
});

