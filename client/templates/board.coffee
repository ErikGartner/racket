@yPlayer = undefined
@onYouTubeIframeAPIReady = =>
  @yPlayer = new YT.Player 'player',
    height: '400'
    #width: '60'

Template.board.onRendered ->
  YT.load()

Template.board.helpers
  videos: ->
    return Videos.find()

Template.video.events
  'click .button': (event) ->
    video = Videos.findOne $(event.target).data('id')
    console.log event.target.dataset.id
    yPlayer.loadVideoById
      'videoId': video.id
      'startSeconds': video.start
      'endSeconds': video.end

Template.video.onRendered ->
  $('.image').dimmer
    on: 'hover'

Template.search.helpers
  VideosIndex: ->
    return VideosIndex

Template.video.helpers
  editable: ->
    return @owner == Meteor.userId()

Template.addVideo.onRendered ->
  $('#addVideo').popup
    popup : $('#addPopup')
    on    : 'click'
