import os
from flask import Flask

def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = 'todo-api/api-geteway:1.0'

    return app