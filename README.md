
# News Portal CLI

![Bash](https://img.shields.io/badge/Language-Bash-green)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![License](https://img.shields.io/badge/License-MIT-orange)

**News Portal CLI** is a command-line application that provides real-time weather updates, top news headlines, and a daily quote. It is written in Bash and uses external APIs to fetch data.

---

## Features

- **Weather Updates**: Get the current weather for any city (default: London).
- **Top News Headlines**: Fetch the latest news headlines for the UK.
- **Daily Quote**: Display a random inspirational quote.
- **Customizable**: Configure the city, news limit, and refresh interval.
- **User-Friendly**: Easy-to-use command-line interface with color-coded output.

---

## Installation

### Prerequisites

- **Bash**: The script requires a Unix-like shell (e.g., Linux, macOS).
- **curl**: Used to make HTTP requests to APIs.
- **jq**: Used to parse JSON responses from APIs.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/urbanevac/news-portal-cli.git
   cd news-portal-cli
   ```

2. Make the script executable:
   ```bash
   chmod +x news_portal.sh
   ```

3. Create a `.env` file in the project directory and add your API keys:
   ```bash
   echo "OPENWEATHER_API_KEY=your_openweather_api_key" > .env
   echo "MEDIASTACK_API_KEY=your_mediastack_api_key" >> .env
   ```

4. (Optional) Customize the configuration by editing the `.config` file:
   ```bash
   echo 'CITY="London"' > .config
   echo 'NEWS_LIMIT=3' >> .config
   echo 'REFRESH_INTERVAL=60' >> .config
   ```

---

## Usage

Run the script with optional command-line arguments:

```bash
./news_portal.sh [options]
```

### Options

| Option            | Description                                      | Default Value       |
|-------------------|--------------------------------------------------|---------------------|
| `-c`, `--city`    | Set the city for weather updates                 | `London`            |
| `-n`, `--news-limit` | Set the number of news headlines to display    | `3`                 |
| `-r`, `--refresh` | Set the refresh interval in seconds              | `60`                |
| `-h`, `--help`    | Show the help menu and exit                      | N/A                 |
| `-v`, `--version` | Show the app version and exit                    | N/A                 |

### Examples

1. Run with default settings:
   ```bash
   ./news_portal.sh
   ```

2. Set a custom city and news limit:
   ```bash
   ./news_portal.sh --city Paris --news-limit 5
   ```

3. Change the refresh interval to 2 minutes:
   ```bash
   ./news_portal.sh --refresh 120
   ```

4. Display the help menu:
   ```bash
   ./news_portal.sh --help
   ```

5. Display the app version:
   ```bash
   ./news_portal.sh --version
   ```

---

## Configuration

The app uses a hidden `.config` file to store user preferences. You can edit this file directly or override settings using command-line arguments.

### Example `.config` File

```bash
CITY="London"
NEWS_LIMIT=3
REFRESH_INTERVAL=60
```

---

## APIs Used

- **OpenWeatherMap**: For weather data.
- **Mediastack**: For news headlines.
- **Zen Quotes**: For random quotes.

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Submit a pull request.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Thanks to [OpenWeatherMap](https://openweathermap.org/), [Mediastack](https://mediastack.com/), and [Zen Quotes](https://zenquotes.io/) for providing free APIs.
- Inspired by the need for a simple, customizable news and weather CLI tool.

---

## Screenshot

![Screenshot](screenshot.png)

---

Enjoy using **News Portal CLI**! If you have any questions or feedback, feel free to open an issue or contact the maintainers.

```

---

### **How to Use This README**

1. Copy the entire markdown content above into a file named `README.md`.
2. Place the file in the root directory of your project.
3. If you have a screenshot of the app, save it as `screenshot.png` in the same directory and update the `![Screenshot](screenshot.png)` line to point to the correct file.
4. Push the `README.md` file to your GitHub repository.

---

### **Key Features of the README**

1. **Badges**: Displays the language, version, and license of the project.
2. **Features**: Highlights the key functionalities of the app.
3. **Installation**: Provides clear instructions for setting up the project.
4. **Usage**: Explains how to run the app with examples and options.
5. **Configuration**: Describes how to customize the app using the `.config` file.
6. **APIs Used**: Lists the APIs used in the project.
7. **Contributing**: Encourages contributions and provides guidelines.
8. **License**: Specifies the license under which the project is distributed.
9. **Acknowledgments**: Credits the APIs and inspiration behind the project.
10. **Screenshot**: (Optional) Add a screenshot of the app in action.

---

Here’s the complete **README.md** file in a single markdown format, suitable for GitHub:

---

```markdown
# News Portal CLI

![Bash](https://img.shields.io/badge/Language-Bash-green)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![License](https://img.shields.io/badge/License-MIT-orange)

**News Portal CLI** is a command-line application that provides real-time weather updates, top news headlines, and a daily quote. It is written in Bash and uses external APIs to fetch data.

---

## Features

- **Weather Updates**: Get the current weather for any city (default: London).
- **Top News Headlines**: Fetch the latest news headlines for the UK.
- **Daily Quote**: Display a random inspirational quote.
- **Customizable**: Configure the city, news limit, and refresh interval.
- **User-Friendly**: Easy-to-use command-line interface with color-coded output.

---

## Installation

### Prerequisites

- **Bash**: The script requires a Unix-like shell (e.g., Linux, macOS).
- **curl**: Used to make HTTP requests to APIs.
- **jq**: Used to parse JSON responses from APIs.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/news-portal-cli.git
   cd news-portal-cli
   ```

2. Make the script executable:
   ```bash
   chmod +x news_portal.sh
   ```

3. Create a `.env` file in the project directory and add your API keys:
   ```bash
   echo "OPENWEATHER_API_KEY=your_openweather_api_key" > .env
   echo "MEDIASTACK_API_KEY=your_mediastack_api_key" >> .env
   ```

4. (Optional) Customize the configuration by editing the `.config` file:
   ```bash
   echo 'CITY="London"' > .config
   echo 'NEWS_LIMIT=3' >> .config
   echo 'REFRESH_INTERVAL=60' >> .config
   ```

---

## Usage

Run the script with optional command-line arguments:

```bash
./news_portal.sh [options]
```

### Options

| Option            | Description                                      | Default Value       |
|-------------------|--------------------------------------------------|---------------------|
| `-c`, `--city`    | Set the city for weather updates                 | `London`            |
| `-n`, `--news-limit` | Set the number of news headlines to display    | `3`                 |
| `-r`, `--refresh` | Set the refresh interval in seconds              | `60`                |
| `-h`, `--help`    | Show the help menu and exit                      | N/A                 |
| `-v`, `--version` | Show the app version and exit                    | N/A                 |

### Examples

1. Run with default settings:
   ```bash
   ./news_portal.sh
   ```

2. Set a custom city and news limit:
   ```bash
   ./news_portal.sh --city Paris --news-limit 5
   ```

3. Change the refresh interval to 2 minutes:
   ```bash
   ./news_portal.sh --refresh 120
   ```

4. Display the help menu:
   ```bash
   ./news_portal.sh --help
   ```

5. Display the app version:
   ```bash
   ./news_portal.sh --version
   ```

---

## Configuration

The app uses a hidden `.config` file to store user preferences. You can edit this file directly or override settings using command-line arguments.

### Example `.config` File

```bash
CITY="London"
NEWS_LIMIT=3
REFRESH_INTERVAL=60
```

---

## APIs Used

- **OpenWeatherMap**: For weather data.
- **Mediastack**: For news headlines.
- **Zen Quotes**: For random quotes.

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Submit a pull request.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Thanks to [OpenWeatherMap](https://openweathermap.org/), [Mediastack](https://mediastack.com/), and [Zen Quotes](https://zenquotes.io/) for providing free APIs.
- Inspired by the need for a simple, customizable news and weather CLI tool.

---

## Screenshot

![Screenshot](screenshot.png)

---

Enjoy using **News Portal CLI**! If you have any questions or feedback, feel free to open an issue or contact the maintainers.

```

