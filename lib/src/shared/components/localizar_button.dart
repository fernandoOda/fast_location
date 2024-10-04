import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class LocalizarButton extends StatelessWidget {
  final String cep;

  const LocalizarButton({Key? key, required this.cep}) : super(key: key);

  Future<Position> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Permissão de localização negada.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'As permissões de localização estão permanentemente negadas.';
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _openGoogleMaps() async {
    try {
      Position position = await _getCurrentLocation();
      final currentLatitude = position.latitude;
      final currentLongitude = position.longitude;

      // Cria a URL para abrir o Google Maps com a rota
      final googleMapsUrl =
          'https://www.google.com/maps/dir/?api=1&origin=$currentLatitude,$currentLongitude&destination=$cep';

      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Não foi possível abrir o Google Maps.';
      }
    } catch (e) {
      throw 'Erro ao obter a localização: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.map),
      label: const Text('Localizar'),
      onPressed: () {
        _openGoogleMaps();
      },
    );
  }
}
