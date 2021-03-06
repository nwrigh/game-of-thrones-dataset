
CREATE INDEX ON :Family(name)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/family_houses.csv" AS line
MERGE (family:Family { ID: line.instance_of})ON CREATE SET family.name = line.instance_ofLabel

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.family IS NULL
MERGE (family:Family { ID: line.family})ON CREATE SET family.name = line.familyLabel
MERGE (main)-[:MEMBER_OF]->(family)

