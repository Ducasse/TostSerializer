tests-objects
testBlockClosureWithContex

	| actual temp block |
	temp := 10.
	block := [temp + 2 ].
	transporter addFirstFormat: (TostWellKnownObjectFormat on: {self. self class >> testSelector. thisContext sender}).
	self serialize: block.
	
	actual := materializer materializeObject.
	
	actual should beInstanceOf: BlockClosure.
	actual value should equal: temp + 2