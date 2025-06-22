import 'dart:io'; // Für Benutzereingaben und Ausgaben
import 'dart:math'; // Für Zufallszahlen

void main() {
  print("Willkommen beim Vokabel-Quiz!");

  // Wörterbuch: Deutsche Begriffe als Schlüssel, englische Begriffe als Werte
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

  var random = Random(); // Zufallszahl-Generator
  int points = 0; // Richtige Antworten zählen
  int joker = 1; // Anzahl Joker (50:50) am Anfang
  List<String> fragen = words.keys.toList(); // Liste mit den deutschen Wörtern
  fragen.shuffle(); // Fragen mischen

  // 5 Fragen werden gestellt
  for (int i = 0; i < 5; i++) {
    String frage = fragen[i]; // Aktuelle Frage (deutsches Wort)
    String richtigeAntwort = words[frage]!; // Richtige englische Übersetzung

    // Liste mit Antwortmöglichkeiten vorbereiten
    List<String> antworten = [richtigeAntwort];
    while (antworten.length < 4) {
      String zufall = words.values.elementAt(random.nextInt(words.length));
      if (!antworten.contains(zufall)) {
        antworten.add(zufall); // Weitere zufällige (falsche) Antworten
      }
    }
    antworten.shuffle(); // Antworten mischen

    // Frage ausgeben
    print("\nFrage ${i + 1}: Was ist '$frage' auf Englisch?");
    for (int j = 0; j < antworten.length; j++) {
      print("${j + 1}. ${antworten[j]}");
    }

    // Joker-Hinweis anzeigen
    if (joker > 0) {
      print(
        "Du hast noch $joker Joker (50:50). Tippe 'j' oder 'J', um einen zu nutzen.",
      );
    }

    int auswahl = 0; // Vom Benutzer gewählte Antwort
    bool jokerGenutzt =
        false; // Damit ein Joker nur einmal pro Frage benutzt wird
    List<String> aktuelleAntworten = List.from(
      antworten,
    ); // Antworten, evtl. reduziert bei Joker

    // Benutzereingabe abfragen
    while (true) {
      stdout.write(
        "Deine Antwort (1-${aktuelleAntworten.length}${joker > 0 ? " oder j/J" : ""}): ",
      );
      String? eingabe = stdin.readLineSync();

      // Joker verwenden
      if ((eingabe == 'j' || eingabe == 'J') && joker > 0 && !jokerGenutzt) {
        joker--;
        jokerGenutzt = true;

        // Zwei falsche Antworten entfernen
        List<String> falscheAntworten = aktuelleAntworten
            .where((a) => a != richtigeAntwort)
            .toList();
        falscheAntworten.shuffle();
        falscheAntworten = falscheAntworten.sublist(
          0,
          falscheAntworten.length - 2,
        );

        aktuelleAntworten = [richtigeAntwort];
        for (var a in antworten) {
          if (a != richtigeAntwort && !falscheAntworten.contains(a)) {
            aktuelleAntworten.add(a); // Eine falsche Antwort bleibt erhalten
            break;
          }
        }

        aktuelleAntworten.shuffle();

        // Neue Antwortmöglichkeiten zeigen (nur 2)
        print("50:50 Joker aktiviert! Zwei falsche Antworten entfernt:");
        for (int j = 0; j < aktuelleAntworten.length; j++) {
          print("${j + 1}. ${aktuelleAntworten[j]}");
        }
        continue; // Benutzer muss jetzt nochmal antworten
      }

      // Auswahl prüfen
      auswahl = int.tryParse(eingabe ?? "") ?? 0;
      if (auswahl < 1 || auswahl > aktuelleAntworten.length) {
        print("Bitte gib eine gültige Zahl ein.");
      } else {
        break;
      }
    }

    // Antwort bewerten
    if (aktuelleAntworten[auswahl - 1] == richtigeAntwort) {
      print("Richtig!");
      points++;
    } else {
      print("Falsch. Die richtige Antwort war: $richtigeAntwort");
    }

    // Trennlinie für bessere Übersicht
    print("\n------------------------------\n");
  }

  // Ergebnis anzeigen
  print("\nQuiz beendet. Du hast $points von 5 Punkten erreicht.");
}
