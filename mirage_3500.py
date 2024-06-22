import pandas as pd
class mirage_3500:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_3500(self, mirage_3500_handle):
        self.cvcursor.execute('''INSERT INTO mirage_3500 
                              (mirage_3500_handle) 
                              VALUES (
                                %s
                              )'''  ,
                              (mirage_3500_handle,))
        self.cvconn.commit()
        

    def select_mirage_3500(self):
        self.cvcursor.execute('SELECT * FROM mirage_3500')
        return self.cvcursor.fetchall()
    
    def display_mirage_3500(self):
        df = pd.DataFrame(self.select_color())
        df.columns = ['Mirage 3500 Id', 'Mirage 3500 Handle']
        return df
    
    def update_mirage_3500(self, mirage_3500_id, mirage_3500_handle):
        self.cvcursor.execute('UPDATE mirage_3500 SET mirage_3500_handle = %s WHERE mirage_3500_id = %s', (mirage_3500_handle, mirage_3500_id))
        self.cvconn.commit()

    def delete_mirage_3500(self, mirage_3500_id):
        self.cvcursor.execute('DELETE FROM mirage_3500 WHERE mirage_3500_id = %s', (mirage_3500_id,))
        self.cvconn.commit()
    