# dev test

**This test is not about solving a problem. It's about execution and checking what's your default way of thinking and coding habits.**

**This test is described quite vaguely on purpose, so interpretation of its explicit and implicit requirements is up to you.**

Prepare a rails 6.1 application using Ruby 2.7 , which would have 2 isolated APIs, public and private.

Private API responding to the following requests:
  
* 1 - GET  locations/:country_code
* 2 - GET  target_groups/:country_code
* 3 - POST evaluate_target

Public API responding to the following requests

* 4 - GET  locations/:country_code
* 5 - GET  target_groups/:country_code

The authentication type is up to you and you should assume there is no firewall so the server would be public facing and needs to be secured properly when necessary.

## models

Country is linked with LocationGroup via one to many relationship and with TargetGroup via many to many but only with the root nodes:

- id, country_code, panel_provider_id

PanelProvider

- id, code

Location is linked with LocationGroup via many to many relationship:

- id, name, external_id, secret_code

LocationGroup:

- id, name, country_id, panel_provider_id

TargetGroup model would have associations with it self via parent_id which would form a tree with multiple root nodes:

- id, name, external_id, parent_id, secret_code, panel_provider_id


The application should have:
- 3 Countries, each with different panel provider
- 3 Panel Providers
- 20 Locations of any type (city, region, state, etc.)
- 4 Location Groups, 3 of them with different provider and 1 would belong to any of them  
- 4 root Target Groups and each root should start a tree which is minimium 3 levels deep (3 of them with different provider and 1 would belong to any of them) 

## request info

#### Request #1

It should return locations which belong to the selected country based on it's current panel provider

#### Request #2

It should return target groups which belong to the selected country based on it's current panel provider

#### Request #3

It should require all of the following params to be provided and valid:

- :country_code
- :target_group_id
- :locations  (an array of hashes which look like this { id: 123, panel_size: 200 })

and return a price based on a logic specific to each panel provider used by a country.

#### Request #4

Same as #1 but for public consumption 

#### Request #5

Same as #2 but for public consumption

## panel providers pricing logic

Each panel provider will have a different pricing logic
 
#### Panel 1

The price should be based on how many letters "a" can you find on this site http://time.com divided by 100
    
#### Panel 2

The price should be based on how many arrays with more than 10 elements you can find in this search result

http://openlibrary.org/search.json?q=the+lord+of+the+rings
 
#### Panel 3

The price should be based on how many html nodes can you find on this site http://time.com divided by 100



