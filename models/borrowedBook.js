const mongoose = require('mongoose');

const borrowedBookSchema = new mongoose.Schema({
    bookId: { type: mongoose.Schema.Types.ObjectId, ref: 'Book', required: true },
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    borrowedDate: { type: Date, default: Date.now },
    returnDate: { type: Date }
});

module.exports = mongoose.model('BorrowedBook', borrowedBookSchema);
