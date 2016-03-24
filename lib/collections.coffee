@Videos = new Mongo.Collection 'videos'

Schemas = {}

Schemas.video =
  name:
    label: 'Name'
    type: String

  id:
    label: 'Youtube Id'
    type: String

  start:
    label: 'Start second'
    type: Number
    optional: true

  end:
    label: 'End Second'
    type: Number
    optional: true

Videos.attachSchema Schemas.video

@VideosIndex = new EasySearch.Index
  collection: Videos
  engine: new EasySearch.MongoDB()
  fields: ['name']
