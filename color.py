import pandas as pd
class color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_color(self, color):
        self.cvcursor.execute('INSERT INTO color (color_name) VALUES (%s)', (color,))
        self.cvconn.commit()

    def select_color(self):
        self.cvcursor.execute('SELECT * FROM color')
        return self.cvcursor.fetchall()
    
    def display_color(self):
        df = pd.DataFrame(self.select_color())
        df.columns = ['Color Id', 'Color']
        return df
    
    def update_color(self, color_id, color):
        self.cvcursor.execute('UPDATE color SET color_name = %s WHERE color_id = %s', (color, color_id))
        self.cvconn.commit()

    def delete_color(self, color_id):
        self.cvcursor.execute('DELETE FROM color WHERE color_id = %s', (color_id,))
        self.cvconn.commit()