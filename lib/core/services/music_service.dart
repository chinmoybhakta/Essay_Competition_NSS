import 'package:audioplayers/audioplayers.dart';

class BackgroundMusicService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> play() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(0.3);

    // Replace with your online MP3 URL
    await _player.play(
      UrlSource('https://raw.githubusercontent.com/chinmoybhakta/song_007/main/song.mp3'),
    );
    
    // If you want to use your own music, upload your song.mp3 to:
    // 1. Google Drive (make it public and get shareable link)
    // 2. GitHub (upload to repository and use raw URL)
    // 3. Firebase Storage
    // 4. Any public hosting service
    
    // Example with Google Drive:
    // await _player.play(UrlSource('https://drive.google.com/uc?export=download&id=1htk9Wa1KtXdA5q_ThXW7-pN7wwE0p7H9'));
    
    // Example with GitHub:
    // await _player.play(UrlSource('https://raw.githubusercontent.com/yourusername/yourrepo/main/song.mp3'));
  }

  static Future<void> stop() async {
    await _player.stop();
  }
}