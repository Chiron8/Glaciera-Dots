from sense_hat import SenseHat

sense = SenseHat()

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

zero = hex_to_rgb("{{color0}}")  
one = hex_to_rgb("{{color1}}")  
two = hex_to_rgb("{{color2}}")  
three = hex_to_rgb("{{color3}}")  
four = hex_to_rgb("{{color4}}")  
five = hex_to_rgb("{{color5}}")  
six = hex_to_rgb("{{color6}}")  
seven = hex_to_rgb("{{color7}}")  

nice_pixels = [
    zero, zero, zero, zero, zero, zero, zero, zero,
    one, one, one, one, one, one, one, one,
    two, two, two, two, two, two, two, two,
    three, three, three, three, three, three, three, three,
    four, four, four, four, four, four, four, four,
    five, five, five, five, five, five, five, five,
    six, six, six, six, six, six, six, six,
    seven, seven, seven, seven, seven, seven, seven, seven
]

sense.set_pixels(nice_pixels)

#sense.show_message("Hello world!")
