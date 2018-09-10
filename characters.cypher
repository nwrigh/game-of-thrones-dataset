CREATE INDEX ON :Person(name)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MERGE (main:Person { ID: line.Game_of_Thrones_character}) SET main={ID: line.Game_of_Thrones_character, name: line.Game_of_Thrones_characterLabel, Gender: line.sex_or_genderLabel, language: line.native_languageLabel}

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.mother IS NULL
MERGE (mother:Person { ID: line.mother, name: line.motherLabel}) ON CREATE SET mother.name = line.motherLabel
MERGE (main)-[:HAS_MOTHER]->(mother)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.father IS NULL
MERGE (father:Person { ID: line.father, name: line.fatherLabel}) ON CREATE SET father.name = line.fatherLabel
MERGE (main)-[:HAS_FATHER]->(father)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.spouse IS NULL
MERGE (spouse:Person { ID: line.spouse}) ON CREATE SET spouse.name = line.spouseLabel
MERGE (main)-[:MARRIED_TO]->(spouse)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.sibling IS NULL
MERGE (sibling:Person { ID: line.sibling})ON CREATE SET sibling.name = line.siblingLabel
MERGE (main)-[:HAS_SIBLING]->(sibling)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.partner IS NULL
MERGE (partner:Person { ID: line.partner})ON CREATE SET partner.name = line.partnerLabel
MERGE (main)-[:HAS_ALLEGIANCE_WITH]->(partner)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/nwrigh/game-of-thrones-dataset/master/game_of_thrones_characters.csv" AS line
MATCH (main:Person { ID: line.Game_of_Thrones_character}) WHERE NOT line.killed_by IS NULL
MERGE (killed:Person { ID: line.killed_by}) ON CREATE SET killed.name = line.killed_byLabel
MERGE (main)-[:KILLED_BY]->(killed)
