from flask import Flask, render_template, url_for

api = Flask(__name__)


@api.route('/dashboard')
def dashboard():
        return render_template('dashboard.html')

@api.route('/')
def index():
        return render_template('index.html')       





if __name__ == '__main__':
        api.run(debug = True)