import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

@riverpod
LocationService locationService(Ref ref) => LocationService();

// 東京（フォールバック用）
const _fallbackLat = 35.6895;
const _fallbackLon = 139.6917;

class LocationService {
  /// 現在地（緯度・経度）を取得する
  Future<({double latitude, double longitude})> getCurrentPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return (latitude: _fallbackLat, longitude: _fallbackLon);
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return (latitude: _fallbackLat, longitude: _fallbackLon);
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return (latitude: _fallbackLat, longitude: _fallbackLon);
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 10),
        ),
      );
      return (latitude: position.latitude, longitude: position.longitude);
    } catch (_) {
      // Windowsなど位置情報が取れない環境では東京の座標を使用
      return (latitude: _fallbackLat, longitude: _fallbackLon);
    }
  }
}
