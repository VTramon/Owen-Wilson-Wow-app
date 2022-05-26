// ignore_for_file: non_constant_identifier_names

import 'dart:core';

class Api {
  final String? movie;
  final int? year;
  final String? release_date;
  final String? director;
  final String? character;
  final String? movie_duration;
  final String? timestamp;
  final String? full_line;
  final int? current_wow_in_movie;
  final int? total_wows_in_movie;
  final String? poster;
  final Video? video;
  final String? audio;

  Api(
      {this.movie,
      this.year,
      this.release_date,
      this.director,
      this.character,
      this.movie_duration,
      this.timestamp,
      this.full_line,
      this.current_wow_in_movie,
      this.total_wows_in_movie,
      this.poster,
      this.video,
      this.audio});

  factory Api.fromJson(Map<String, dynamic> json) => Api(
        movie: json['movie'],
        year: json['year'],
        release_date: json['release_date'],
        director: json['director'],
        character: json['character'],
        movie_duration: json['movie_duration'],
        timestamp: json['timestamp'],
        full_line: json['full_line'],
        current_wow_in_movie: json['current_wow_in_movie'],
        total_wows_in_movie: json['total_wows_in_movie'],
        poster: json['poster'],
        video: Video.fromJson(json['video']),
        audio: json['audio'],
      );

  Map<String, dynamic> toJson() => {
        'movie': movie,
        'year': year,
        'release_date': release_date,
        'director': director,
        'character': character,
        'movie_duration': movie_duration,
        'timestamp': timestamp,
        'full_line': full_line,
        'current_wow_in_movie': current_wow_in_movie,
        'total_wows_in_movie': total_wows_in_movie,
        'poster': poster,
        'video': video,
        'audio': audio,
      };
}

class Video {
  final String? high;
  final String? medium;
  final String? low;
  final String? veryLow;

  Video({this.high, this.medium, this.low, this.veryLow});

  factory Video.fromJson(Map<String, dynamic> json) => Video(
      high: json['1080p'],
      medium: json['720p'],
      low: json['480p'],
      veryLow: json['360p']);

  Map<String, dynamic> toJson() => {
        '1080p': high,
        '720p': medium,
        '480p': low,
        '360p': veryLow,
      };
}
