# Subset data into map sizes and response
preprocess <- function(dataset, matchtype) {
  
  # Map sizes; large and small 
  large_map <- dataset$matchDuration >= 1600
  small_map <- dataset$matchDuration < 1600
  
  matchtype_subset <- dataset[which(dataset$matchType==matchtype),]
  
  # Omit data fields that will not be used in our analysis
  subset <- omit_data_fields(matchtype_subset, matchtype)
  
  # Subset data by their map sizes
  large_map_dataset <- subset[which(large_map) , ]
  small_map_dataset <- subset[which(small_map) , ]
  
  # Obtain response from the each map
  large_map_response <- response(matchtype_subset)
  small_map_response <- response(dataset, matchtype, small_map)
  
  data_out <- list(first=large_map_dataset, second=small_map_dataset, third=large_map_response, fourth=small_map_response)
  
  return(data_out)
}