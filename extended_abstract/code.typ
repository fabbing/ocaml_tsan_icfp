#let code(
    caption: none,             // content of caption bubble (string, none)
    bgcolor: rgb("#fefae0"),   // back ground color (color)
    strokecolor: 1pt + maroon, // frame color (color)
    hlcolor: auto,             // color to use for highlighted lines (auto, color)
    width: 100%,
    radius: 3pt,
    inset: 5pt,
    numbers: false,            // show line numbers (boolean)
    stepnumber: 1,             // only number lines divisible by stepnumber (integer)
    numberfirstline: false,    // if the firstline isn't divisible by stepnumber, force it to be numbered anyway (boolean)
    numberstyle: auto,         // style function to apply to line numbers (auto, style)
    firstnumber: 1,            // number of the first line (integer)
    highlight: none,           // line numbers to highlight (none, array of integer)
    content
) = {
    if type(hlcolor) == "auto" {
        hlcolor = bgcolor.darken(10%)
    }
    if type(highlight) == "none" {
        highlight = ()
    }
    block(
        width: width,
        fill: bgcolor,
        stroke: strokecolor,
        radius: radius,
        inset: inset,
        clip: false,
        {
            // Draw the caption bubble if a caption was set
            if caption != none {
                style(styles => {
                    let caption_block = block(width: auto,
                            inset: inset,
                            radius: radius,
                            fill: bgcolor,
                            stroke: strokecolor,
                            h(.5em) + caption + h(.5em))
                    place(
                        top + left,
                        dx: 0em,
                        dy: -(measure(caption_block, styles).height / 2 + inset),
                        caption_block 
                    )
                })
                // skip some vertical space to avoid the caption overlapping with
                // the beginning of the content
                v(.6em)
            }

            let (columns, align, make_row) = {
                if numbers {
                    // line numbering requested
                    if type(numberstyle) == "auto" {
                        numberstyle = text.with(style: "italic", 
                                                slashed-zero: true, 
                                                size: .6em)
                    }
                    ( ( auto, 1fr ),
                      ( right + horizon, left ),
                      e => {
                        let (i, l) = e
                        let n = i + firstnumber
                        let n_str = if (calc.rem(n, stepnumber) == 0) or (numberfirstline and i == 0) { numberstyle(str(n)) } else { none }
                        (n_str + h(0em), raw(lang: content.lang, l))
                      }
                    )
               } else {
                    ( ( 1fr, ),
                      ( left, ),
                      e => {
                        let (i, l) = e
                        raw( lang:content.lang, l)
                      }
                    )
                }
            }
            table(
                stroke:none,
                columns: columns,
                rows: (auto,),
                gutter: 0pt,
                inset: 2pt,
                align: (col, _) => align.at(col),
                fill: (c, row) => if (row / 2 + firstnumber) in highlight { hlcolor } else { none },
                ..content
                    .text
                    .split("\n")
                    .enumerate()
                    .map(make_row)
                    .flatten()
                    .map(c => if c.has("text") and c.text == "" { v(1em) } else { c })
            )
        }
    )
}