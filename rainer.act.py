import pandas as pd
class rainier_act:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn
    def select_rainier_act(self):
        self.cvcursor.execute('SELECT * FROM rainier id, act_placement, act_housing, act_drive_side, act_hembar, act_pilebrush, act_brush_location, act_cord_length, act_mount_type, act_top_opening_width, act_top_level, act_bottom_opening_width, act_bottom_level, act_left_opening_height, act_left_plumb, act_right_opening_height, act_left_plumb, act_left_buildout, act_right_buildout, act_add_buildout, act_left_track, act_right_track, act_starting_point')
        return self.cvcursor.fetchall()
    
    def display_rainier_act(self):
        df = pd.DataFrame(self.select_rainier())
        df.columns = ['Rainier Id', 'Rainier', 'Act_Placement', 'Act_Housing', 'Act_Drive_Side', 'Act_Hembar', 'Act_Pilebrush', 'Act_Brush_Location', 'Act_Cord_Length', 'Act_Mount_Type', 'Act_Top_Opening_Width', 'Act_Top_Level', 'Act_Bottom_Opening_Width', 'Act_Bottom_Level', 'Act_Left_Opening_Height', 'Act_Left_Plumb', 'Act_Right_Opening_Height', 'Act_Right_Plumb', 'Act_Left_Buildout', 'Act_Right_Buildout','Act_Add_Buildout', 'Act_Left_Track', 'Act_Right_Track', 'Act_Starting_Point']
        return df
    
    def update_rainer_act(self, rainier_id, act_placement, act_housing, act_drive_side, act_hembar, act_pilebrush, act_brush_location, act_cord_length, act_mount_type, act_top_opening_width, act_top_level, act_bottom_opening_width, act_bottom_level, act_left_opening_height, act_left_plumb, act_right_opening_height, act_right_plumb, act_left_buildout, act_right_buildout, act_add_buildout, act_left_track, act_right_track, act_starting_point):
        self.cvcursor.execute('UPDATE rainier_act SET act_placement = %s, act_housing = %s, act_drive_side = %s, act_hembar = %s, act_pilebrush = %s, act_brush_location = %s, act_cord_length = %s, act_mount_type = %s, act_top_opening_width = %s, act_top_level = %s, act_bottom_opening_width = %s, act_bottom_level = %s, act_left_opening_height = %s, act_left_plumb = %s, act_right_opening_height = %s, act_right_plumb = %s, act_left_buildout = %s, act_right_buildout = %s, act_add_buildout = %s, act_left_track = %s, act_right_track = %s, act_starting_point = %s WHERE rainier_id = %s', (act_placement, act_housing, act_drive_side, act_hembar, act_pilebrush, act_brush_location, act_cord_length, act_mount_type, act_top_opening_width, act_top_level, act_bottom_opening_width, act_bottom_level, act_left_opening_height, act_left_plumb, act_right_opening_height, act_right_plumb, act_left_buildout, act_right_buildout, act_add_buildout, act_left_track, act_right_track, act_starting_point, rainier_id))
        self.cvconn.commit()

    def delete_rainier_act(self, rainier_id):
        self.cvcursor.execute('DELETE FROM rainier WHERE rainier_id = %s', (rainier_id,))
        self.cvconn.commit()