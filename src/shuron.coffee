LIMITS =
  titleSubmit:      new Date(2013, 3,  25, 16, 50),
  titleChange1:     new Date(2013, 8, 30, 16, 50),
  midPresentation:  new Date(2013, 9, 19,  9, 30),
  titleChangeLast:  new Date(2013, 11, 13, 16, 50),
  thesisSubmit:     new Date(2014, 0,  9, 15,  0),
  lastPresentation: new Date(2014, 0, 29,  9, 30)

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

