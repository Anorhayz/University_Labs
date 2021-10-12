import pymysql.cursors

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


class operand1():
    def get_worker():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from log_book"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret

    def get_queue():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from syllables_list"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret

class operand2():
    def get_part():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from goods_handbook"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret


class main():
    def decorator():
        first = operand1.get_worker()
        print("operand 1 is being decorated:")
        print()
        print("idLog \t Date \t Syllables_Name \t Goods_Name \t Operation \t\n")
        for row in first:
            print(row["idLog"], " \t ", row["Date"], " \t\t ", row["Syllables_Name"], " \t ", row["Goods_Name"], " \t ", row["Operation"], " \t")
        print("\n")
        
        second = operand2.get_part()
        print("operand 2 is being decorated:")
        print()
        print("idGoods \t Goods_Name \t\n")
        for row in second:
            print(row["idGoods"], " \t ", row["Goods_Name"], "\t")
        print("\n")
if __name__ == "__main__": 
    main.decorator()
