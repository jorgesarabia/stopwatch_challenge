# Stopwatch

## Description

Stopwatch is an application for measuring time. It allows users to time events and record laps. 
It highlights the best time and the worst time when more than two laps are recorded. Additionally, it saves a history of measurements in the device's storage.

## Installation

To install the application, follow these steps:

1. Clone the project from the repository.
2. Run `flutter pub get` to fetch the dependencies.
3. Run the application using `flutter run`.

## Usage

Upon opening the application, the stopwatch will be at zero. The available buttons are "Start" to begin the stopwatch and "Lap" to record laps. Once the stopwatch is started, the "Start" button changes to "Stop" and the "Lap" button becomes active. Pressing "Lap" will record the current lap and display it in a table.

When the stopwatch is stopped, the "Stop" button changes to "Resume" and the "Lap" button changes to "Reset". 
Pressing "Resume" will continue the stopwatch from where it was stopped. Pressing "Reset" will reset the stopwatch and clear all recorded laps, while saving the history to the device's storage.

## Main Features

- Stopwatch for measuring time.
- Highlights the best lap in green and the worst lap in red.
- Saves a history of measurements in the device's storage.

## License

This project is licensed under the [MIT License](LICENSE).
