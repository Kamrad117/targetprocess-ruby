# Targetprocess

[![Code Climate]
(https://codeclimate.com/github/Kamrad117/targetprocess-ruby.png)]
(https://codeclimate.com/github/Kamrad117/targetprocess-ruby)

Gem provides ruby interface for interaction with 
[Targetprocess](http://www.targetprocess.com/) through REST api.
In development now!
## Installation

Add this line to your application's Gemfile:

    gem 'targetprocess'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install targetprocess

## Usage

####Configuration
For rails usage you may put following code to 
config/initializers/targetprocess.rb or use anywhere you need it.

    Targetprocess.configure do |config|
      config.domain = "http://ACCOUNT.tpondemand.com/api/v1/"
      config.username = "USERNAME"
      config.password = "SECRET"
    end  
    
Do not confuse: ACCOUNT - targetprocess.com login;
PASSWORD and USERNAME - your entire ACCOUNT.tpondemand.com credential.   
    
To check configuration:

    > Targetprocess.credentials #=> 
    #<Targetprocess::Configuration:0x00000004fa7b80
    @domain="http://myacc.tpondemand.com/api/v1/",
    @password="login",
    @username="secret">

###CRUD

Now we support next entities: `UserStory`, `User`, `Task`, `TestCase`, `Project`,
`Release`, `Request`, `Iteration`, `Impediment`, `Feature`, `Comment`, `Bug`.
Others coming soon.
####Read
Gem provides 3 read methods: `.find(id, options={})`, `.all(options={})`, 
`.where(search condition)`
(Yeah, the goal was to make it mostly similar to ActiveRecord).

#####.find(id, options={})
Return instance with specified `:id`.

    > Targetprocess::UserStory.find(160) #=>
         #<Targetprocess::UserStory:0x00000005566ad0
         @id=160,
         @name="Advanced REST API",
         @description=nil,
         @createdate=
          #<DateTime: 2013-05-23T10:00:00+00:00 ((2456436j,36000s,0n),+0s,2299161j)>,
         @customfields=nil,
         @description=nil,
         @effort=14.0,
            . . . .
         @timeremain=0.0,
         @timespent=0.0>

#####.all(options={})

Returns array of instances`(25 by default)`, but you can get more
specifying .all(take: 50). You can not have more then 1000 items per request. 
If you set 'take' parameter greater than 1000, it will be treated as 1000.
If you want to get next 1000 you can specify 'skip' parameter like this:
`Targetprocess::Bug.all({take: 1000, skip: 1000})`

    > Targetprocess::UserStory.all  #=> #return array of (25 by default) UserStories
    > Targetprocess::UserStory.all(take:50) #=> #return array of 50 Userstories
    > Targetprocess::UserStory.all(take:50, skip: 50) #=> #return array of next 50 Userstories
    
#####.where(search_condition)
Return array of filter entities according to specified request. 
You can filter by any of parameters with avaliable matchers:

| Matcher       | Example       | 
| ------------- |:-------------:| 
Equality| Name eq 'My Name'
Not equality|	Name ne 'My Name'
Greater than|	Id gt 5
Greater than or equal|	Project.Id gte 5
Less than|	CreateDate lt '2011-10-01'
Less than or equal|	TimeSpent lte 5.0
In list	|Id in (155,156)
Contains	|Name contains 'rest'
Is null	|Release is null
Is not null|	Description is not null    

    > Targetprocess::Comment.where('general.id eq 182') #=> 
        [#<Targetprocess::Comment:0x00000005658c18
        @id=2,
        @createdate=
        #<DateTime: 2013-07-08T02:36:54+00:00 ((2456482j,9414s,0n),+0s,2299161j)>,
        @description="<div>123</div>\n",
        @general={:id=>182, :name=>"Edit Area 1"},
        @general_id=182,
        @general_name="Edit Area 1",
        @owner={:id=>1, :firstname=>"Administrator", :lastname=>"Administrator"},
        @owner_firstname="Administrator",
        @owner_id=1,
        @owner_lastname="Administrator",
        @parent_id=nil,
        @parentid=nil>]

Also you can combine several filtering conditions using operator `and`:

`.where("(createdate gt '2011-01-01') and (enddate lt '2011-02-01')")`

#####Available options



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
