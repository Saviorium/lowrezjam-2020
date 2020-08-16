local scenario = {}

table.insert(scenario, { 	leftPerson = 'green', leftPersonSprite = "ugh",
						 	rightPerson = 'red', rightPersonSprite = "hmm",
						 	whoTalks = 'left',
						 	text = 'Oh nice! Now there are three of us!',
						})
table.insert(scenario, { 	leftPerson = 'green', leftPersonSprite = "ugh",
						 	rightPerson = 'red', rightPersonSprite = "hmm",
						 	whoTalks = 'right',
						 	text = 'Goddamn photo! It"s going worse and worse!',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'So why do you stoped? Go on, we need to fix this.',
						})

return scenario