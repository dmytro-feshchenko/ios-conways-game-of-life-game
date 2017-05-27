# Simple implementation Conways Game of Life for iOS devices.
## The core principle of the game:
The game contains 2D board with square sections on it.  
Each section can be filled (with creatures) or empty.  
Before the game starts user have to mark all sections with population.  
Generation of next stage will be processed with the next rules:
* Each cell with one or no neighbors dies, as if by solitude
* Each cell with four or more neighbors dies, as if by overpopulation
* Each cell with two or three neighbors survives
* Each empty cell with three neighbors becomes populated
You can read more about this game in the article (1970 year):  
http://ddi.cs.uni-potsdam.de/HyFISCH/Produzieren/lis_projekt/proj_gamelife/ConwayScientificAmerican.htm
## Modifications:
* You can change probabilities for cells to die or to survive using Settings panel from the game
## How it works:
![General UI](./samples/general.png?raw=true "General UI with creatures board")
![Populations](./samples/population.png?raw=true "Created populations")
![Generations](./samples/generation.png?raw=true "Generations processing")
![Game over](./samples/end.png?raw=true "Population died")
