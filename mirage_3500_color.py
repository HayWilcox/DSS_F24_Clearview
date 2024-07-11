import pandas as pd
class mirage_3500_color:

    def __init__(self, cvcursor, cvconn):
      self.cvcursor = cvcursor
      self.cvconn = cvconn

    def insert_mirage_3500_color(self, mirage_3500_handle, color_name):
        self.cvcursor.execute('''INSERT INTO mirage_3500_color
                              (mirage_3500_id, color_id) 
                              VALUES (
                                (SELECT mirage_3500_id
                                  FROM mirage_3500
                                  WHERE mesh_3500_handle = %s), 
                                (SELECT color_id 
                                FROM color 
                                WHERE color_name = %s)
                              )''',
                              (mirage_3500_handle, color_name))
        self.cvconn.commit()
        
    def select_mirage_3500_color(self):
        self.cvcursor.execute('SELECT mirage_3500_id, mirage_3500_handle, color_name FROM mirage_3500_color mc INNER JOIN mirage_3500 m ON mc.mirage_3500_id = m.mirage_3500_id INNER JOIN color c ON mc.color_id = c.color_id')
        return self.cvcursor.fetchall()
    
    def display_mirage_3500_color(self):
        df = pd.DataFrame(self.select_mirage_3500_color())
        df.columns = ['Mirage 3500 Color Id', 'Mirage 3500 Handle', 'Color Name']
        return df
      
    def update_mirage_3500_color(self, mirage_3500_color_id, mirage_3500_handle, color_name):
        self.cvcursor.execute('UPDATE mirage_3500_color SET mirage_3500_id = (SELECT mirage_3500_id FROM mirage_3500 WHERE mirage_3500_handle = %s), color_id = (SELECT color_id FROM color WHERE color_name = %s) WHERE mirage_3500_color_id = %s', (mirage_3500_handle, color_name, mirage_3500_color_id))
        self.cvconn.commit()

    def delete_mirage_3500_color(self, mirage_3500_color_id):
        self.cvcursor.execute('DELETE FROM mirage_3500_color WHERE mirage_3500_color_id = %s', (mirage_3500_color_id,))
        self.cvconn.commit()