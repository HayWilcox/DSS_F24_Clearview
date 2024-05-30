import streamlit as st
import mysql.connector
import pandas as pd

clearview = mysql.connector.connect(
    host="localhost",
    user="clearview",
    password="CView24",
    database='clearview'
)

cvcursor = clearview.cursor()

color = st.text_input('Please enter a color: ')
color_button = st.button('Submit', key=1)

if color_button:
    cvcursor.execute('INSERT INTO color (color_name) VALUES (%s)', (color,))
    clearview.commit()
    st.write('successful')

cvcursor.execute('SELECT * FROM color')
df = pd.DataFrame(cvcursor.fetchall())
df.columns = ['Color Id', 'Color']
st.write(df)