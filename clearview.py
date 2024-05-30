import os

try:
    import streamlit as st

except ImportError:
    os.system('pip install streamlit')
    import streamlit as st


st.write("Hello World")