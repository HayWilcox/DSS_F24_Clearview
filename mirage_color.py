import pandas as pd
class mirage_color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_color(self, mirage_build_out, color_name, mirage_color, pivot_pro_color):
        self.cvcursor.execute('''INSERT INTO 
                                mirage_color 
                                (mirage_id, color_id, mirage_color, pivot_pro_color) 
                                VALUES 
                                (
                                    (SELECT mirage_id 
                                    FROM mirage 
                                    WHERE mirage_build_out = %s), 
                                    (SELECT color_id 
                                    FROM color 
                                    WHERE color_name = %s),
                                    %s,
                                    %s
                                )''', 
                                (mirage_build_out, color_name, mirage_color, pivot_pro_color))
        self.cvconn.commit()

    def select_mirage_color(self):
        self.cvcursor.execute('SELECT mirage_color_id, mirage_build_out, color_name, mirage_color, pivot_pro_color FROM mirage m INNER JOIN mirage_color mc ON m.mirage_id = mc.mirage_id INNER JOIN color c ON mm.color_id = c.color_id')
        return self.cvcursor.fetchall()
    
    def display_mirage_color(self):
        df = pd.DataFrame(self.select_mirage_color())
        df.columns = ['Mirage Color Id', 'Mirage Build Out', 'Color Name', 'Mirage Color', 'Pivot Pro Color']
        return df
    
    def update_mirage_color(self, mirage_color_id, mirage_build_out, color_name, mirage_color, pivot_pro_color):
        self.cvcursor.execute('UPDATE mirage_color SET mirage_id = (SELECT mirage_id FROM mirage WHERE mirage_build_out = %s), color_id = (SELECT color_id FROM color WHERE color_name = %s), mirage_color = %s, pivot_pro_color = %s WHERE mirage_color_id = %s', (mirage_build_out, color_name, mirage_color, pivot_pro_color, mirage_color_id))
        self.cvconn.commit()

    def delete_mirage_color(self, mirage_color_id):
        self.cvcursor.execute('DELETE FROM mirage_color WHERE mirage_color_id = %s', (mirage_color_id,))
        self.cvconn.commit()