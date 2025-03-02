# Book Lending Library Application
By Ogola Jeremy 
Date: 2nd March 2025

This is a simple **Book Lending Library** application built using **Ruby on Rails 8**. It allows users to register, log in, and borrow books from the library. The application tracks borrowed books, returns, and provides features for listing available books. It includes user authentication using **Devise** and a borrowing system associating users and books with due dates for borrowed books.


## Features

- User registration and login (powered by **Devise**)
- List of available books
- Borrowing and returning books
- Track borrowed books and due dates
- Role-based system (Users/Admins)
- High test coverage for models and controllers

## Technologies Used

- **Ruby on Rails 8**: The backend framework.
- **Devise**: For user authentication.
- **PostgreSQL**: Database for storing book and user information.
- **RSpec**: For testing the application.
- **Propshaft**: Asset pipeline for Rails.
- **Tailwind CSS**: For styling the frontend.
  
## Installation and Setup

### Prerequisites

Before you begin, ensure you have the following installed:

- Ruby (version 3.x or higher)
- Rails (version 8.x or higher)
- PostgreSQL
- Node.js and Yarn (for managing JavaScript dependencies)

### Step-by-step Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ogjereemy/book-library-app.git
   cd book-library-app
   ```

2. **Install Ruby gems:**
   ```bash
   bundle install
   ```

3. **Install JavaScript packages:**
   ```bash
   yarn install
   ```

4. **Setup the database:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the Rails server:**
   ```bash
   rails server
   ```

6. **Visit the application in your browser:**
   Open `http://localhost:3000` in your web browser.

## Running Tests

To run the test suite, use the following command:
```bash
rails test
```

## Deployment

To deploy the application, follow these steps:

1. **Ensure all dependencies are installed:**
   ```bash
   bundle install
   yarn install
   ```

2. **Precompile assets:**
   ```bash
   rails assets:precompile
   ```

3. **Migrate the database:**
   ```bash
   rails db:migrate
   ```

4. **Start the server:**
   ```bash
   rails server
   ```

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
