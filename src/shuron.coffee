LIMITS =
  titleSubmit:      new Date(2014, 3,  24, 16, 50),
  titleChange1:     new Date(2014, 8, 29, 16, 50),
  midPresentation:  new Date(2014, 9, 18,  9, 30),
  titleChangeLast:  new Date(2014, 11, 12, 16, 50),
  thesisSubmit:     new Date(2015, 0,  13, 15,  0),
  lastPresentation: new Date(2015, 1, 2,  9, 30)

showLimit = ->
  now = new Date()
  limit = LIMITS['thesisSubmit']
  if LIMITS['thesisSubmit'] > now
    gap  = (limit.getTime() - now.getTime())/1000
    day  = Math.floor(gap/(86400))
    hour = ("0" + Math.floor((gap%86400)/3600)).slice(-2)
    min  = ("0" + Math.floor((gap%86400)/60%60)).slice(-2)
    sec  = ("0" + Math.floor((gap%86400)%60%60)).slice(-2)
    jQuery("#limit .day").text day
    jQuery("#limit .hour").text hour
    jQuery("#limit .min").text min
    jQuery("#limit .sec").text sec
  else
    jQuery("#limit").empty().text "お疲れ様でした！"
showStamps = ->
  now = new Date()
  for id of LIMITS
    if LIMITS[id] < now
      stamp = jQuery('<div>').text('済').addClass('stamp')
      jQuery("##{id}").append(stamp)

jQuery ->
  showStamps()
  setInterval(showLimit,50)

