import 'MatchDto.dart';
import 'MmrDto.dart';
import 'MostAssistDto.dart';
import 'MostBannedDto.dart';
import 'MostDeathDto.dart';
import 'MostFirstBloodKillDto.dart';
import 'MostFirstTowerKillDto.dart';
import 'MostGoldEarnedDto.dart';
import 'MostKillDeathAssistDto.dart';
import 'MostKillDto.dart';
import 'MostMinionsKilledDto.dart';
import 'MostPlayedChampionDto.dart';
import 'MostPlayedSummonerDto.dart';
import 'MostTotalDamageDealtToChampionsDto.dart';
import 'MostTotalDamageTakenDto.dart';
import 'MostVisionScoreDto.dart';
import 'MostWinningDto.dart';

class Statistics {
  final String startDateOfMonth;
  final String endDateOfMonth;
  final List<MatchDto> matches;
  final List<MostBannedDto> mostBannedList;
  final List<MostPlayedChampionDto> mostPlayedChampionList;
  final List<MostWinningDto> mostWinningList;
  final List<MostPlayedSummonerDto> mostPlayedSummonerList;
  final List<MostKillDeathAssistDto> mostKillDeathAssistList;
  final MostKillDto mostKill;
  final MostDeathDto mostDeath;
  final MostAssistDto mostAssist;
  final MostVisionScoreDto mostVisionScore;
  final MostTotalDamageDealtToChampionsDto mostTotalDamageDealtToChampions;
  final MostTotalDamageTakenDto mostTotalDamageTaken;
  final MostGoldEarnedDto mostGoldEarned;
  final MostMinionsKilledDto mostNeutralMinionsKilled;
  final MostFirstTowerKillDto mostFirstTowerKill;
  final MostFirstBloodKillDto mostFirstBloodKill;
  final MmrDto minMmr;
  final MmrDto maxMmr;

  Statistics(
      {this.startDateOfMonth,
      this.endDateOfMonth,
      this.matches,
      this.mostBannedList,
      this.mostPlayedChampionList,
      this.mostWinningList,
      this.mostPlayedSummonerList,
      this.mostKillDeathAssistList,
      this.mostKill,
      this.mostDeath,
      this.mostAssist,
      this.mostVisionScore,
      this.mostTotalDamageDealtToChampions,
      this.mostTotalDamageTaken,
      this.mostGoldEarned,
      this.mostNeutralMinionsKilled,
      this.mostFirstTowerKill,
      this.mostFirstBloodKill,
      this.minMmr,
      this.maxMmr});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      startDateOfMonth: json['startDateOfMonth'],
      endDateOfMonth: json['endDateOfMonth'],
      matches: json['matches'],
      mostBannedList: json['mostBannedList'],
    );
  }
}
