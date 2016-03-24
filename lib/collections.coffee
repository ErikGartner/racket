@Videos = new Mongo.Collection 'videos'

Schemas = {}

Schemas.video =
  name:
    label: 'Name'
    type: String

  id:
    label: 'Youtube Id'
    type: String

  description:
    label: 'Description'
    type: String
    optional: true

  start:
    label: 'Start second'
    type: Number
    optional: true

  end:
    label: 'End Second'
    type: Number
    optional: true

  owner:
    type: String
    label: 'Owner'
    autoValue: ->
      if @isInsert
        return Meteor.userId()

Videos.attachSchema Schemas.video

@VideosIndex = new EasySearch.Index
  collection: Videos
  engine: new EasySearch.Minimongo()
  fields: ['name']
  limit: 6

Videos.allow(
  insert: (userId, doc) ->
    return userId

  update: (userId, doc) ->
    return userId == doc.owner

  remove: (userId, doc) ->
    return userId == doc.owner
)
