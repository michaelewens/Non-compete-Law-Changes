###################

# Assign non-compete status by state-year.

# Code assumes that the user's state-level data is already loaded. 

# Usage:
#  source("createCNCvariables.R")
#  'data' has field "state" and "year".  State is a string, not a factor. 
#	  data2 <- updateLawChange(data, "state", "year")
# data2 now has two new fields `cncChange' and `note_LawChange`


# Result: Creates 

#  `cncChange` = {-1,1} for the direction of the change in the law
# -1 --> weak
# 1 --> strong
# `note_LawChange' = Short desc. if debate or differ from Ewens and Marx

# as new variables in your data frame.

# Citation: Ewens, Michael, and Matt Marx. "Founder replacement and startup performance." The Review of Financial Studies 31.4 (2017): 1532-1565.

# Help from Jun Chen: jun.chen@ruc.edu.cn
# Contact: Michael Ewens, michael.ewens@gmail.com

# Last update: 11/13/2018

# Github: https://github.com/michaelewens/noncompete_law


# *************
# * BEGIN FUNCTION
updateLawChange <- function(data, stateVariable, yearVariable) {
  
  data$cncChange <- NA
  data$note_LawChange <- ""
  
  # AL
  data$cncChange[data[[stateVariable]] == "AL" & data[[yearVariable]] == 2016]  <-   1
  # Colorado
  data$cncChange[data[[stateVariable]] == "CO" & data[[yearVariable]] == 2011]  <-   1
  # FLorida
  data$cncChange[data[[stateVariable]] == "FL" & data[[yearVariable]] == 1996]  <-   1
  # Georgia
  data$cncChange[data[[stateVariable]] == "GA" & data[[yearVariable]] == 2010]  <-   1
  # Idaho
  data$cncChange[data[[stateVariable]] == "ID" & data[[yearVariable]] == 2008]  <-   1
  # Illinois
  data$cncChange[data[[stateVariable]] == "IL" & data[[yearVariable]] == 2011]  <-   1
  # Kentucky
  data$cncChange[data[[stateVariable]] == "KY" & data[[yearVariable]] == 2011]  <-   -1
  # Lousiana
  data$cncChange[data[[stateVariable]] == "LA" & data[[yearVariable]] == 2002]  <-   -1
  # NH
  data$cncChange[data[[stateVariable]] == "NH" & data[[yearVariable]] == 2011]  <-   -1
  # OH
  data$cncChange[data[[stateVariable]] == "OH" & data[[yearVariable]] == 2004]  <-   1
  # OR
  data$cncChange[data[[stateVariable]] == "OR" & data[[yearVariable]] == 2008]  <-   -1
  # SC
  data$cncChange[data[[stateVariable]] == "SC" & data[[yearVariable]] == 2010]  <-   -1
  # TX
  data$cncChange[data[[stateVariable]] == "TX" & data[[yearVariable]] == 2012]  <-   1
  # VT
  data$cncChange[data[[stateVariable]] == "VT" & data[[yearVariable]] == 2005]  <-   1
  # WI
  data$cncChange[data[[stateVariable]] == "WI" & data[[yearVariable]] == 2009]  <-   1
  
  
  # *----------------------------*
  # * The following law changes were not used in Ewens and Marx for reasons specific to that research design.
  
  # * Arkansas
  data$cncChange[data[[stateVariable]] == "AR" & data[[yearVariable]] == 2016]  <-   1
  data$note_LawChange[data[[stateVariable]] == "AR" & data[[yearVariable]] == 2016]  <-   "Not used in Ewens and Marx (2017)"
  #* From Ewens and Marx: "[...] Hawaii’s 2015 reform, which banned non-compete agreements in the IT industry, was explicitly taken up in order to foster entrepreneurial activity."
  
  # * Hawaii
  data$cncChange[data[[stateVariable]] == "HI" & data[[yearVariable]] == 2015]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "HI" & data[[yearVariable]] == 2015]  <-   "From Ewens and Marx: '[...] Hawaii's 2015 reform, which banned non-compete agreements in the IT industry, was explicitly taken up in order to foster entrepreneurial activity.'"
  
  # Michigan
  data$cncChange[data[[stateVariable]] == "MI" & data[[yearVariable]] == 1985]  <-   1
  data$note_LawChange[data[[stateVariable]] == "MI" & data[[yearVariable]] == 1985]  <-   "Not used in Ewens and Marx (2017)"
  
  # MA
  data$cncChange[data[[stateVariable]] == "MA" & data[[yearVariable]] == 2018]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "MA" & data[[yearVariable]] == 2018]  <-   "Not used in Ewens and Marx (2017)"
  
  # Montana
  data$cncChange[data[[stateVariable]] == "MT" & data[[yearVariable]] == 2009]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "MT" & data[[yearVariable]] == 2009]  <-   "Not used in Ewens and Marx (2017)"
  
  # From Ewens and Marx: "New York and New Mexico also weakened enforceability of non-compete agreements during our sample. The New York reform was specific to workers in the broadcasting industry which is not highly relevant to venture capital activity. Similarly, the reform in New Mexico was specific to physicians. Neither is included in our analysis."
  
  # NY
  data$cncChange[data[[stateVariable]] == "NY" & data[[yearVariable]] == 1994]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "NY" & data[[yearVariable]] == 1994]  <-   "The New York reform was specific to workers in the broadcasting industry which is not highly relevant to venture capital activity.  Not used in Ewens and Marx (2017)"
  
  # Rhode Island (Only medical)
  data$cncChange[data[[stateVariable]] == "RI" & data[[yearVariable]] == 2016]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "RI" & data[[yearVariable]] == 2016]  <-   "Only impacted the medical industry. Not used in Ewens and Marx (2017)"
  
  # New Hampshire (Medical)
  data$cncChange[data[[stateVariable]] == "NH" & data[[yearVariable]] == 2016]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "NH" & data[[yearVariable]] == 2016]  <-   "Only impacted the medical industry. Not used in Ewens and Marx (2017)"
  
  # Nevada
  data$cncChange[data[[stateVariable]] == "NV" & data[[yearVariable]] == 2016]  <-   1
  data$note_LawChange[data[[stateVariable]] == "NV" & data[[yearVariable]] == 2016]  <-   "Not used in Ewens and Marx (2017)"
  
  # Idaho "ID 2016 is hard to classify. On the one hand, NDs are limited to 18 months; on the other hand, they are presumptively enforceable for executives."
  
  # CT (Medical)
  data$cncChange[data[[stateVariable]] == "CT" & data[[yearVariable]] == 2016]  <-   1
  data$note_LawChange[data[[stateVariable]] == "NV" & data[[yearVariable]] == 2016]  <-   "Only medical.  Not used in Ewens and Marx (2017)"
  
  # Wisconsin
  data$cncChange[data[[stateVariable]] == "WI" & data[[yearVariable]] == 2015]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "WI" & data[[yearVariable]] == 2015]  <-   "Not used in Ewens and Marx (2017)"
  
  # Utah
  data$cncChange[data[[stateVariable]] == "UT" & data[[yearVariable]] == 2016]  <-   -1
  data$note_LawChange[data[[stateVariable]] == "UT" & data[[yearVariable]] == 2016]  <-   "Not used in Ewens and Marx (2017)"

  data
}

# **** END
#	****************************
