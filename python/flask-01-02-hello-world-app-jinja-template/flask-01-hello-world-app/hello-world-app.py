from flask import Flask

app = Flask(__name__)

@app.route('/')
def head():
    return "<h1>Hello World Armando This is from Clarusway DE</h1>"


@app.route('/second')
def second():
    return "This is the second page"

@app.route('/third/subthird')
def third():
    return "This is the subpage of third page"


@app.route('/forth/<string:id>')
def forth(id):
    return f'Id of this page is {id}'



if __name__ == '__main__':
    app.run(debug=True)