# ThmanyahTask

A modern iOS application built with SwiftUI that provides podcast and content discovery features. This project demonstrates clean architecture principles, modular design, and modern iOS development practices.

## 📱 Features

- **Dashboard**: Browse and discover podcasts with categorized content
- **Search**: Search functionality for finding specific podcasts and content
- **Audio Playback**: Integrated audio player with play/pause controls
- **Modern UI**: Beautiful, responsive interface using custom design system
- **Arabic Support**: Full RTL support with custom Arabic fonts

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a modular approach:

### Core Architecture
- **MVVM Pattern**: ViewModels handle business logic and state management
- **Repository Pattern**: Data access abstraction layer
- **Use Case Pattern**: Business logic encapsulation
- **Assembly Pattern**: Dependency injection and view creation

### Project Structure
```
ThmanyahTask/
├── Features/
│   ├── Dashboard/          # Dashboard feature module
│   │   ├── Data/          # Data layer (Repository, API models)
│   │   ├── Domain/        # Business logic (Use Cases, Models)
│   │   └── Views/         # UI layer (Views, ViewModels)
│   └── Search/            # Search feature module
├── Network/               # Network layer with async/await support
├── Common/                # Shared utilities and extensions
├── Packages/
│   └── ThmanyahUI/        # Custom UI design system
└── Assets.xcassets/       # App resources
```

## 🛠️ Technical Stack

- **iOS 17.0+** - Minimum deployment target
- **SwiftUI** - Modern declarative UI framework
- **Combine** - Reactive programming for data flow
- **Async/Await** - Modern concurrency for network requests
- **Custom Design System** - ThmanyahUI package with Arabic fonts

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0+ deployment target
- macOS 14.0+ (for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ThmanyahTask
   ```

2. **Open the project**
   ```bash
   open ThmanyahTask.xcodeproj
   ```

3. **Build and run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run the project

### Configuration

The app is currently configured to show the Search view by default. To switch to Dashboard view, modify `ThmanyahTaskApp.swift`:


## 📦 Key Components

### Network Layer
- **NetworkService**: Protocol-based network service with async/await support
- **Requestable**: Protocol for defining API endpoints
- **NetworkError**: Comprehensive error handling

### UI Components
- **ThmanyahUI Package**: Custom design system including:
  - Arabic fonts (IBM Plex Sans Arabic)
  - Color system
  - Typography
  - Spacing and padding utilities

### Feature Modules

#### Dashboard
- **DashboardView**: Main dashboard interface
- **DashboardViewModel**: Business logic and state management
- **DashboardUseCase**: Content fetching and processing
- **DashboardRepository**: Data access layer

#### Search
- **SectionSearchView**: Search interface
- **SectionSearchViewModel**: Search logic and state
- **SearchUseCase**: Search functionality
- **SearchRepository**: Search data access

### Common Components
- **Extensions**: Swift extensions for common types
- **RemoteImage**: Async image loading utility
- **StringOrInt**: Flexible data type for API responses

## 🎨 Design System

The app uses a custom design system (`ThmanyahUI`) that includes:

- **Typography**: IBM Plex Sans Arabic font family with multiple weights
- **Colors**: Consistent color palette with hex string support
- **Spacing**: Standardized padding and margin system

## 🔧 Development

### Adding New Features
1. Create a new feature folder in `Features/`
2. Follow the established architecture pattern:
   - `Data/` for repositories and API models
   - `Domain/` for use cases and business logic
   - `Views/` for UI components
3. Create an Assembly file for dependency injection
4. Register the feature in the main app

### Code Style
- Follow Swift naming conventions
- Use SwiftUI for all UI components
- Implement MVVM pattern consistently
- Use async/await for asynchronous operations
- Add proper error handling

## 📱 Screenshots


https://github.com/user-attachments/assets/cbdfcd84-0b39-4330-8aa6-89d0b3e5c3af



