# db/seeds.rb

# Clear existing borrowings (dependent on books)
Borrowing.destroy_all

# Clear existing books
Book.destroy_all

# Create sample books
books = [
  { title: '1984', author: 'George Orwell', isbn: '9780451524935' },
  { title: 'Pride and Prejudice', author: 'Jane Austen', isbn: '9780141439518' },
  { title: 'Moby-Dick', author: 'Herman Melville', isbn: '9781503280786' },
  { title: 'War and Peace', author: 'Leo Tolstoy', isbn: '9781853260629' },
  { title: 'The Catcher in the Rye', author: 'J.D. Salinger', isbn: '9780316769488' },
  { title: 'The Hobbit', author: 'J.R.R. Tolkien', isbn: '9780547928227' },
  { title: 'Crime and Punishment', author: 'Fyodor Dostoevsky', isbn: '9780486415871' },
  { title: 'The Brothers Karamazov', author: 'Fyodor Dostoevsky', isbn: '9780374528379' },
  { title: 'To Kill a Mockingbird', author: 'Harper Lee', isbn: '9780061120084' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', isbn: '9780743273565' },
  { title: 'Brave New World', author: 'Aldous Huxley', isbn: '9780060850524' },
  { title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', isbn: '9780544003415' },

  { title: '1984', author: 'George Orwell', isbn: '9780451524937' },
  { title: 'Pride and Prejudice', author: 'Jane Austen', isbn: '9780141439520' },
  { title: 'Moby-Dick', author: 'Herman Melville', isbn: '9781503280788' },
  { title: 'War and Peace', author: 'Leo Tolstoy', isbn: '9781853260631' },
  { title: 'The Catcher in the Rye', author: 'J.D. Salinger', isbn: '9780316769490' },
  { title: 'The Hobbit', author: 'J.R.R. Tolkien', isbn: '9780547928229' },
  { title: 'Crime and Punishment', author: 'Fyodor Dostoevsky', isbn: '9780486415873' },
  { title: 'The Brothers Karamazov', author: 'Fyodor Dostoevsky', isbn: '9780374528381' },
  { title: 'To Kill a Mockingbird', author: 'Harper Lee', isbn: '9780061120086' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', isbn: '9780743273567' },
  { title: 'Brave New World', author: 'Aldous Huxley', isbn: '9780060850526' },
  { title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', isbn: '9780544003417' }

]

# Seed the books
books.each do |book|
  Book.create!(book)
end

puts "Seeded #{Book.count} books."
