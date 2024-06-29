import pandas as pd
class rainier_color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    #Note: est_placement is a temporary placeholder. May be replaced with something
    #like screen_num if that gets added to the rainier table.
    def insert_rainier_color(self, est_placement, color_name, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color):
        self.cvcursor.execute('''INSERT INTO 
                                rainier_color 
                                (rainier_id, color_id, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color) 
                                VALUES 
                                (
                                    (SELECT rainier_id 
                                    FROM rainier 
                                    WHERE est_placement = %s), 
                                    (SELECT color_id 
                                    FROM color 
                                    WHERE color_name = %s),
                                    %s,
                                    %s,
                                    %s,
                                    %s,
                                    %s,
                                    %s
                                )''', 
                                (est_placement, color_name, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color))
        self.cvconn.commit()

    def select_rainier_color(self):
        self.cvcursor.execute('SELECT rainier_color_id, est_placement, color_name, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color FROM rainier r INNER JOIN rainier_color rc ON r.rainier_id = rc.rainier_id INNER JOIN color c ON rc.color_id = c.color_id')
        return self.cvcursor.fetchall()
    
    def display_rainier_color(self):
        df = pd.DataFrame(self.select_rainier_color())
        df.columns = ['Rainier Color Id', 'Estimated Placement', 'Color Name', 'Estimated Hardware Color', 'Actual Hardware Color', 'Estimated Fabric Color', 'Actual Fabric Color', 'Estimated Zipper Color', 'Actual Zipper Color']
        return df
    
    def update_rainier_color(self, rainier_color_id, est_placement, color_name, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color):
        self.cvcursor.execute('UPDATE rainier_color SET rainier_id = (SELECT rainier_id FROM rainier WHERE est_placement = %s), color_id = (SELECT color_id FROM color WHERE color_name = %s), est_hardware_color = %s, act_hardware_color = %s, est_fabric_color = %s, act_fabric_color = %s, est_zipper_color = %s, act_zipper_color = %s WHERE rainier_color_id = %s', (est_placement, color_name, est_hardware_color, act_hardware_color, est_fabric_color, act_fabric_color, est_zipper_color, act_zipper_color, rainier_color_id))
        self.cvconn.commit()

    def delete_rainier_color(self, rainier_color_id):
        self.cvcursor.execute('DELETE FROM rainier_color WHERE rainier_color_id = %s', (rainier_color_id,))
        self.cvconn.commit()