#!/bin/bash

set -euo pipefail  # Enable strict error handling

# Load environment variables from .env file if it exists
if [[ -f ".env" ]]; then
  set -a
  source .env
  set +a
fi

# Constants
readonly REFRESH_INTERVAL=60
readonly DEFAULT_CITY="London"
readonly NEWS_LIMIT=3

# Color constants
readonly COLOR_RESET="\033[0m"
readonly COLOR_BOLD_BLUE="\033[1;34m"
readonly COLOR_BOLD_GREEN="\033[1;32m"
readonly COLOR_BOLD_CYAN="\033[1;36m"
readonly COLOR_BOLD_PURPLE="\033[1;35m"
readonly COLOR_BOLD_WHITE="\033[1;37m"
readonly COLOR_BOLD_YELLOW="\033[1;33m"
readonly COLOR_BOLD_RED="\033[1;31m"

# Load API keys from a dot file
load_api_keys() {
  if [[ ! -f ".env" ]]; then
    echo "🔑 API keys file not found. Please create a '.env' file with your API keys."
    exit 1
  fi

  OPENWEATHER_API_KEY=$(grep -o 'OPENWEATHER_API_KEY=.*' .env | cut -d '=' -f 2)
  MEDIASTACK_API_KEY=$(grep -o 'MEDIASTACK_API_KEY=.*' .env | cut -d '=' -f 2)

  if [[ -z "$OPENWEATHER_API_KEY" || -z "$MEDIASTACK_API_KEY" ]]; then
    echo "❌ Missing API keys in '.env'. Ensure both OPENWEATHER_API_KEY and MEDIASTACK_API_KEY are defined."
    exit 1
  fi
}

# Error handling function
handle_error() {
  local error_message="$1"
  echo "⚠️ Error: $error_message" >&2
  exit 1
}

# Fetch weather data for a given city
get_weather() {
  local city="${1:-$DEFAULT_CITY}"
  local url="https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${OPENWEATHER_API_KEY}&units=metric"

  local response
  response=$(curl -s --fail "$url" 2>&1) || handle_error "Failed to fetch weather data: $(echo -e "$response")"

  if jq -e . >/dev/null <<<"$response"; then
    local weather
    weather=$(echo "$response" | jq -r '.weather[0].description' | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
    local temp
    temp=$(echo "$response" | jq -r '.main.temp')
    echo -e "🌤️  Weather: ${COLOR_BOLD_BLUE}$weather${COLOR_RESET}, Temp: ${COLOR_BOLD_YELLOW}${temp}°C${COLOR_RESET}"
  else
    handle_error "Invalid weather data format"
  fi
}

# Fetch top news headlines using Mediastack API
get_news() {
  local url="http://api.mediastack.com/v1/news?access_key=${MEDIASTACK_API_KEY}&countries=gb&limit=${NEWS_LIMIT}"

  local response
  response=$(curl -s --fail "$url" 2>&1) || handle_error "Failed to fetch news data: $(echo -e "$response")"

  if jq -e . >/dev/null <<<"$response"; then
    local articles
    articles=$(echo "$response" | jq -r '.data[]? | "📰 \(.title)"')
    if [[ -n "$articles" ]]; then
      echo -e "${COLOR_BOLD_GREEN}$articles${COLOR_RESET}"
    else
      handle_error "No news articles available"
    fi
  else
    handle_error "Invalid news data format"
  fi
}

# Fetch a random quote from Zen Quotes API
get_quote() {
  local url="https://zenquotes.io/api/random"

  local response
  response=$(curl -s --fail "$url" 2>&1) || handle_error "Failed to fetch quote data: $(echo -e "$response")"

  if jq -e . >/dev/null <<<"$response"; then
    local quote
    quote=$(echo "$response" | jq -r '.[0].q')
    local author
    author=$(echo "$response" | jq -r '.[0].a')

    if [[ -n "$quote" && -n "$author" ]]; then
      echo -e "💡 \"${COLOR_BOLD_CYAN}$quote${COLOR_RESET}\" - ${COLOR_BOLD_PURPLE}$author${COLOR_RESET}"
    else
      handle_error "Invalid quote data format"
    fi
  else
    handle_error "Invalid quote data format"
  fi
}

# Cleanup function for proper exit
cleanup() {
  echo -e "\n${COLOR_BOLD_WHITE}Thank you for using the London Mini News Portal!${COLOR_RESET}"
  exit 0
}

# Display header
display_header() {
  clear
  echo -e "${COLOR_BOLD_WHITE}${COLOR_BOLD_BLUE} London Mini News Portal ${COLOR_RESET} - $(date)"
  echo -e "${COLOR_BOLD_WHITE}========================================${COLOR_RESET}"
}

# Main function to display the portal
main() {
  # Set up trap for cleanup
  trap cleanup SIGINT SIGTERM

  # Load API keys
  load_api_keys

  # Main loop
  while true; do
    display_header

    echo -e "\n${COLOR_BOLD_RED}[ Weather ]${COLOR_RESET}"
    get_weather "$DEFAULT_CITY" || true

    echo -e "\n${COLOR_BOLD_RED}[ Top $NEWS_LIMIT News ]${COLOR_RESET}"
    get_news || true

    echo -e "\n${COLOR_BOLD_RED}[ Quote of the Day ]${COLOR_RESET}"
    get_quote || true

    echo -e "\n${COLOR_BOLD_WHITE}========================================${COLOR_RESET}"
    echo -e "${COLOR_BOLD_YELLOW}Press Ctrl+C to exit.${COLOR_RESET}"

    sleep "$REFRESH_INTERVAL"
  done
}

# Execute main function
main