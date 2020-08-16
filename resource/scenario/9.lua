local scenario = {}

table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Oh no...',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'green', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'It\'s no longer double trouble... what it will be for six?' ,
						})
table.insert(scenario, { 	leftPerson = 'red', leftPersonSprite = "neutral",
						 	rightPerson = 'green', rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Soon we will need joke for 255 troubles.',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Girls, jokes aside. We need to climb up the nearest pipe.',
						})
return scenario