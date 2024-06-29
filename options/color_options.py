import streamlit as st
from color import *

# drop down for color options for insert, update, and delete
color_options = st.selectbox('Please select an option for the Color Table: ', 
                                ('Choose an option','View', 'Insert', 'Update', 'Delete'))

if color_options == 'Insert':
    color_choice = st.text_input('Please enter a color: ')
    color_button = st.button('Insert Color', key=1)

    if color_button:
        color.insert_color(color_choice)
        st.write('successful')

elif color_options == 'View':
    st.write(color.display_color())

elif color_options == 'Update':
    st.write(color.display_color())

    color_id = st.text_input('Please enter the color id: ')
    color_choice = st.text_input('Please enter a color: ')

    color_button = st.button('Update Color', key=2)

    if color_button:
        color.update_color(color_id, color_choice)
        st.write('successful')

elif color_options == 'Delete':
    st.write(color.display_color())

    color_id = st.text_input('Please enter the color id: ')

    color_button = st.button('Delete Color', key=3)

    if color_button:
        color.delete_color(color_id)
        st.write('successful')