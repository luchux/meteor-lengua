if Meteor.isClient
  console.log 'client'

Router.map ->
  @route 'wordCards',
    path: '/'

  @route 'card',
    layoutTemplate: 'cardLayout'
    yieldTemplates:
      card:
        to: 'cardContent'
    path: '/card'
    data: ->
      images: [{src: "http://placekitten.com/200/250"},{src: "http://placekitten.com/200/250"},{src: "http://placekitten.com/200/250"}]
      foreign: "die Katze"
