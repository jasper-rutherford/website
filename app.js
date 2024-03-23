// Load environment variables from .env file
require('dotenv').config();

const express = require('express');
const app = express();
const port = 3000; // Default port for development

// Set view engine to EJS
app.set('view engine', 'ejs');

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Route for the homepage
app.get('/', (req, res) => {
    res.render('index');
});

// Route for the contact page
app.get('/contact', (req, res) => {
    res.render('contact');
});

// Set up domain based on environment
const domain = process.env.DOMAIN || `localhost:${port}`;

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://${domain}`);
});
