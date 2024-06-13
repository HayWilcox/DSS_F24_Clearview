import pandas as pd
class color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage(self, mirage):
        self.cvcursor.execute('INSERT INTO mirage (mirage_build_out) VALUES (%s)', (mirage,))
        self.cvconn.commit()

    def select_mirage(self):
        self.cvcursor.execute('SELECT * FROM mirage')
        return self.cvcursor.fetchall()
    
    def display_mirage(self):
        df = pd.DataFrame(self.select_mirage())
        df.columns = ['Mirage ID', 'Mirage']
        return df
    
    def update_mirage(self, mirage_id, mirage):
        self.cvcursor.execute('UPDATE mirage SET mirage_build_out = %s WHERE mirage_id = %s', (mirage, mirage_id))
        self.cvconn.commit()

    def delete_color(self, mirage_id):
        self.cvcursor.execute('DELETE FROM mirage WHERE mirage_build_out = %s', (mirage_id,))
        self.cvconn.commit()