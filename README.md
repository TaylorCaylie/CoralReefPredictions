# CoralReefPredictions
Generated Target Treatment Plans for Coral Reefs

## Inspiration 
The Great Barrier Reef is a part of one of the most diverse ecosystems on the planet providing habitats for many species. Due to global warming and climate change, the health of the Reef has greatly depreciated. This application was inspired to address those environmental changes and help combat the loss of our Reef.


## What it does
This application moderates activity of the Great Barrier Reef through the combination of temperature and satellite remote sensing, and infrared gas sensors for mapping Co2 levels, surface area temperatures, and salinity. The s(casp) system will provide a targeted treatment plan for the specified problem areas and mention the species that are likely to be impacted.

## How we built it 
First we plotted out all the necessary rules needed for our logic such as all the endangered species and then also the set thresholds needed for the factors retrieved from data, next we built rules in prolog based off of this information which connected to more rules, ending up in the creation of our diagnostics query at the end which determines whether the temperature, salinity level, and co2 level are correct and gives a recommendation based on it.
