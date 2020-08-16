local scenario = {}

table.insert(scenario, { 	leftPerson = 'red', leftPersonSprite = "neutral",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'What the...',
						})
table.insert(scenario, { 	leftPerson = 'red', leftPersonSprite = "neutral",
						 	rightPerson = 'green', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'How is that possible..?' ,
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'green', rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'Keeping in mind all that happened today, I think we should no longer be surprised by now.',
						})

return scenario