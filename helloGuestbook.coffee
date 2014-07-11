Posts = new Meteor.Collection "posts"

if Meteor.isClient
    Template.main.helpers
        "listPosts": Posts.find()

    Template.main.events
        "submit form": (e) ->
            e.preventDefault()

            post = 
                "text": $(e.target).find('[name=text]').val()
            
            post._id = Posts.insert(post)                 

            $(e.target).find('[name=text]').val("") 

if Meteor.isServer
    if Posts.find().count() == 0
        Posts.insert post for post in PostsSampleData
