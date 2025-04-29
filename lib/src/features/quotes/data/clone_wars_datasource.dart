class CloneWarsQuotesDataSource {
  final Map<String, dynamic> _data;

  CloneWarsQuotesDataSource(this._data);

  List<Season> get seasons {
    final seasons = <Season>[];

    Map<String, Map<String, dynamic>> quotes =
        (_data['CloneWarsQuotes'] as Map<String, dynamic>).map(
          (season, episodes) => MapEntry(
            season,
            (episodes as Map<String, dynamic>).map(
              (episode, quote) => MapEntry(episode, quote as String),
            ),
          ),
        );

    quotes.forEach((season, episodes) {
      final seasonNumber = int.parse(season.substring(6));
      final quotes = <Quote>[];

      episodes.forEach((episode, quote) {
        quotes.add(Quote(season: seasonNumber, episode: episode, quote: quote));
      });

      seasons.add(Season(number: seasonNumber, quotes: quotes));
    });

    return seasons;
  }
}

class Quote {
  final int season;
  final String episode;
  final String quote;

  Quote({required this.season, required this.episode, required this.quote});

  @override
  String toString() {
    return 'Quote {season: $season, episode: $episode,  quote: $quote}';
  }
}

class Season {
  final int number;
  final List<Quote> quotes;

  Season({required this.number, required this.quotes});
}

final quotes = '''
{
  "CloneWarsQuotes": {
    "Season1": {
      "S01E01": "Grandes líderes inspiram grandeza nos outros.",
      "S01E02": "Acreditar não é uma escolha, mas sim uma convicção.",
      "S01E03": "Fácil é o caminho da sabedoria, para aqueles não cegos por si mesmos.",
      "S01E04": "Um plano é tão bom quanto os que o realizam.",
      "S01E05": "A melhor confiança é construída pela experiência.",
      "S01E06": "Confie nos seus amigos, e eles terão razão pra confiar em você.",
      "S01E07": "Apoie seus amigos, mantendo o coração mais brando do que a cabeça.",
      "S01E08": "Heróis são feitos pelas circunstâncias.",
      "S01E09": "Ignore seus instintos à seu próprio risco.",
      "S01E10": "O mais poderoso é aquele que controla seu próprio poder.",
      "S01E11": "O sinuoso caminho para a paz é sempre o mais digno, apesar das muitas voltas que ele dá.",
      "S01E12": "Falhar com honra é melhor do que ter sucesso trapaceando.",
      "S01E13": "A cobiça e o medo da perda são as raízes que levam até a árvore do mal.",
      "S01E14": "Quando cercado pela guerra, escolha um lado.",
      "S01E15": "A arrogância diminui a sabedoria.",
      "S01E16": "A verdade ilumina a mente, mas nem sempre traz felicidade ao seu coração.",
      "S01E17": "O medo é uma doença, a esperança é a única cura.",
      "S01E18": "Uma única chance é uma galáxia de esperança.",
      "S01E19": "Dura é a estrada que leva até a grandeza.",
      "S01E20": "Os custos da guerra nunca podem ser realmente calculados.",
      "S01E21": "O compromisso é uma virtude a ser cultivada, não uma fraqueza para ser desprezada.",
      "S01E22": "Um segredo compartilhado é a confiança formada."
    },
    "Season2": {
      "S02E03": "A paciência é o primeiro passo para se corrigir um erro.",
      "S02E04": "Um coração sincero nunca deve ser posto em dúvida.",
      "S02E05": "Acredite em si mesmo ou ninguém mais acreditará.",
      "S02E06": "Nenhum presente é mais precioso do que a confiança.",
      "S02E08": "Apego não é compaixão.",
      "S02E09": "Para tudo que se ganha, alguma coisa é perdida.",
      "S02E11": "Fácil nem sempre significa simples.",
      "S02E12": "Ao se ignorar o passado, coloca-se em risco o futuro.",
      "S02E13": "Não tema pelo futuro, não chore pelo passado.",
      "S02E14": "Na guerra, a verdade é a primeira vítima.",
      "S02E15": "Buscar a verdade é fácil, aceitá-la que é difícil.",
      "S02E16": "Um líder sábio reconhece quando deve ser liderado.",
      "S02E17": "Coragem forja heróis, mas confiança constrói amizades.",
      "S02E18": "Escolha o que é certo, e não o que é fácil.",
      "S02E19": "A besta mais perigosa se encontra em nosso interior.",
      "S02E20": "Quem meu pai foi importa menos que a minha memória dele.",
      "S02E21E22": "A adversidade é o real teste da amizade."
    },
    "Season3": {
      "S03E01E02": "Irmãos de armas são irmãos para a vida toda.",
      "S03E03": "Onde existir força de vontade, existe um meio.",
      "S03E04": "Uma criança roubada é uma esperança perdida.",
      "S03E05": "O desafio da esperança é superar a corrupção.",
      "S03E06": "Aqueles que aplicam a lei devem seguir a lei.",
      "S03E07": "O futuro tem muitos caminhos, escolha bem.",
      "S03E08": "Uma falha no planejamento é um plano para o fracasso.",
      "S03E09": "O amor se apresenta em todas formas e tamanhos.",
      "S03E10": "O medo é um grande motivador.",
      "S03E11": "A verdade pode derrotar o espectro do medo.",
      "S03E12": "O caminho mais rápido para destruição é a vingança.",
      "S03E13": "Não se nasce com a maldade, ela é ensinada.",
      "S03E14": "O caminho para o mal pode trazer grande poder, mas não lealdade.",
      "S03E15": "Equilíbrio é encontrado naquele que enfrenta sua culpa.",
      "S03E16": "Aquele que desiste da esperança desiste da vida.",
      "S03E17": "Quem busca controlar o destino, nunca encontrará a paz.",
      "S03E18": "A adaptação é a chave da sobrevivência.",
      "S03E19": "Se algo tiver que dar errado, dará.",
      "S03E20": "Sem honra, a vitória é vazia.",
      "S03E21": "Sem humildade, a coragem é um jogo perigoso.",
      "S03E22": "Um bom aluno é aquilo que o professor espera que seja."
    },
    "Season4": {
      "S04E01E02": "Quando o destino chama, os escolhidos precisam atender.",
      "S04E03": "Coroas são herdadas, reinos são conquistados.",
      "S04E04": "A aparência nem sempre diz quem realmente a pessoa é.",
      "S04E05": "Compreender é honrar a verdade sob a superfície.",
      "S04E06": "Quem é mais tolo, o tolo ou quem o segue?",
      "S04E07": "Primeiro passo até a lealdade é a confiança.",
      "S04E08": "O caminho para ignorância é guiado pelo medo.",
      "S04E09": "O homem sábio lidera, o homem forte segue.",
      "S04E10": "Nossas ações definem o nosso legado.",
      "S04E11": "Nosso objetivo sempre reflete o caminho percorrido.",
      "S04E12": "Aquele que escraviza, inevitavelmente se torna escravo.",
      "S04E13": "Grandes esperanças podem surgir de pequenos sacrifícios.",
      "S04E14": "A amizade revela quem realmente somos.",
      "S04E15": "Toda guerra é baseada na mentira.",
      "S04E16": "Mantenha seus amigos por perto e seus inimigos mais perto ainda.",
      "S04E17": "Os fortes sobrevivem, os nobres superam.",
      "S04E18": "A confiança é o maior dos presentes, mas deve ser conquistada.",
      "S04E19": "É preciso esquecer o passado para se chegar ao futuro.",
      "S04E20": "Quem somos, nunca muda, quem pensamos que somos, sim.",
      "S04E21": "Um inimigo caído pode se levantar de novo, mas só aquele reconciliado é vencido de verdade.",
      "S04E22": "O inimigo do meu inimigo é meu amigo."
    },
    "Season5": {
      "S05E01": "A força de vontade pode derrotar a força bruta.",
      "S05E02": "O medo é uma arma maleável.",
      "S05E03": "Procurar por algo é acreditar em sua existência.",
      "S05E04": "Lutas geralmente começam e terminam com a verdade.",
      "S05E05": "A desobediência é um pedido por mudança.",
      "S05E06": "Aquele que enfrenta a si mesmo, descobre a si mesmo.",
      "S05E07": "Os jovens são frequentemente subestimados.",
      "S05E08": "Quando resgatamos outros, resgatamos a nós mesmos.",
      "S05E09": "Escolha seus inimigos com sabedoria, como se fossem a sua última esperança.",
      "S05E10": "A humildade é a única defesa contra a humilhação.",
      "S05E11": "Quando tudo parece perdido um verdadeiro herói traz a esperança.",
      "S05E12": "A arma mais poderosa de um soldado é a coragem.",
      "S05E13": "É preciso confiar em outros ou o sucesso é impossível.",
      "S05E14": "Uma visão pode ter muitas interpretações.",
      "S05E15": "As alianças podem esconder as verdadeiras intenções.",
      "S05E16": "A moralidade separa os heróis dos vilões.",
      "S05E17": "Às vezes, a menor das dúvidas pode abalar a maior das crenças.",
      "S05E18": "A coragem tem início na autoconfiança.",
      "S05E19": "Nunca fique tão desesperado a ponto de confiar no desonesto.",
      "S05E20": "Nunca desista da esperança, não importa o quão ruim tudo pareça."
    },
    "Season6": {
      "S06E01": "A verdade sobre si mesmo é sempre a pior de se aceitar.",
      "S06E02": "O sábio benefício de uma segunda opinião.",
      "S06E03": "Quando tiver dúvidas, vá direto à fonte.",
      "S06E04": "A crença popular nem sempre está correta.",
      "S06E05": "Amar é confiar. Confiar é acreditar.",
      "S06E06": "O ciúme é o caminho para o caos.",
      "S06E07": "O engodo é a arma da cobiça.",
      "S06E08": "Sem a escuridão não pode haver luz.",
      "S06E09": "Sabedoria está tanto nos tolos quanto nos sábios.",
      "S06E10": "O que se é perdido geralmente se é achado."
    }
  }
}
''';
