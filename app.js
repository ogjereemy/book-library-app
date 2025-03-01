const express = require('express');
const app = express();
// ...existing code...
const borrowedBookController = require('./frontend/src/components/borrowedBookController');
const borrowedBookRoutes = require('./routes/borrowedBookRoutes');
// ...existing code...
app.use('/api', borrowedBookController);
app.use('/api', borrowedBookRoutes);
// ...existing code...
