<<<<<<< HEAD
# -----------------------
# Author: Clearview Project Team
# Date: 2024-06-01
# Purpose: This file is the main file for the Clearview project. It will be used to run the Clearview project.
# -----------------------

# -----------------------
# Import Libraries
# -----------------------
import os
import mysql.connector
from color import *

try:
    import streamlit as st

except ImportError or ModuleNotFoundError:
    os.system('pip install streamlit')
    import streamlit as st
    
# -----------------------
# Database Connection
# -----------------------
# Clearview Database Connection
clearview = mysql.connector.connect(
    host="localhost",
    user="clearview",
    password="CView24",
    database='clearview'
)
# Clearview Cursor
cvcursor = clearview.cursor()

# -----------------------
# Class Initialization
# -----------------------
color = color(cvcursor, clearview)

# -----------------------
# Main Program
# -----------------------

# drop down for color options for insert, update, and delete
color_options = st.selectbox('Please select an option for the Color Table: ', ('Choose an option','View', 'Insert', 'Update', 'Delete'))

if color_options == 'Insert':
    color_choice = st.text_input('Please enter a color: ')
    color_button = st.button('Submit', key=1)

    if color_button:
        color.insert_color(color_choice)
        st.write('successful')

elif color_options == 'View':
    st.write(color.display_color())
=======
import os
try: 
    import streamlit as st
except ImportError:
    os.system('pip install streamlit')
    import streamlit as st
    
st.write('Hello World')

# st.latex(r'''
#          a + ar + a r^2 + a r^3 + \cdots + a r^{n-1} =
#     \sum_{k=0}^{n-1} ar^k =
#     a \left(\frac{1-r^{n}}{1-r}\right)
#     ''')
>>>>>>> d374574 (Roger_Attempts)
