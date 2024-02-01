
class Question {
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question(
      {required this.question,
      required this.response,
      required this.explanation,
      required this.imagePath});

  String getImage() => 'images/$imagePath';
}

class QuestionData {
  List<Question> questionList = [
    Question(
        question:
            "Le but du jeu est de détruire toutes les briques en faisant rebondir une balle sur une raquette mobile ?",
        response: true,
        explanation:
            'En effet, le but du jeu est de détruire toutes les briques en faisant rebondir une balle sur une raquette mobile',
        imagePath: 'a.png'),
    Question(
        question:
            "Le jeu a été créé dans les années 90 par un étudiant en informatique ?",
        response: false,
        explanation: "Le jeu original, appellé Breakout, a été créé en 1976 par Atari, inpiré par le je Pong",
        imagePath: 'b.png'),
    Question(
        question: "Le je a fait un flop à sa sortie ?",
        response: false,
        explanation:
            "Le jeu a eu un succès immédiat, et a été vendu à plus de 15 millions d'exemplaires",
        imagePath: 'c.png'),
    Question(
        question:
            "Le jeu est sorti sur console de salon a sa sortie en 1976 ?",
        response: false,
        explanation:
            "Breakout est sorti sur borne d'arcade en 1976, puis sur console de salon en 1978",
        imagePath: 'd.png'),
    Question(
        question: "Steve Jobs a travaillé sur le jeu Breakout ?",
        response: true,
        explanation: "Oui, Steve Jobs était une recrus d'Atari à l'époque. C'est même lui qui a été chargé de créer le jeu !",
        imagePath: 'e.png'),
    Question(
        question:
            "Ce jeu est un des jeux les plus clonés de l'histoire ?",
        response: true,
        explanation:
            "Ce jeu est le jeu le plus cloné de l'histoire, avec plus de 900 clones !",
        imagePath: 'f.png'),
    
  ];
}