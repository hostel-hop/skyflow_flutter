class SkyflowTokens {
  SkyflowTokens({
    required this.tokens,
  });

  final List<SkyflowToken> tokens;

  Map<String, List<dynamic>> toJson() => {
        'records': tokens.map((e) {
          return e.toJson();
        }).toList()
      };
}

class SkyflowToken {
  SkyflowToken({required this.token});

  String token;

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

class SkyflowTokenValue {
  final String token;
  final String value;

  SkyflowTokenValue.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String,
        value = json['value'] as String;
}
