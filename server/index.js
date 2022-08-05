const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');


const app = express();
const PORT = process.env.PORT || 3000;
const MONGODB_URI = 'mongodb+srv://hussam:9121997h@cluster0.nogy4.mongodb.net/?retryWrites=true&w=majority';

// middleware
app.use(express.json());
app.use(authRouter);

mongoose.connect(MONGODB_URI).then(() => {
    console.log('Connected to MongoDB');
}).catch(err => {
    console.log(err);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});