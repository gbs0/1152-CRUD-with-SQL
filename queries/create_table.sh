echo "CREATE TABLE `doctors`(
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT,
  `age` INTEGER,
  `specialty` TEXT
);" | sqlite3 doctors.db