local scenario = {}

table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "hmm",
						 	whoTalks = 'left',
						 	text = 'What is now?',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "ugh",
						 	whoTalks = 'right',
						 	text = 'This door you idiot! Urgh of course it does not exist for you.' ,
						})
table.insert(scenario, { 	leftPerson = 'green', leftPersonSprite = "hehe",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Looks like I have to get my sweet unlucky charms out. ',
						})


return scenario