library(httr)
library(jsonlite)
library(dplyr)
library(tidytext)
library(ggplot2)

# Function to fetch comments
fetch_comments <- function(video_url, api_key) {
  # Extract video ID from the URL
  video_id <- sub(".*(?:v=|be/)([a-zA-Z0-9_-]{11}).*", "\\1", video_url)
  url <- paste0("https://www.googleapis.com/youtube/v3/commentThreads",
                "?part=snippet",
                "&videoId=", video_id,
                "&maxResults=100",
                "&textFormat=plainText",
                "&key=", api_key)
  
  comments <- c()
  next_page_token <- ""
  
  while (!is.null(next_page_token)) {
    res <- GET(url)
    response <- content(res, as = "parsed", type = "application/json")
    
    comments <- c(comments, sapply(response$items, function(x) x$snippet$topLevelComment$snippet$textDisplay))
    
    next_page_token <- response$nextPageToken
    if (!is.null(next_page_token)) {
      url <- paste0(url, "&pageToken=", next_page_token)
    }
  }
  
  return(comments)
}

# Function to analyze sentiments using Bing Lexicon
analyze_sentiments <- function(comments) {
  # Load Bing Lexicon
  bing_lexicon <- get_sentiments("bing")
  
  # Tokenize comments and join with the Bing lexicon
  comment_sentiments <- data.frame(Comment = comments) %>%
    unnest_tokens(word, Comment) %>%
    inner_join(bing_lexicon, by = "word") %>%
    count(sentiment, sort = TRUE) %>%
    mutate(percentage = n / sum(n) * 100)
  
  return(comment_sentiments)
}

# Function to plot sentiments
plot_sentiments <- function(sentiments_df) {
  ggplot(sentiments_df, aes(x = "", y = percentage, fill = sentiment)) +
    geom_bar(stat = "identity", width = 1, color = "white") +
    coord_polar("y", start = 0) +
    theme_void() +
    scale_fill_manual(values = c("positive" = "green", "negative" = "red")) +
    labs(title = "Sentiment Analysis of YouTube Comments", fill = "Sentiment")
}

# Main Script
api_key <-  "AIzaSyBy9J3QjoZ5EVyeE68isDPzSTQQ6RVkMZw"
video_url <- "https://youtu.be/KvN3JXICzdM?si=EjbunUf-_yf8wj-D"

comments <- fetch_comments(video_url, api_key)
sentiments_df <- analyze_sentiments(comments)

# Plot the circular graph
plot_sentiments(sentiments_df)