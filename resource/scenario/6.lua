local scenario = {}

table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'What is now?',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'This door you idiot! Urgh of course it does not exist for you.' ,
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Looks like I have to get my sweet unlucky charms out. ',
						})


return scenario