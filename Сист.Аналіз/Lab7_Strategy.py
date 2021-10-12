import pymysql.cursors
import sys
import types

def connect():
    connection = pymysql.connect(
        host = "localhost",
        user = "root",
        password = "911102Pavlo320099",
        db = "sa1",
        charset = "utf8mb4",
        cursorclass=pymysql.cursors.DictCursor
        )
    print("connected successfully!!!")
    return connection

connection = connect()


with connection.cursor() as cursor:
    # SQL
    sql = "SELECT * FROM log_book "

    cursor.execute(sql)


if sys.version_info[0] > 2:
    create_bound_method = types.MethodType
else:
    def create_bound_method(func, obj):
        return types.MethodType(func, obj, obj.__class__)

class StrategyExample:
    def __init__(self, func=None):
        self.name = "Strategy Default"
        if func:
             self.execute = create_bound_method(func, self)

    def execute(self):
        print(self.name)
        print()


def executeReplacement1(self):
    print(self.name + " з випадку 1")
    with connection.cursor() as cursor:

            # SQL
            sql = "SELECT * FROM goods_handbook "

            cursor.execute(sql)
            records = cursor.fetchmany(2)

            print()
            print("Total number of rows - ", cursor.rowcount)

            for row in records:
                print(row["Goods_Name"], row["Unit"])

def executeReplacement2(self):
    print(self.name + " з випадку 2")
    with connection.cursor() as cursor:

            # SQL
            sql = "SELECT * FROM log_book"

            cursor.execute(sql)
            records = cursor.fetchmany(2)

            print()
            print("Total number of rows - ", cursor.rowcount)

            for row in cursor:
                print(row["Date"], row["Operation"])


if __name__ == "__main__":
    strat0 = StrategyExample()
    strat1 = StrategyExample(executeReplacement1)
    strat1.name = "Виведення тільки назв продуктів і вимірювальних величин"
    strat2 = StrategyExample(executeReplacement2)
    strat2.name = "Виведення тільки операції відносно дати"

    strat0.execute()
    strat1.execute()
    strat2.execute()
    connection.close()

