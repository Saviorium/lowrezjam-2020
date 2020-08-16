local scenario = {}

table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "hehe",
						 	rightPerson = 'red', rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'I always knew we could work as a team.',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'Yeah whatever.' ,
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'red', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'I wish that shit will end soon',
						})
table.insert(scenario, { 	leftPerson = 'green', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'That\'s the spirit!',
						})

return scenario