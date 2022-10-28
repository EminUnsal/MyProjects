from flask import Flask, render_template, url_for

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/second')
def body():
    return render_template('body.html')

@app.route('/third')
def text():
    return "<h1>Ludwigshafen ist very nice</h1>"

if __name__ == '__main__':
    app.run(debug=True)
    #app.run(port=80, debug=True) 
