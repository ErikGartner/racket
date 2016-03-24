Meteor.publish 'videos', ->
  return Videos.find()
