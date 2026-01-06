# WorkForce - Blue-Collar Workforce Management Platform

A mobile-based workforce platform designed to manage blue-collar manpower. The platform connects Companies, Contractors, and Workers (Labour) in a seamless ecosystem.

## 📱 Features

- **Worker Registration & Dashboard**: Workers can register, set availability, browse jobs, and manage applications
- **Contractor Registration & Dashboard**: Contractors can accept company jobs and post jobs to hire labour
- **Company Registration & Dashboard**: Companies can submit requirements and manage their workforce needs
- **Dark Theme UI**: Modern dark blue theme with orange accents
- **Mobile-First Design**: Optimized for mobile devices

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed:

### For Both Windows and Linux:

1. **Flutter SDK** (3.10.4 or higher)
   - Download from: https://docs.flutter.dev/get-started/install
   - Verify installation: `flutter --version`

2. **Git**
   - Windows: Download from https://git-scm.com/download/win
   - Linux: Install via `sudo apt-get install git` (Ubuntu/Debian)

3. **Code Editor** (Optional but recommended)
   - Visual Studio Code with Flutter extension
   - Android Studio

### Platform-Specific Requirements:

#### Windows:
- **Android Studio** (for Android development)
- **Chrome** (for web development)
- **Windows 10/11** (64-bit)

#### Linux:
- **Android Studio** (for Android development)
- **Chrome** (for web development)
- **Ubuntu 20.04+** or similar Linux distribution

## 📥 Installation Steps

### Step 1: Clone the Repository

Open your terminal/command prompt and run:

```bash
git clone https://github.com/Ashishsingh1703/shramjeevi.git
cd shramjeevi
```

### Step 2: Verify Flutter Installation

Check if Flutter is properly installed:

```bash
flutter doctor
```

This will show you what's installed and what's missing. Install any missing dependencies.

### Step 3: Install Dependencies

Navigate to the project directory and install Flutter packages:

```bash
cd shramjeevi
flutter pub get
```

### Step 4: Verify Setup

Check available devices:

```bash
flutter devices
```

You should see available devices (Android phone, emulator, Chrome, Linux, etc.)

## 🚀 Running the Application

### Option 1: Run on Android Device/Emulator

1. **Connect your Android device** via USB (enable USB debugging) OR **start an Android emulator**

2. **Run the app:**
   ```bash
   flutter run
   ```
   
   Or specify a device:
   ```bash
   flutter run -d <device-id>
   ```

### Option 2: Run on Chrome (Web)

```bash
flutter run -d chrome
```

### Option 3: Run on Linux Desktop

```bash
flutter run -d linux
```

### Option 4: Run on Windows Desktop

```bash
flutter run -d windows
```

## 📱 Available User Types

The app supports three user types:

1. **Worker (Labour)**: Register and find jobs
2. **Contractor**: Accept company jobs and post jobs for labour
3. **Company**: Submit requirements and manage workforce

## 🏗️ Project Structure

```
lib/
├── constants/
│   └── roles.dart          # User role constants
├── screens/
│   ├── home_screen.dart                    # Home/Login screen
│   ├── login_screen.dart                  # OTP login
│   ├── worker_register_screen.dart        # Worker registration
│   ├── labour_home_screen.dart            # Worker dashboard
│   ├── contractor_register_screen.dart    # Contractor registration
│   ├── contractor_home_screen.dart       # Contractor dashboard
│   ├── company_register_screen.dart       # Company registration
│   ├── company_home_screen.dart           # Company dashboard
│   ├── edit_profile_screen.dart           # Worker edit profile
│   ├── contractor_edit_profile_screen.dart # Contractor edit profile
│   ├── company_edit_profile_screen.dart   # Company edit profile
│   └── job_detail_screen.dart            # Job details screen
├── theme/
│   └── app_colors.dart     # App color constants
└── main.dart              # App entry point
```

## 🎨 Theme

- **Primary Background**: `#0F1C2E` (Dark Blue)
- **Secondary Background**: `#16263F` (Lighter Dark Blue)
- **Primary Accent**: `#FF8C32` (Orange)
- **Text**: White with various opacities

## 🔧 Troubleshooting

### Common Issues:

1. **"Flutter command not found"**
   - Add Flutter to your PATH environment variable
   - Restart your terminal

2. **"No devices found"**
   - For Android: Enable USB debugging on your phone
   - For Emulator: Start an Android emulator from Android Studio
   - For Web: Ensure Chrome is installed

3. **"Pub get failed"**
   - Check your internet connection
   - Run `flutter clean` then `flutter pub get`

4. **Build errors**
   - Run `flutter clean`
   - Delete `pubspec.lock`
   - Run `flutter pub get` again

### Windows-Specific:

- If Android Studio is not detected, install it and run `flutter doctor --android-licenses`
- Ensure Windows SDK is installed for Windows desktop development

### Linux-Specific:

- Install required dependencies:
  ```bash
  sudo apt-get update
  sudo apt-get install -y build-essential libgtk-3-dev
  ```
- For Android development, ensure Android SDK is properly configured

## 📝 Development Commands

```bash
# Check Flutter setup
flutter doctor

# Get dependencies
flutter pub get

# Clean build
flutter clean

# Run app
flutter run

# Build APK (Android)
flutter build apk

# Build App Bundle (Android)
flutter build appbundle

# Build Web
flutter build web

# Run tests
flutter test
```

## 🔄 Hot Reload & Hot Restart

While the app is running:
- Press `r` in the terminal for **Hot Reload** (quick updates)
- Press `R` for **Hot Restart** (full restart)
- Press `q` to **Quit**

## 📦 Dependencies

Main dependencies:
- `flutter`: SDK
- `cupertino_icons`: iOS-style icons

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is private and proprietary.

## 👥 Team

For questions or support, contact the development team.

## 📞 Support

If you encounter any issues:
1. Check the Troubleshooting section above
2. Review Flutter documentation: https://docs.flutter.dev
3. Check GitHub Issues for similar problems

---

**Happy Coding! 🚀**
