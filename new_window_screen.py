import pandas as pd
class new_window_screen:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_new_window_screen(self, width_inch, height_inch):
        self.cvcursor.execute('INSERT INTO new_window_screen (width_inch, height_inch) VALUES (%s)', (width_inch, height_inch,))
        self.cvconn.commit()

    def select_new_window_screen(self):
        self.cvcursor.execute('SELECT * FROM new_window_screen')
        return self.cvcursor.fetchall()
    
    def display_new_window_screen(self):
        df = pd.DataFrame(self.select_new_window_screen())
        df.columns = ['NWS Id', 'Width Inch', 'Height Inch']
        return df
    
    def update_new_window_screen(self, nws_id, width_inch, height_inch):
        self.cvcursor.execute('UPDATE new_window_screen SET width_inch = %s AND height_inch = %s WHERE nws_id = %s', (width_inch, height_inch, nws_id,))
        self.cvconn.commit()

    def delete_new_window_screen(self, nws_id):
        self.cvcursor.execute('DELETE FROM new_window_screen WHERE nws_id = %s', (nws_id,))
        self.cvconn.commit()

