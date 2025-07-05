# YouTube Comments Sentiment Analysis 
_Analyze sentiment in YouTube video comments using R_

![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/Language-R-blue)
![NLP](https://img.shields.io/badge/Sentiment-Analysis-orange)

---

## 📌 Overview

This project performs **sentiment analysis** on comments retrieved from a YouTube video using **R programming** and **YouTube Data API v3**. It fetches comments based on a video ID, cleans and processes the text, and classifies them as **positive** or **negative** using lexicon-based sentiment scoring.

Ideal for:
- 🎥 YouTubers or marketers analyzing viewer response  
- 📈 Researchers studying social sentiment trends  
- 🧠 Students exploring real-world NLP using R  

---

## ✨ Features

- 🔑 Fetch comments using **YouTube Data API**  
- 🧹 Text preprocessing (tokenization, stopwords removal, etc.)  
- 📊 Lexicon-based sentiment classification  
- 📈 Sentiment summary with visualizations (bar plot, pie chart, word cloud)  
- 📁 Option to export results to CSV

---

## 🛠️ Tech Stack

| Component         | Technology               |
|-------------------|--------------------------|
| Language          | R                        |
| Text Mining       | tidytext, tm  
| API Integration   | youtube comments API  |
| Visualization     | ggplot2, wordcloud  |
| Data Wrangling    | dplyr, tidyr  |

---

## 🚀 Getting Started

### Get Your API Key

- Go to [Google Cloud Console](https://console.cloud.google.com/)
- Enable **YouTube Data API v3**
- Generate an **API Key**
- Update the following line with your API key and video ID:
  ```bash
  api_key <- "YOUR_YOUTUBE_API_KEY"
  video_id <- "YOUR_VIDEO_ID"
  ```



