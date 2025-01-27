# London Mini News Portal

The London Mini News Portal is a command-line tool that provides real-time weather, top news headlines, and a daily inspirational quote. It fetches weather data from OpenWeather, news from the Mediastack API, and quotes from ZenQuotes API. The portal updates every 60 seconds, ensuring you have the latest information at your fingertips.

## Features:
- **Weather Information**: Displays current weather conditions and temperature for a specified city (default is London).
- **Top News Headlines**: Fetches the latest news headlines from the UK (can be customized).
- **Quote of the Day**: Displays a random inspirational quote from ZenQuotes API.
- **Customization**: Set your city of interest and change the refresh interval.

## Requirements:
- `curl`: To make HTTP requests.
- `jq`: For parsing JSON responses.
- A `.env` file containing your API keys.

## Setup:

### 1. Clone the repository
```bash
git clone <repository-url>
cd <project-folder>
```

### 2. Create a `.env` file
Create a `.env` file in the root directory of the project and add your API keys:

```bash
OPENWEATHER_API_KEY=your_openweather_api_key
MEDIASTACK_API_KEY=your_mediastack_api_key
```

You can get your API keys from the following:
- [OpenWeather](https://openweathermap.org/api)
- [Mediastack](https://mediastack.com/)

### 3. Run the script
To start the portal, simply run:

```bash
bash london_news_portal.sh
```

The portal will run indefinitely, fetching weather, news, and a quote every minute.

### 4. Customize:
- **City**: To get weather updates for a different city, modify the `DEFAULT_CITY` variable in the script.
- **Refresh Interval**: Adjust the frequency of updates by changing the `REFRESH_INTERVAL` value (in seconds).
- **News Limit**: Control how many news articles to display by modifying the `NEWS_LIMIT` value.

## Error Handling:
If the `.env` file is missing or the API keys are invalid, the script will display an error and exit. Make sure to verify your keys are correct.

## License:
MIT License. See LICENSE for more details.
```

This should work well in any markdown-compatible viewer or editor! Let me know if you need any adjustments.
