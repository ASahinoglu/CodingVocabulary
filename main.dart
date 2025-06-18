import 'dart:io';
import 'dart:math';

void main() {
  print("Willkommen beim Programmierer-Vokabel-Quiz!");

  Map<String, String> words = {
    "Absturz": "Crash",
    "Laufzeit": "Runtime",
    "Speicher": "Memory",
    "Zeiger": "Pointer",
    "Übersetzer": "Compiler",
    "Fehler": "Bug",
    "Schleife": "Loop",
    "Bedienoberfläche": "Interface",
    "Entwickler": "Developer",
    "Datenbank": "Database",
    "Netzwerk": "Network",
    "Verbindung": "Connection",
    "Anweisung": "Statement",
    "Bedingung": "Condition",
    "Variable": "Variable",
    "Funktion": "Function",
    "Klasse": "Class",
    "Objekt": "Object",
    "Bibliothek": "Library",
    "Modul": "Module",
    "Projekt": "Project",
    "Version": "Version",
    "Repository": "Repository",
    "Lizenz": "License",
  };

  var random = Random();
  int points = 0;
  List<String> fragen = words.keys.toList();
  fragen.shuffle();

  for (int i = 0; i < 5; i++) {
    String frage = fragen[i];
    String richtigeAntwort = words[frage]!;

    // Antwortenliste mit einer richtigen Antwort
    List<String> antworten = [];
    antworten.add(richtigeAntwort);

    // Drei falsche Antworten hinzufügen
    while (antworten.length < 4) {
      String zufall = words.values.elementAt(random.nextInt(words.length));
      if (!antworten.contains(zufall)) {
        antworten.add(zufall);
      }
    }

    antworten.shuffle();

    print("\nFrage ${i + 1}: Was ist '$frage' auf Englisch?");
    for (int j = 0; j < antworten.length; j++) {
      print("${j + 1}. ${antworten[j]}");
    }

    stdout.write("Deine Antwort (1-4): ");
    String? eingabe = stdin.readLineSync();
    int auswahl = int.tryParse(eingabe ?? "") ?? 0;

    if (auswahl >= 1 && auswahl <= 4) {
      if (antworten[auswahl - 1] == richtigeAntwort) {
        print("Richtig!");
        points++;
      } else {
        print("Falsch. Die richtige Antwort war: $richtigeAntwort");
      }
    } else {
      print("Ungültige Eingabe.");
    }
  }

  print("\nDu hast $points von 5 pointsn erreicht.");
}
