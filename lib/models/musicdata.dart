class DataModel {
  late List<Mp3Model> mp3Files;

  DataModel(this.mp3Files);

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['Mp3Files'] != null) {
      mp3Files = List<Mp3Model>.empty(growable: true);
      json['Mp3Files'].forEach((v) {
        mp3Files.add(Mp3Model.fromJson(v));
      });
    }
  }
}

class Mp3Model {
  late final String? path;
  late final String? displayName;
  late final String? album;
  late final String? albumImage;
  late final String? artist;
  late final String? dateAdded;
  late final String? size;
  late final String? duration;

  Mp3Model(
      {this.path,
      this.displayName,
      this.album,
      this.albumImage,
      this.artist,
      this.dateAdded,
      this.size,
      this.duration});

  factory Mp3Model.fromJson(Map<String, dynamic> json) => Mp3Model(
        path: json["path"],
        displayName: json["displayName"],
        album: json["album"],
        albumImage: json["albumImage"],
        artist: json["artist"],
        dateAdded: json["dateAdded"],
        size: json["size"],
        duration: json["duration"],
      );
  Map<String, dynamic> toJson() => {
        "path": this.path,
        "displayName": this.displayName,
        "album": this.album,
        "shortName": this.albumImage,
        "artist": this.artist,
        "dateAdded": this.dateAdded,
        "size": this.size,
        "duration": this.duration,
      };
}
