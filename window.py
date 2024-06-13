import pandas as pd

class window:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_window(self, frame_size, frame_color, fractions, plus_or_minus, tab_spring, mesh, fasteners):
        query = """
        INSERT INTO window (`Frame Size`, `Frame Color`, `Fractions`, `Plus or Minus`, `Tab/Spring`, `Mesh`, `Fasteners`)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (frame_size, frame_color, fractions, plus_or_minus, tab_spring, mesh, fasteners)
        self.cvcursor.execute(query, values)
        self.cvconn.commit()

    def select_window(self):
        self.cvcursor.execute('SELECT * FROM window')
        return self.cvcursor.fetchall()
    
    def display_window(self):
        df = pd.DataFrame(self.select_window())
        df.columns = ['Window Id', 'Frame Size', 'Frame Color', 'Fractions', 'Plus or Minus', 'Tab/Spring', 'Mesh', 'Fasteners']
        return df
    
    def update_window(self, window_id, frame_size, frame_color, fractions, plus_or_minus, tab_spring, mesh, fasteners):
        query = """
        UPDATE window
        SET `Frame Size` = %s, `Frame Color` = %s, `Fractions` = %s, `Plus or Minus` = %s, `Tab/Spring` = %s, `Mesh` = %s, `Fasteners` = %s
        WHERE window_id = %s
        """
        values = (frame_size, frame_color, fractions, plus_or_minus, tab_spring, mesh, fasteners, window_id)
        self.cvcursor.execute(query, values)
        self.cvconn.commit()

    def delete_window(self, window_id):
        self.cvcursor.execute('DELETE FROM window WHERE window_id = %s', (window_id,))
        self.cvconn.commit()
