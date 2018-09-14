# Game of thrones dataset
As part of <this> presentation for a meetup in Sofia on the 20th Sept I created a sample knowledge graph in Neo4J and this was the dataset I used.

# How to recreate the graph

1. Either run Neo4J locally or with docker: 
  `docker run --publish=7474:7474 --publish=7687:7687 --volume=$HOME/neo4j/data:/data --volume=$HOME/neo4j/logs:/logs neo4j:3.0`
2. In a browser bring up `http://localhost:7474/`. This brings up the Neo4J query interface.
3. Set a password on the Neo4J instance if it is the first time you have run it
3. Use the cypher queries in the the two cypher files (family_houses.cypher & characters.cypher) in query interface.

# How to extend the dataset
I have included the sparql in this repo that I used via the query service of wikidata: [https://query.wikidata.org/]. Query away and then download the data to csv where you can then use the `load csv` cypher command to load your new dataset into your database

Feel free to explore the data more and see what interesting graphs are produced
