# Food Order Application

This is a food ordering application with a React frontend and Node.js backend.

## Setup Instructions

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm i
   ```

3. Configure your database:
   - Open `database/db.js` file
   - Modify the database connection settings:
   ```javascript
   foodOrderDB = await mysql.createConnection({
     host: "localhost",
     user: "root",
     password: "your-password-here",  // Change this to your MySQL root password
     database: "your-database-name",  // Change this to your database name
   });
   ```

4. Start the backend server:
   ```bash
   npm run dev
   ```

   The backend will start running on http://localhost:3000

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm i
   ```

3. Create a `.env` file in the frontend root directory with the following content:
   ```
   VITE_BASE_URL="http://localhost:3000/api"
   ```

4. Start the frontend development server:
   ```bash
   npm run dev
   ```

   The frontend application will be available at http://localhost:5173 (or another port if 5173 is already in use)

## Running the Application

1. Make sure the backend server is running first
2. Then start the frontend server
3. Access the application through your browser at the URL displayed after starting the frontend

## Features

- Browse available food shops
- View food items for each shop

## Technologies Used

- **Frontend**: React, TanStack Query, React Router, tailwind, axios, lucide-react
- **Backend**: Node.js, Express
- **Database**: MySQL
