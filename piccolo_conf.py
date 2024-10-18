from piccolo.engine.postgres import PostgresEngine

DB = PostgresEngine(
    config={
        "database": "postgres",
        "user": "postgres",
        "password": "postgres",
        "host": "localhost",
        "port": 5432,
    }
)
