all: style init rspec kitchen

init:
	berks update
	berks install

style:
	chef exec foodcritic .
	chef exec rubocop .

rspec:
	chef exec rspec -fd --color

kitchen:
	chef exec kitchen test
