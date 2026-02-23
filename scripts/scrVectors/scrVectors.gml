function Vector(_x,_y) constructor{
	x = _x;
	y= _y;
	
	static set = function(_x, _y){
		x = _x;
		y = _y;
	}
	
	static add = function(_vector){
		x += _vector.x;
		y += _vector.y;
	}

	static subtract = function(_vector){
		x -= _vector.x;
		y -= _vector.y;
	}

	static multiply = function(_scalar){
		x *= _scalar;
		y *= _scalar;
	}
	
	static divide = function(_scalar){
		x /= _scalar;
		y /= _scalar;
	}
	
	static getMagnitude = function(){
		return sqrt((x*x)+(y*y))
	}
	
	static normalize = function() {
			if ((x!=0) or (y!=0)){
				var _factor = 1/sqrt((x*x) + (y*y));
				x = _factor * x;
				y = _factor * y;
			}
	}
	
	static setMagnitude = function(_scalar) {
			normalize();
			multiply(_scalar);
	}
	
	static limitMagnitude = function(_limit){
		if getMagnitude() > _limit {
			setMagnitude(_limit);
		}
	}
}


function scrVectorAngle(_x, _y) {
    if (_x == 0) { // special cases
        if (_y > 0) {
			return 90;
		}
		if (_y == 0) {
           return 0;
		}
        return 270;
	}
     if (_y == 0) {// special cases
        if (_x >= 0) {
			return 0;
		}
        return 180;
	 }
		
    var ret = radtodeg(arctan(_y/_x));
    if (_x < 0 and _y < 0) // quadrant Ⅲ
        ret = 180 + ret;
    else if (_x < 0) // quadrant Ⅱ
        ret = 180 + ret; // it actually substracts
    else if (_y < 0) // quadrant Ⅳ
        ret = 270 - (90 + ret); // it actually substracts
    return ret;
}