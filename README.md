<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<body>

<h1>🏋️ Fitness App</h1>

<!-- Banner Image -->
<!-- <img src="path/to/your/banner/image.png" alt="Fitness App Banner" style="width:100%; height:auto;"> -->

<p>A sleek, feature-rich Flutter application designed to help users manage their fitness journey. Integrated with Firebase, it offers health assessments, fitness challenges, and workout routines in an intuitive and user-friendly interface.</p>

<h2>🚀 Features</h2>
<ul>
    <li><strong>Firebase Integration:</strong> Seamlessly interact with Firebase for data storage and retrieval.</li>
    <li><strong>Health Assessments:</strong> Complete assessments and receive detailed reports.</li>
    <li><strong>Fitness Challenges:</strong> Participate in engaging challenges with progress tracking.</li>
    <li><strong>Workout Routines:</strong> Access various workout routines with detailed instructions and difficulty levels.</li>
    <li><strong>Hero Animations:</strong> Enjoy smooth transitions between screens with Hero animations.</li>
</ul>

<h2>🎨 Screenshots</h2>

<!-- Screenshots -->
<div style="display: flex; flex-wrap: wrap;">
    <div style="flex: 1; margin: 10px;">
        <img src="assets\screenshot\3.jpeg" alt="Homepage" style="width:50%; height:auto;">
        <p style="text-align:center;"><em>Homepage - Your fitness journey starts here.</em></p>
    </div>
    <div style="flex: 1; margin: 10px;">
        <img src="assets\screenshot\5.jpeg"  alt="Assessments" style="width:50%; height:auto;">
        <p style="text-align:center;">
            <em>Health Assessments - Complete assessments and track your health.</em></p>
    </div>
    <div style="flex: 1; margin: 10px;">
        <img src="assets\screenshot\3.jpeg" alt="Challenges" style="width:50%; height:auto;">
        <p style="text-align:center;"><em>Fitness Challenges - Stay motivated with engaging challenges.</em></p>
    </div>
    <div style="flex: 1; margin: 10px;">
        <img src="assets\screenshot\4.jpeg" alt="Workout Routines" style="width:50%; height:auto;">
        <p style="text-align:center;"><em>Workout Routines - Explore various routines tailored to your fitness level.</em></p>
    </div>
</div>

<h2>🛠️ Getting Started</h2>

<h3>Prerequisites</h3>
<ul>
    <li>Flutter SDK</li>
    <li>Dart SDK</li>
    <li>Firebase project setup for both Android and iOS.</li>
</ul>

<h3>Installation</h3>
<ol>
    <li>
        <p><strong>Clone the Repository:</strong></p>
        <pre><code>git clone https://github.com/Akhilaanil104/fitnessapp.git
cd fitnessapp</code></pre>
    </li>
    <li>
        <p><strong>Install Dependencies:</strong></p>
        <pre><code>flutter pub get</code></pre>
    </li>
    <li>
        <p><strong>Configure Firebase:</strong> Add your <code>google-services.json</code> (Android) or <code>GoogleService-Info.plist</code> (iOS) to the respective platform directories.</p>
    </li>
    <li>
        <p><strong>Run the App:</strong></p>
        <pre><code>flutter run</code></pre>
    </li>
</ol>

<h2>📂 Project Structure</h2>
<pre>
<code>
fitnessapp/
│
├── lib/
│   ├── main.dart                # Entry point of the app
│   ├── homepage.dart            # Homepage UI
│   ├── test1.dart               # Test1 Screen UI
│   ├── assessmentdetails.dart   # Assessment Details UI
│   └── firebase_service.dart    # Firebase interaction service
│
├── assets/
│   ├── images/                  # Image assets
│
├── pubspec.yaml                 # Project configuration file
</code>
</pre>

<h2>👥 Contributing</h2>
<p>Contributions are welcome! Feel free to submit a Pull Request.</p>

<h2>📄 License</h2>
<p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for details.</p>

</body>
</html>
