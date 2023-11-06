from flask import render_template
from sqlalchemy import create_engine, inspect

from app_gcp import app_gcp  # Import the Flask app instance from app_gcp.py

# Replace with your GCP database connection details
gcp_db_uri = "mysql+pymysql://username:password@hostname/database_name"

engine = create_engine(gcp_db_uri)

@app_gcp.route('/')
def home():
    insp = inspect(engine)
    table_names = insp.get_table_names()
    return render_template('home.html', tables=table_names)









