from sense_hat import SenseHat

sense = SenseHat()

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

zero = hex_to_rgb("#4B4B50")  
one = hex_to_rgb("#323EA8")  
two = hex_to_rgb("#36409A")  
three = hex_to_rgb("#3441B4")  
four = hex_to_rgb("#3A44A5")  
five = hex_to_rgb("#4753C7")  
six = hex_to_rgb("#5775EE")  
seven = hex_to_rgb("#E4E6EE")  

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
