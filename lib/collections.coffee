@Videos = new Mongo.Collection 'videos'

Schemas = {}

Schemas.video =
  name:
    type: String

  id:
    type: String

  start:
    type: Number
    optional: true

  end:
    type: Number
    optional: true

Videos.attachSchema Schemas.video
