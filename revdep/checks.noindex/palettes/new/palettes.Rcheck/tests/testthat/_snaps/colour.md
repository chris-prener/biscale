# format - can format() a colour

    Code
      format(pal_colour("black"))
    Output
      [1] "#000000"

# pillar shaft works [plain]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      * #FF0000

# pillar shaft works [ansi]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      [31m*[39m #FF0000

# pillar shaft works [unicode]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      • #FF0000

# pillar shaft works [fancy]

    Code
      pillar_shaft(x$colour)
    Output
      <pillar_ornament>
      [31m•[39m #FF0000

# normal print method works [plain]

    Code
      x
    Output
      <palettes_colour[1]>
      * #FF0000

# normal print method works [ansi]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m*[39m #FF0000

# normal print method works [unicode]

    Code
      x
    Output
      <palettes_colour[1]>
      • #FF0000

# normal print method works [fancy]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m•[39m #FF0000

# zero-length normal print method works

    Code
      x
    Output
      <palettes_colour[0]>

# palettes.print_symbol option works [plain]

    Code
      x
    Output
      <palettes_colour[1]>
      [x] #FF0000

# palettes.print_symbol option works [ansi]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m[x][39m #FF0000

# palettes.print_symbol option works [unicode]

    Code
      x
    Output
      <palettes_colour[1]>
      ■ #FF0000

# palettes.print_symbol option works [fancy]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m■[39m #FF0000

# palettes.print_symbol works with FALSE

    Code
      x
    Output
      <palettes_colour[1]>
      #FF0000

# palettes.print_hex option works [plain]

    Code
      x
    Output
      <palettes_colour[1]>
      *

# palettes.print_hex option works [ansi]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m*[39m

# palettes.print_hex option works [unicode]

    Code
      x
    Output
      <palettes_colour[1]>
      •

# palettes.print_hex option works [fancy]

    Code
      x
    Output
      <palettes_colour[1]>
      [31m•[39m

# palettes.print_alpha option works

    Code
      x
    Output
      <palettes_colour[3]>
      * #88A0DCF0
      * #381A61CC
      * #7C4B73FF

# palettes.print_sep option works

    Code
      x
    Output
      <palettes_colour[2]>
      * #FF0000, 
      * #0000FF

# palettes.print_width option works

    Code
      x
    Output
      <palettes_colour[3]>
      * #FF0000* #0000FF
      * #00FF00

# palettes.print_index option works

    Code
      x
    Output
      <palettes_colour[3]>
      [1] * #FF0000
      [2] * #0000FF
      [3] * #00FF00

# disabling formatting works

    Code
      x
    Output
      <palettes_colour[3]>
          "red"
      "#ff0000"
      "#FF0000"

