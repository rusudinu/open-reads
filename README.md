# Open Reads

Open Reads is an open-source GoodReads clone that provides a modern platform for tracking reading progress, discovering new books, and connecting with other readers. It features a clean UI, book search, friends feed, personalized shelves, and rating/review functionality.

## System Architecture

The project follows a multi-tier architecture with:

1. **Backend**: Spring Boot Java application
2. **Frontend**: Angular-based web application
3. **Mobile**: Flutter-based mobile application

## Backend (Spring Boot)

The backend is built using Spring Boot and provides RESTful APIs for all application functionality. It uses JWT authentication through KeyCloak integration.

### API Endpoints

#### Book Controller (`/book`)
- `GET /book/{id}` - Retrieve a specific book by ID
- `GET /book/search/{keyword}` - Search for books by keyword
- `POST /book` - Save a new book
- `GET /book/recommended` - Get book recommendations for the current user
- `PUT /book/mark-as-reading/{bookId}` - Mark a book as "currently reading" 
- `PUT /book/mark-as-read/{bookId}` - Mark a book as "read"
- `PUT /book/mark-as-want-to-read/{bookId}` - Mark a book as "want to read"
- `GET /book/status/{bookId}` - Get the status of a book for the current user

#### User Profile Controller (`/profile`)
- `GET /profile/me` - Get the current user's profile
- `GET /profile/{username}` - Get a specific user's profile
- `POST /profile` - Save a user profile
- `PUT /profile/description` - Update the current user's profile description
- `PUT /profile/add-friend/{username}` - Add a friend
- `GET /profile/friends` - Get the current user's friends list

#### Rating Controller (`/rating`)
- `GET /rating/{bookId}` - Get the average rating for a book
- `GET /rating/me/{bookId}` - Get the current user's rating for a book
- `PUT /rating/{bookId}/{rating}` - Rate a book

#### Feed Controller (`/feed`)
- `GET /feed` - Get the activity feed (showing friends' reading activity)

### Technology Stack
- Java with Spring Boot
- Spring Security with OAuth2/OIDC
- JPA/Hibernate for persistence
- RESTful API design

## Frontend (Angular)

The frontend is built with Angular and provides a responsive web interface for all application features.

### Core Components
- **Home** - Shows recommended books and activity feed
- **Profile** - User profile management and friend connections
- **Book** - Book details and actions (rating, shelving)
- **Shelves** - Manage book collections (Read, Currently Reading, Want to Read)
- **Add Book** - Interface for adding new books

### Services
- **BookService** - Handles book-related API calls
- **ProfileService** - Manages user profile operations
- **HomeService** - Retrieves feed data
- **AuthService** - Handles authentication with KeyCloak

### Technology Stack
- Angular
- TypeScript
- Angular Material UI components
- NgBootstrap for UI elements
- RxJS for reactive programming
- KeyCloak integration for authentication

## Mobile Application (Flutter)

The project includes a Flutter-based mobile application that provides similar functionality to the web frontend.

### Architecture

The mobile app follows a clean architecture approach with:

#### State Management
- **BLoC (Business Logic Component)** pattern for separation of UI and business logic
- **Provider** for dependency injection and state management across the widget tree

#### Layered Structure
- **Presentation Layer** - Flutter widgets and screens that consume BLoCs
- **Business Logic Layer** - BLoCs that handle state transformations and business logic
- **Data Layer** - Repositories and data sources

#### Key Components
- **Repositories** - Abstraction layer between data sources and BLoCs
  - `BookRepository` - Handles book-related operations
  - `UserRepository` - Manages user profile and authentication
  - `ShelfRepository` - Manages book shelves
  - `RatingRepository` - Handles book rating operations
  
- **BLoCs**
  - `BookBloc` - Manages book search, details, and recommendations
  - `AuthBloc` - Handles authentication state
  - `ProfileBloc` - Manages user profile data
  - `ShelfBloc` - Handles shelf operations (adding books, changing shelf status)
  - `FeedBloc` - Manages the social feed

- **Models** - Data classes representing domain entities
  - `Book` - Book details
  - `User` - User profile
  - `Rating` - Book ratings
  - `Shelf` - Reading shelves
  - `FeedEntry` - Activity feed items

#### Data Flow
1. UI events trigger BLoC events
2. BLoCs process events and call repositories
3. Repositories fetch data from API or local storage
4. Repositories return data to BLoCs
5. BLoCs emit new states
6. UI rebuilds based on new states

### Technology Stack
- Flutter
- Dart
- flutter_bloc for BLoC implementation
- provider for dependency injection
- dio for HTTP requests
- shared_preferences for local storage
- json_serializable for model serialization

## Authentication

Authentication is implemented using KeyCloak, providing:
- OAuth2/OIDC compliant authentication
- Role-based access control
- JWT token-based security

## Development Setup

### Backend
```bash
cd backend
./gradlew bootRun
```

### Frontend
```bash
cd frontend
npm install
ng serve
```

### Mobile
```bash
cd mobile
flutter pub get
flutter run
```
