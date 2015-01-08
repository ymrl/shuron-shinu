
LIMITS =
  titleSubmit:      new Date(2014, 3,  24, 16, 50),
  titleChange1:     new Date(2014, 8, 29, 16, 50),
  midPresentation:  new Date(2014, 9, 18,  9, 30),
  titleChangeLast:  new Date(2014, 11, 12, 16, 50),
  thesisSubmit:     new Date(2015, 0,  13, 15,  0),
  lastPresentation: new Date(2015, 1, 2,  9, 30)
URL_BASE = 'https://twitter.com/intent/tweet?&url=http%3A%2F%2F%E4%BF%AE%E8%AB%96.%E6%AD%BB%E3%81%AC.jp%2F'

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
  text = jQuery('.limitBody').text().split(/[\n\s]/).join('')
  btn = jQuery('.twitter-share-button')
  url = "#{URL_BASE}&text=#{encodeURIComponent(text)}"
  btn.attr(href: url).show()

showStamps = ->
  now = new Date()
  for id of LIMITS
    if LIMITS[id] < now
      stamp = jQuery('<div>').text('済').addClass('stamp')
      jQuery("##{id}").append(stamp)

jQuery ->
  showStamps()
  setInterval(showLimit,50)

