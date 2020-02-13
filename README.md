# pupdates_backend

## About
  This app was created for the purpose of having a backend application that receives, displays, and modifies data for [pupdates-frontend](https://github.com/PupDates-CrossPol/pupdates_frontend). The overall goal of the two apps is to provide dog owners with a fun and effective way of socializing their dogs with other owners. It was made in 12 days using Rails 5.2.4.1 and Ruby 2.4.1. The production site can be found at [pupdates-backend](https://backend-pupdates.herokuapp.com/).

## Gems
    - gem 'pg', '>= 0.18', '< 2.0'
    - gem 'bcrypt', '~> 3.1.7'
    - gem 'rspec-rails'
    - gem 'faker'
    - gem 'fast_jsonapi'
    - gem 'table_print'
    - gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    - gem 'factory_bot_rails'
    - gem 'shoulda-matchers'
    - gem 'pry'
    - gem 'simplecov'
    - gem 'listen', '>= 3.0.5', '< 3.2'
    - gem 'spring'
    - gem 'spring-watcher-listen', '~> 2.0.0'

## Setup
  - Fork the repository then clone
  - Run `bundle install`
  - Run `rails db:{drop,create,migrate,seed}`

## Database Schema
![DBSchema](/bin/backend_pupdates_schema.png?raw=true "pupdates_schema")

## Endpoints
### Each request will need https://backend-pupdates.herokuapp.com/ to start

### GET `/api/v1/users`

Example of a successful response:

```javascript
 {"data":[{"id":"1","type":"user","attributes":{"id":1,"first_name":"Matt","last_name":"Malone","email":"mattmalone@email.com","description":"a guy who likes dogs","image":"https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260"}},{"id":"2","type":"user","attributes":{"id":2,"first_name":"Sam","last_name":"Coleman","email":"samcoleman@email.com","description":"a guy who from TN likes dogs a lot","image":"https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260"}},{"id":"3","type":"user","attributes":{"id":3,"first_name":"Andrew","last_name":"Johnson","email":"andrewjohnson@email.com","description":"a guy from SD who likes dogs","image":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260"}},{"id":"4","type":"user","attributes":{"id":4,"first_name":"Sara","last_name":"Karsh","email":"sarakarsh@email.com","description":"a girl who likes her dog too much","image":"https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260"}}]}
```

### GET `/api/v1/users/:id`

Example of a successful response:

```javascript
 {"data":{"id":"4","type":"user","attributes":{"id":4,"first_name":"Sara","last_name":"Karsh","email":"sarakarsh@email.com","description":"a girl who likes her dog too much","image":"https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260"}}}
```

### GET `/api/v1/dogs`

Example of a successful response:

```javascript
{"data":[{"id":"1","type":"dog","attributes":{"id":1,"name":"Fido","sex":"male","breed":"golden retriever","size":"large","age":4,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":1}},{"id":"2","type":"dog","attributes":{"id":2,"name":"Hank","sex":"male","breed":"border collie","size":"medium","age":1,"fixed":false,"vaccinated":false,"good_with_kids":true,"description":null,"user_id":2}},{"id":"3","type":"dog","attributes":{"id":3,"name":"Goofy","sex":"male","breed":"doberman","size":"large","age":5,"fixed":true,"vaccinated":true,"good_with_kids":false,"description":null,"user_id":2}},{"id":"4","type":"dog","attributes":{"id":4,"name":"Molly","sex":"female","breed":"golden retriever","size":"large","age":2,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":3}},{"id":"5","type":"dog","attributes":{"id":5,"name":"Sparkles","sex":"female","breed":"papillon","size":"small","age":8,"fixed":true,"vaccinated":true,"good_with_kids":false,"description":null,"user_id":3}},{"id":"6","type":"dog","attributes":{"id":6,"name":"Fluffy","sex":"female","breed":"chihuahua","size":"very small","age":12,"fixed":false,"vaccinated":false,"good_with_kids":false,"description":null,"user_id":3}},{"id":"7","type":"dog","attributes":{"id":7,"name":"Larry","sex":"male","breed":"german shepherd","size":"large","age":5,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":3}},{"id":"8","type":"dog","attributes":{"id":8,"name":"Oliver","sex":"male","breed":"chocolate lab","size":"large","age":1,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":4}},{"id":"9","type":"dog","attributes":{"id":9,"name":"Tallulah","sex":"female","breed":"mutt","size":"medium","age":6,"fixed":true,"vaccinated":true,"good_with_kids":false,"description":null,"user_id":4}}]}
```

### GET `/api/v1/dogs/:id`

Example of a successful response:

```javascript
{"data":[{"id":"1","type":"dog","attributes":{"id":1,"name":"Fido","sex":"male","breed":"golden retriever","size":"large","age":4,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":1}}]}
```

### GET `/api/v1/dog_images`

Example of a successful response:

```javascript
{"data":[{"id":"1","type":"dog_image","attributes":{"id":1,"image":"https://images.pexels.com/photos/752383/pexels-photo-752383.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":1}},{"id":"2","type":"dog_image","attributes":{"id":2,"image":"https://images.pexels.com/photos/1959055/pexels-photo-1959055.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":1}},{"id":"3","type":"dog_image","attributes":{"id":3,"image":"https://images.pexels.com/photos/1938125/pexels-photo-1938125.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":2}},{"id":"4","type":"dog_image","attributes":{"id":4,"image":"https://images.pexels.com/photos/1242419/pexels-photo-1242419.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":3}},{"id":"5","type":"dog_image","attributes":{"id":5,"image":"https://images.pexels.com/photos/89781/doberman-dog-animal-world-animal-89781.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":3}},{"id":"6","type":"dog_image","attributes":{"id":6,"image":"https://images.pexels.com/photos/1490908/pexels-photo-1490908.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":4}},{"id":"7","type":"dog_image","attributes":{"id":7,"image":"https://images.pexels.com/photos/92380/pexels-photo-92380.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":4}},{"id":"8","type":"dog_image","attributes":{"id":8,"image":"https://images.pexels.com/photos/1431762/pexels-photo-1431762.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":4}},{"id":"9","type":"dog_image","attributes":{"id":9,"image":"https://images.pexels.com/photos/54199/pexels-photo-54199.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":4}},{"id":"10","type":"dog_image","attributes":{"id":10,"image":"https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230042/Papillon-On-White-01.jpg","dog_id":5}},{"id":"11","type":"dog_image","attributes":{"id":11,"image":"http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/papillon_01_lg.jpg","dog_id":5}},{"id":"12","type":"dog_image","attributes":{"id":12,"image":"https://www.purina.co.uk/sites/g/files/mcldtz2481/files/styles/nppe_breed_selector_500/public/breed_library/chihuahua_smooth_coat.jpg?itok=mvcwMTFj","dog_id":6}},{"id":"13","type":"dog_image","attributes":{"id":13,"image":"https://vetstreet.brightspotcdn.com/dims4/default/1d87d20/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F3a%2Fc3%2F424ee1bf4768973966bde73acda8%2Fgerman-shepherd-AP-1S7FRX-645sm12913.jpg","dog_id":7}},{"id":"14","type":"dog_image","attributes":{"id":14,"image":"https://www.allthingsdogs.com/wp-content/uploads/2019/07/Chocolate-Lab-Names-Feature.jpg","dog_id":8}},{"id":"15","type":"dog_image","attributes":{"id":15,"image":"https://www.thesprucepets.com/thmb/6OX0VRYRfXclaryFZUeR-5j-7YA=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Stocksy_txpf4e26be2n2x100_Medium_774343-5afafb60c064710036564027.jpg","dog_id":9}}]}
```

### GET `/api/v1/dog_images/:id`

Example of a successful response:

```javascript
{"data":{"id":"7","type":"dog_image","attributes":{"id":7,"image":"https://images.pexels.com/photos/92380/pexels-photo-92380.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=750\u0026w=1260","dog_id":4}}}
```

### GET `/api/v1/users/:id/dogs`

Example of a successful response:

```javascript
{"data":[{"id":"1","type":"dog","attributes":{"id":1,"name":"Fido","sex":"male","breed":"golden retriever","size":"large","age":4,"fixed":true,"vaccinated":true,"good_with_kids":true,"description":null,"user_id":1}}]}
```

### POST `/api/v1/login`

This request requires email and password to be sent in a request body or parameters.

Example of a successful response:

```javascript
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "id": 2,
            "first_name": "Sam",
            "last_name": "Coleman",
            "email": "samcoleman@email.com",
            "description": "a guy who from TN likes dogs a lot",
            "image": "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        }
    }
}
```

### GET `/api/v1/reports`

Example of a successful response:

```javascript
{
    "data": [
        {
            "id": "1",
            "type": "report",
            "attributes": {
                "id": 1,
                "user_id": 4,
                "description": "does not have a dog"
            }
        },
        {
            "id": "2",
            "type": "report",
            "attributes": {
                "id": 2,
                "user_id": 2,
                "description": "dog is mean"
            }
        }
    ]
}
```

### POST `/api/v1/reports`

- This request requires user_id and description to be sent in a request body or parameters.

Example of a successful response:

```javascript
{
    "data": [
        {
            "id": "1",
            "type": "report",
            "attributes": {
                "id": 1,
                "user_id": 4,
                "description": "does not have a dog"
            }
        },
        {
            "id": "2",
            "type": "report",
            "attributes": {
                "id": 2,
                "user_id": 2,
                "description": "dog is mean"
            }
        },
        {
            "id": "3",
            "type": "report",
            "attributes": {
                "id": 3,
                "user_id": 3,
                "description": "No bueno"
          }
        }
    ]
}
```

### POST `/api/v1/users/:id/dog`

- This request requires all attributes of dog resource to be sent in params or request body.

Example of a successful response:

```javascript
{"data":
  [{"id": "8431",
    "type": "dog",
    "attributes":
     {"id": 8431,
      "name": "Oliver",
      "sex": "male",
      "breed": "chocolate lab",
      "size": "large",
      "age": 1,
      "fixed": true,
      "vaccinated": true,
      "good_with_kids": true,
      "user_id": 6012}},
   {"id": "8432",
    "type": "dog",
    "attributes":
     {"id": 8432,
      "name": "Tallulah",
      "sex": "female",
      "breed": "mutt",
      "size": "medium",
      "age": 6,
      "fixed": true,
      "vaccinated": true,
      "good_with_kids": false,
      "user_id": 6012}},
   {"id": "8433",
    "type": "dog",
    "attributes":
     {"id": 8433,
      "name": "Zoe",
      "sex": "female",
      "breed": "mutt",
      "size": "medium",
      "age": 4,
      "fixed": true,
      "vaccinated": true,
      "good_with_kids": true,
      "user_id": 6012}
    }]
}
```

### GET `/api/v1/users/:id/matches`

Example of a successful response:

```javascript
{"data":
  [{"id":"6046",
    "type":"user",
    "attributes":
     {"id":6046,
      "first_name":"Sam",
      "last_name":"Coleman",
      "email":"samcoleman@email.com",
      "description":"a guy who from TN likes dogs a lot",
      "image":
       "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
      }
    }]
  }
```

### POST `/api/v1/users/:id/matches`

- This request requires the match_id and status sent in request as parameters or body.

Example of a successful response:

```javascript
{"data":
  {"id":
  "1923",
   "type":
   "match",
   "attributes":
   {"id"=>1923, "user_id"=>6082, "match_id"=>6081, "status"=>"like"
   }
  }
 }
```
