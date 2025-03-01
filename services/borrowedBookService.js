const BorrowedBook = require('../models/borrowedBook');

class BorrowedBookService {
    static async getBorrowedBooks(userId) {
        return BorrowedBook.find({ userId, returnDate: null }).populate('bookId');
    }

    static async returnBook(borrowedBookId) {
        return BorrowedBook.findByIdAndUpdate(borrowedBookId, { returnDate: new Date() }, { new: true });
    }
}

module.exports = BorrowedBookService;
