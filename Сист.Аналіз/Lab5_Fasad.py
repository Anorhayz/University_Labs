import pymysql.cursors
print_db_row=True
type_test=False

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

class printer():
    def show_beautifully(array):
        print("\n")
        for x in array:
            for y in x:
                if(type(y)==type("test") and len(y)<9):
                    print(y, "\t\t\t", end=" ")
                elif(type(y)==type("test") and len(y)<17):
                    print(y, "\t\t", end=" ")
                elif(type(y)==type("test") and len(y)>17):
                    print(y, "\t", end=" ")
                elif(type(y)==type(type_test)):
                    print(y, "\t\t", end=" ")
                else:
                    print(y, "\t\t\t", end=" ")
            print("\n", end=" ")

    def adapter(dbarray):
        output=[]
        a=[]
        for b in dbarray[0]:
            a.append(b)
        output.append(a)
        for row in dbarray:
            elements=[]
            for element in row:
                elements.append(row[element])
            output.append(elements)
        return output

class operand():
    def get_goods_handbook():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from goods_handbook"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    if (print_db_row==True):
                        print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret

    def get_syllables_list():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from syllables_list"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    if (print_db_row==True):
                        print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret

    def get_log_book():
        connection = connect()
        try:
            with connection.cursor() as cursor:
                sql = "select * from log_book"
                cursor.execute(sql)
                print()
                ret=[]
                for row in cursor:
                    if (print_db_row==True):
                        print(row)
                    ret.append(row)
        finally:
            connection.close()
        return ret


class main():
    def get_table(table_name):
        chose={"goods_handbook" : operand.get_goods_handbook,
               "log_book" : operand.get_log_book,
               "syllables_list" : operand.get_syllables_list}
        printer.show_beautifully(printer.adapter(chose[table_name]()))

print("To see table you want enter function \nmain.get_table('[name of table]') \nand press Enter\n")
print("available tables: \n goods_handbook\n log_book\n syllables_list\nchose needed one:")

#####
