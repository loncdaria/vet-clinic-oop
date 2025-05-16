# System Obsługi Kliniki Weterynaryjnej

System mający na celu usprawnienie zarządzania danymi w klinice weterynaryjnej. Umożliwia m.in. rejestrację klientów i ich zwierząt, zarządzanie wizytami, usługami, receptami oraz generowanie rachunków.

## Zawartość repozytorium

- `Klinika_database.accdb` – baza danych MS Access z formularzami obsługującymi system.
- `Model_logiczny.SQL` – skrypt SQL do utworzenia struktury bazy danych w systemie MS SQL Server.
- `Model_logiczny.vsd` – wizualizacja modelu logicznego w formacie Visio.
- `Projekt_SQL_dokumentacja.pdf` – pełna dokumentacja projektu zawierająca opis systemu, modele, formularze oraz funkcjonalności.

## Cel systemu

Celem projektu jest ułatwienie pracy pracownikom biurowym kliniki weterynaryjnej poprzez cyfryzację i automatyzację:

- rejestracji klientów i ich zwierząt,
- tworzenia oraz obsługi wizyt i usług,
- wystawiania rachunków i recept.

## Funkcjonalności

- Rejestracja klientów oraz przypisywanie im zwierząt.
- Zarządzanie katalogiem weterynarzy, asystentów oraz usług.
- Obsługa wizyt (termin, gabinet, choroba, przypisani lekarze, wykonane usługi).
- Automatyczne generowanie recept oraz powiązanych rachunków.
- Interaktywne formularze MS Access do przeglądania, edycji, dodawania i usuwania danych.
- Raport gotowy do wydruku z zestawieniem transakcji.

## Struktura bazy danych

Baza danych zawiera tabele takie jak:

- `Klienci` – dane kontaktowe właścicieli zwierząt,
- `Zwierzeta` – szczegóły dotyczące zwierząt,
- `Weterynarze`, `Asystenci` – personel medyczny,
- `Wizyty` – rejestr wizyt,
- `Uslugi`, `Uslugi_w_wizycie` – lista usług,
- `Recepty`, `Rachunki` – obsługa recept i płatności.

Tabele są powiązane kluczami obcymi zgodnie z regułami integralności referencyjnej.

## Wymagania systemowe

- Microsoft Access (do pracy z `.accdb`)
- Microsoft SQL Server (do uruchomienia skryptu SQL)
- Microsoft Visio (do otwarcia modelu logicznego `.vsd`)

## Uruchomienie projektu

1. Uruchom `Klinika_database.accdb` w MS Access.
2. Zaimportuj strukturę bazy danych z `Model_logiczny.SQL` w środowisku MS SQL Server.
3. Przeglądaj i testuj formularze dostępne w aplikacji Access.
4. Sprawdź dokumentację PDF (`Projekt_SQL_dokumentacja.pdf`) dla pełnego opisu funkcji i struktury.


