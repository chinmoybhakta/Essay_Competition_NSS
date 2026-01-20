import 'package:audioplayers/audioplayers.dart';

class BackgroundMusicService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> play() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(0.3);

    await _player.play(
      UrlSource('assets/song/song_web.wav'),
    );
  }

  static Future<void> stop() async {
    await _player.stop();
  }
}
