Meteor.methods

    #Given  a word return a list of pictures for the word
    getImages: (word) ->
        key = "ae4e7c05462760fee4495f4953d36d36"
        secret = "b8d3dd37d9b2af87"
        query = word || 'bmw'

        iURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{key}&text=#{query}&per_page=3&format=json&nojsoncallback=1"


        picturesArray = []

        result = HTTP.get iURL

        if result.statusCode is 200
            content = JSON.parse(result.content)
            array_pics = content.photos.photo

            _.each array_pics, (val, key) ->
                console.log val, key
                id = val.id
                farm = val.farm
                server = val.server
                secret = val.secret

                url = "http://farm#{farm}.static.flickr.com/#{server}/#{id}_#{secret}.jpg"
                picturesArray.push(url)

            console.log(picturesArray)
            return {success:picturesArray,error:false}

        else
            console.log 'error: ', error
            return {error:true}