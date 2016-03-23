@yPlayer = undefined
@onYouTubeIframeAPIReady = =>
  console.log 'sup'
  @yPlayer = new YT.Player 'player'
  #  height: '400'
  #  width: '600'

Template.board.onRendered ->
  YT.load()

Template.board.events
  'click button': (event) ->
    console.log event
    video = Videos.findOne event.target.dataset.id
    yPlayer.loadVideoById
      'videoId': video.id
      'startSeconds': video.start
      'endSeconds': video.end

Template.board.helpers
  videos: ->
    return Videos.find()
