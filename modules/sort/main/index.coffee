# Intl.Collator isn't supported by safari
# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Collator
# using a collator is supposed to be faster than doing localeCompare
hasCollator = Intl?.Collator?

collator = if hasCollator
  new Intl.Collator(undefined, {numeric: true}).compare
else
  (a, b) ->
    if a < b then -1
    else if a > b then 1
    else 0

compare = (a, b) ->
  if not isNaN(Number(a)) and not isNaN(Number(b)) then a - b
  else collator(a, b)


# slower than compare but enforces locale comparison for browsers that
# dont support Intl.Collator.
localeCompare = (locale, options) ->
  options ?= {numeric: true}

  localeCollator = if hasCollator
    new Intl.Collator(locale, options).compare
  else
    (a, b) ->
      a.localeCompare(b, locale, options)

  (a, b) ->
    if not isNaN(Number(a)) and not isNaN(Number(b)) then a - b
    else localeCollator(a, b)


hx.sortBy = (arr, f) ->
  newArr = [arr...]
  newArr.sort (left, right) ->
    fLeft = f left
    fRight = f right
    compare fLeft, fRight
  newArr

hx.sort = (arr) -> hx.sortBy arr, (x) -> x
hx.sort.compare = compare
hx.sort.localeCompare = localeCompare