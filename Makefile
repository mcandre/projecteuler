test: problem1.hs
	runhaskell problem1.hs

guard:
	bundle exec guard

lint:
	hlint .
