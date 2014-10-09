# dev test

Prepare a rails 4.1 application which would have a public and a private interface.
 
Private API responding to the following requests:
  
* 1 - GET  locations/:country_code
* 2 - GET  target_groups/:country_code
* 3 - POST evaluate_target

Public interface responding to the following requests

* 4 - GET  locations/:country_code
* 5 - GET  target_groups/:country_code


## models

Country is linked with LocationGroup via many to many relationship and TargetGroup also via many to many but only with the root nodes:

- id, country_code, panel_provider_id

PanelProvider

- id, code

Location is linked with LocationGroup via many to many relationship:

- id, name, external_id, secret_code, country_id

LocationGroup:

- id, name, country_id, panel_provider_id

TargetGroup model would have associations with it self via parent_id which would form a tree with multiple root nodes:

- id, name, external_id, parent_id, secret_code, country_id, panel_provider_id


The application should have:
- 3 Countries, each with different panel provider
- 3 Panel Providers
- 20 Locations of any type
- 4 Location Groups, 3 of them with different provider and 1 would belong to any of them  
- 4 root Target Groups and each root should start a tree which is minimium 3 levels deep (3 of them with different provider and 1 would belong to any of them) 

## request info

#### Request #1

It should return locations which belong to the selected country based on it's current panel provider

#### Request #2

It should return target groups which belong to the selected country based on it's current panel provider

#### Request #3

It should accept the following params:

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

The price should be based on the number of "b" opening tags you can find in this feed https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news
 
#### Panel 3

The price should be based on how many html nodes can you find on this site http://time.com divided by 100



