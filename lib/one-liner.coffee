hasOneLine = (text) ->
    (if text.match(/[\n\r]+/g) then false else true)

module.exports =
    run: (text) ->
        text = (if hasOneLine(text) then @trim(text) else @oneliner(text))
    trim: (text) ->
        original = text
        text = text.replace(/(>)([\s\t\r\n]*)(<)/ig, "$1$3") if text.match(/<\/?([^>]*)>/ig)
        text = text.replace(/([\s]+)/ig, "").replace(/([\t]+)/ig, "") if text.length is original.length
        text
    oneliner: (text) ->
        text.replace(/(\r\n|\n|\r)/mig, "").replace(/([\s]+)/mig, " ").replace(/([\t]+)/g, " ").trim()
