# Fish scripts

My personal fish scripts to use with [fish shell](http://fishshell.com/)

## Instalation

  	git clone https://github.com/brunoarueira/fish-scripts ~/.config/fish

## Custom functions

|Name                  |Arguments      |Description                      |
|----------------------|---------------|---------------------------------|
|```-```               |               |cd -, return to the previous path|
|```cleanup-asl-log``` |               |remove *.asl from /private/var/log/asl/|
|```csv-show```        |csv file path  |show csv file content on the console|
|```export```          |VAR=value      |like export in bash|
|```extract```         |compressed file|extract the content of the compressed files |
|```psg```             |process name   |List all processes excluding the grep itself|
|```reload-config```   |               |Reload the fish config|
|```screenshot```      |rspec file     |set the SCREENSHOT variable with true to execute the rspec test to take a screenshot when fail|
|```toggle```          |process name   |toggle the visibility of an application on OS X|

## Contributing

1. Fork it ( https://github.com/brunoarueira/fish-scripts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
