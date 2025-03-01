const express = require('express');
const router = express.Router();
const BorrowedBookService = require('../../../services/borrowedBookService');

// Get all borrowed books for a user
router.get('/borrowed-books', async (req, res) => {
    try {
        const userId = req.user._id; // Assuming user ID is available in the request
        const borrowedBooks = await BorrowedBookService.getBorrowedBooks(userId);
        res.json(borrowedBooks);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Return a borrowed book
router.post('/return-book/:id', async (req, res) => {
    try {
        const borrowedBookId = req.params.id;
        const returnedBook = await BorrowedBookService.returnBook(borrowedBookId);
        res.json(returnedBook);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
