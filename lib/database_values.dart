const databaseUpdates = [update001];

const update001 = [
  """CREATE TABLE IF NOT EXISTS deck
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    title           TEXT    NOT NULL,
    backgroundImage TEXT,
    createdByUser   BOOLEAN NOT NULL,
    playstoreId     TEXT,
    hasBought       BOOLEAN NOT NULL
);""",
  """CREATE TABLE IF NOT EXISTS card
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    deck        INTEGER NOT NULL,
    title       TEXT,
    help        TEXT,
    imagePath   TEXT,
    description TEXT    NOT NULL,
    FOREIGN KEY (deck) REFERENCES deck (id)
);"""
];
