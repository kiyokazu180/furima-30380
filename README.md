## Users
|Column     |Type       |Options                                  |
|-----------|-----------|-----------------------------------------|
|nickname   |string     |not:null                                 |
|email      |string     |not:null                                 |
|pass       |string     |not:null                                 |
|name11     |string     |not:null                                 |
|name12     |string     |not:null                                 |
|name21     |string     |not:null                                 |
|name22     |string     |not:null                                 |
|birth_y    |integer    |not:null                                 |
|birth_m    |integer    |not:null                                 |
|birth_d    |integer    |not:null                                 |

### Associations
    has_many :items
    has_many :buy_records

## Items
|Column     |Type       |Options                                  |
|-----------|-----------|-----------------------------------------|
|image      |           |ActiveStorageで実装                       |
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
|Phone_number |string     |not:null                                 |

### Associations
    belongs_to :buy_record

## Buy_recodes
|Column       |Type       |Options                                  |
|-------------|-----------|-----------------------------------------|
|pay          |integer    |not:null                                 |
|address      |references |foreign_key :true                        |
|item         |references |foreign_key :true                        |
|user         |references |foreign_key :true                        |

### Associations
    belongs_to :address
    belongs_to :item
    belongs_to :user
    has_one    :address