# PDF Download Functionality in Flutter

This Flutter project demonstrates how to create and download a PDF report. The app allows users to generate a simple PDF file and save it to the device's external storage. Additionally, it provides an option to open the generated PDF using a PDF viewer.

## Features

- Generate a PDF report with custom content.
- Save the generated PDF to the external storage of the device.
- Open the PDF using the default PDF viewer on the device.

## Dependencies

This project relies on the following dependencies:

- [`pdf`](https://pub.dev/packages/pdf): To create the PDF document.
- [`path_provider`](https://pub.dev/packages/path_provider): To get the directory for saving the PDF file.
- [`open_file`](https://pub.dev/packages/open_file): To open the generated PDF file.

## Getting Started

### Prerequisites

Ensure you have Flutter installed and set up on your machine. You can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/Maitrey27/PDF_DOWNLOAD.git
    cd pdf-download-flutter
    ```

2. Install the required dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app on your desired device or emulator:
    ```bash
    flutter run
    ```

## Usage

1. Click on the "Download PDF" button in the app's main interface.
2. The app will generate a PDF with predefined content and save it to the device's external storage.
3. After saving, the app will attempt to open the PDF using a PDF viewer installed on the device.
