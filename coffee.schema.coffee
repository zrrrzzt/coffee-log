module.exports = [
  name: "name"
  message: "Name"
  required: true
,
  name: "origin.country"
  message: "Origin - Country"
  required: true
,
  name: "origin.area"
  message: "Origin - Area"
  required: false
,
  name: "variety"
  message: "Varieties. Separate with commas"
  required: true
  before: (value) ->
    value.split ","
,
  name: "elevation"
  message: "Elevation"
  required: false
,
  name: "process"
  message: "Process"
  required: false
,
  name: "roastery"
  message: "Roastery"
  required: true
,
  name: "taste"
  message: "Tasting notes"
  required: false
,
  name: "rating"
  message: "Rating"
  required: false
,
  name: "comments"
  message: "Comments"
  required: false
]