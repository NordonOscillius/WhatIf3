class_name T00_Utils extends RefCounted


static func fluent (object: Object) -> Object:
	
	return object


## Преобразует цвет, заданный в HSL-пространстве, в RGB-цвет.
static func hsl_to_rgb (hue: float, saturation: float, lightness: float, alpha: float = 1.0) -> Color:
	
	var red: float
	var green: float
	var blue: float
	
	var temp1: float
	var temp2: float
	var temp3: float
	
	if is_zero_approx (saturation):
		return Color (lightness, lightness, lightness, alpha)
	
	if lightness < .5:
		temp2 = lightness * (1 + saturation)
	else:
		temp2 = lightness + saturation - lightness * saturation
	
	temp1 = 2 * lightness - temp2
	
	# For three colors.
	var color: float
	for n in range(3):
		match n:
			0:
				temp3 = hue + 1.0 / 3.0
			1:
				temp3 = hue
			2:
				temp3 = hue - 1.0 / 3.0
		if temp3 < 0.0:
			temp3 += 1.0
		if temp3 > 1.0:
			temp3 -= 1.0
		if 6.0 * temp3 < 1.0:
			color = temp1 + (temp2 - temp1) * 6.0 * temp3
		else:
			if 2.0 * temp3 < 1.0:
				color = temp2
			else:
				if 3.0 * temp3 < 2.0:
					color = temp1 + (temp2 - temp1) * (2.0 / 3.0 - temp3) * 6.0
				else:
					color = temp1
		
		match n:
			0:
				red = color
			1:
				green = color
			2:
				blue = color
				
	return Color (red, green, blue, alpha)
