import 'dart:io'; // für input und output
import 'dart:math'; //für Random

void main() {
  print("Willkommen beim Vokabel-Quiz!");
  //Tabelle schlüssel deutsch und werte englisch
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
    "Quellcode": "Source Code",
    "Fehlermeldung": "Error Message",
    "Kommandozeile": "Command Line",
    "Benutzer": "User",
    "Passwort": "Password",
    "Datei": "File",
    "Verzeichnis": "Directory",
    "Ausnahme": "Exception",
    "Test": "Test",
    "Entwicklung": "Development",
    "Berechnung": "Calculation",
    "Ausgabe": "Output",
    "Eingabe": "Input",
    "Bedienung": "Operation",
    "Programmierung": "Programming",
    "Anwendung": "Application",
    "System": "System",
    "Hardware": "Hardware",
    "Software": "Software",
    "Schnittstelle": "Interface",
    "Bildschirm": "Screen",
    "Taste": "Key",
    "Abfrage": "Query",
    "Schlüsselwort": "Keyword",
    "Kommentar": "Comment",
    "Zeichenkette": "String",
    "Ganzzahl": "Integer",
    "Gleitkommazahl": "Float",
    "Wahrheitswert": "Boolean",
    "Liste": "List",
    "Menge": "Set",
    "Schlüssel": "Key",
    "Wert": "Value",
    "Zuordnung": "Mapping",
    "Datentyp": "Data Type",
    "Zuweisung": "Assignment",
    "Vergleich": "Comparison",
    "Ausdruck": "Expression",
    "Operator": "Operator",
    "Argument": "Argument",
    "Rückgabewert": "Return Value",
    "Standardwert": "Default Value",
    "Namensraum": "Namespace",
    "Import": "Import",
    "Export": "Export",
    "Initialisierung": "Initialization",
    "Deklaration": "Declaration",
    "Klammer": "Bracket",
    "Hochkomma": "Quote",
    "Escapezeichen": "Escape Character",
    "Zeilenumbruch": "Line Break",
    "Leerzeichen": "Whitespace",
    "Schleifenvariable": "Loop Variable",
    "Abbruch": "Break",
    "Fortsetzen": "Continue",
    "Einzeiliger Kommentar": "Single-line Comment",
    "Mehrzeiliger Kommentar": "Multi-line Comment",
    "Syntax": "Syntax",
    "Logik": "Logic",
    "Laufzeitfehler": "Runtime Error",
    "Syntaxfehler": "Syntax Error",
    "Typfehler": "Type Error",
    "Debugger": "Debugger",
    "Protokoll": "Log",
    "Fehlersuche": "Debugging",
    "Benutzeroberfläche": "User Interface",
    "Backend": "Backend",
    "Frontend": "Frontend",
  };

  var random = Random();
  int points = 0;
  List<String> fragen = words.keys.toList(); //Liste deutsche wörter
  fragen.shuffle(); //mischen

  for (int i = 0; i < 5; i++) {
    //für 5 fragen quiz
    String frage = fragen[i]; //Frage wählen
    String richtigeAntwort = words[frage]!; //Antwort wählen

    // Antwortenliste vorbereiten
    List<String> antworten = [richtigeAntwort];
    while (antworten.length < 4) {
      String zufall = words.values.elementAt(random.nextInt(words.length));
      if (!antworten.contains(zufall)) {
        antworten.add(zufall);
      }
    }
    antworten.shuffle(); //mischen

    print("\nFrage ${i + 1}: Was ist '$frage' auf Englisch?");
    for (int j = 0; j < antworten.length; j++) {
      print("${j + 1}. ${antworten[j]}");
    }

    int auswahl = 0;
    while (auswahl < 1 || auswahl > 4) {
      stdout.write("Deine Antwort (1-4): ");
      String? eingabe = stdin.readLineSync();
      auswahl = int.tryParse(eingabe ?? "") ?? 0;

      if (auswahl < 1 || auswahl > 4) {
        print("Bitte gib eine Zahl zwischen 1 und 4 ein.");
      }
    }

    if (antworten[auswahl - 1] == richtigeAntwort) {
      print("Richtig!");
      points++;
    } else {
      print("Falsch. Die richtige Antwort war: $richtigeAntwort");
    }
  }

  // Ergebniss
  print("\nQuiz beendet. Du hast $points von 5 Punkten erreicht.");
}
