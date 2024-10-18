from piccolo.table import create_db_tables_sync

from piccolobug.models import Foo


def main():
    # Create the table
    create_db_tables_sync(Foo, if_not_exists=True)

    # Create a new objects
    Foo(meta={"a": True, "b": True}).save().run_sync()
    Foo(meta={"a": True, "b": False}).save().run_sync()
    Foo(meta={"a": False, "b": True}).save().run_sync()
    Foo(meta={"a": False, "b": False}).save().run_sync()

    # Query the table
    faulty_results = Foo.select().where(Foo.meta.arrow("a") != Foo.meta.arrow("b")).run_sync()
    for row in faulty_results:
        print(row)

if __name__ == "__main__":
    main()
