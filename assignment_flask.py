from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from geoalchemy2 import Geometry

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://username:password@localhost/spatialdb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Define the Point model
class SpatialPoints(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    address = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text, nullable=True)
    location = db.Column(Geometry('POINT'), nullable=False)

# Define the Polygon model
class SpatialPolygons(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=True)
    area = db.Column(Geometry('POLYGON'), nullable=False)

# Endpoint to add a point
@app.route('/points', methods=['POST'])
def add_point():
    data = request.get_json()
    name = data['name']
    address = data['address']
    description = data.get('description', '')
    location = f"POINT({data['longitude']} {data['latitude']})"
    point = SpatialPoints(name=name, address=address, description=description, location=location)
    db.session.add(point)
    db.session.commit()
    return jsonify({"message": "Point added successfully!", "id": point.id})

# Endpoint to retrieve all points
@app.route('/points', methods=['GET'])
def get_points():
    points = SpatialPoints.query.all()
    return jsonify([{ "id": p.id, "name": p.name, "address": p.address, "description": p.description, "location": str(p.location) } for p in points])

# Endpoint to add a polygon
@app.route('/polygons', methods=['POST'])
def add_polygon():
    data = request.get_json()
    name = data['name']
    description = data.get('description', '')
    coordinates = ', '.join([f"{lng} {lat}" for lng, lat in data['coordinates']])
    polygon = f"POLYGON(({coordinates}))"
    new_polygon = SpatialPolygons(name=name, description=description, area=polygon)
    db.session.add(new_polygon)
    db.session.commit()
    return jsonify({"message": "Polygon added successfully!", "id": new_polygon.id})

# Endpoint to retrieve all polygons
@app.route('/polygons', methods=['GET'])
def get_polygons():
    polygons = SpatialPolygons.query.all()
    return jsonify([{ "id": p.id, "name": p.name, "description": p.description, "area": str(p.area) } for p in polygons])

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    
    app.run(debug=True)