## Users
|Column             |Type       |Options                                  |
|-----------        |-----------|-----------------------------------------|
|nickname           |string     |not:null                                 |
|email              |string     |not:null, unique :true                   |
|encrypted_password |string     |not:null                                 |
|name_lc             |string     |not:null                                 |
|name_gc             |string     |not:null                                 |
|name_l             |string     |not:null                                 |
|name_g             |string     |not:null                                 |
|birth              |date       |not:null                                 |


### Associations
    has_many :items
    has_many :buy_records

## Items
|Column     |Type       |Options                                  |
|-----------|-----------|-----------------------------------------|
|name       |string     |not:null                                 |
|explanation|text       |not:null                                 |
|category   |string     |not:null                                 |
|state      |string     |not:null                                 |
|send_fee   |integer    |not:null                                 |
|region     |string     |not:null                                 |
|wait_days  |string     |not:null                                 |
|value      |integer    |not:null                                 |
|user       |references |foreign_key :true                        |
|buy_record |references |foreign_key :true                        |

### Associations
    belongs_to :user
    has_one    :buy_record

## Addresses
|Column       |Type       |Options                                  |
|-------------|-----------|-----------------------------------------|
|postal_code  |string     |not:null                                 |
|prefecture   |string     |not:null                                 |
|city         |string     |not:null                                 |
|area         |string     |not:null                                 |
|building     |text       |任意                                      |
|phone_number |string     |not:null                                 |
|buy_record   |references |foreign_key :true                        |

### Associations
    belongs_to :buy_record

## Buy_recodes
|Column       |Type       |Options                                  |
|-------------|-----------|-----------------------------------------|
|item         |references |foreign_key :true                        |
|user         |references |foreign_key :true                        |

### Associations
    belongs_to :item
    belongs_to :user
    has_one    :address