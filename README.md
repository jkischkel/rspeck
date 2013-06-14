RSpeck
======

Combines `rspec v.1` with `ack` to run all examples that match a pattern.

For example, running all examples about status code 4xx works like this:

```
$ rspeck "status 4\d{2}"
```

This produces a result like:

```
######### testing spec/acceptance/settings/list_settings_spec.rb:91 #########
returns status 422 if start parameter is omitted
.

######### testing spec/acceptance/service/user_service_spec.rb:185 #########
returns status 412 if client is not authorized
.
```

## Requirements ##
RSpeck requires either `ack` or `ack-grep`, depending on the platform.

OSX:

```
brew install ack 
```

Ubuntu:

```
sudo apt-get install ack-grep
```


## Usage ##

#### Install It ####
From Rubygems:

```
gem install rspeck
```

Local:

```
gem build rspeck.gemspec
gem install rspeck-0.1.1.gem
```

As a shell function so you can avoid all the bloat and have some idea what's running on your own machine:
```
cat <<EOF
function rspeck() {
  ack "$*" spec/ | cut -d: -f1-2 | while read line
  do
    echo "Testing $line"
    rspec $line
  done
}
EOF >> ~/.bashrc #or ~/.zshrc if you're hip

#### How does this even work? ####
Lets say we want to run all examples that contain 'returns nil':

```
rspeck "returns nil"
```

This runs `ack`, with a result like this:

```
spec/unit/notifications/runnable_spec.rb
128:      it "returns nil" do
```

The result is parsed to run the example:

```
bundle exec rake spec SPEC=spec/unit/notifications/runnable_spec.rb:128
```

If multiple matches are found, all of them are tested.


## TODO ##
* add support for rspec command line arguments
* batch examples instead of running them one by one
* optimize output
* more arguments for customization
  - flag for displaying stderr
* man page
