from piccolo import columns as col
from piccolo.table import Table


class Foo(Table):
    meta = col.JSONB()
