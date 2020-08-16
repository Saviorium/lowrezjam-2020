local scenario = {}

table.insert(scenario, { 	leftPerson = 'red', leftPersonSprite = "huh",
						 	rightPerson = nil, rightPersonSprite = "neutral",
						 	whoTalks = 'left',
						 	text = 'What the...',
						})
table.insert(scenario, { 	leftPerson = 'red', leftPersonSprite = "ugh",
						 	rightPerson = 'blue', rightPersonSprite = "hmm",
						 	whoTalks = 'right',
						 	text = 'How is that possible..?' ,
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "hmm",
						 	rightPerson = 'green', rightPersonSprite = "neutral",
						 	whoTalks = 'right',
						 	text = 'Keeping in mind all that happened today..',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "hmm",
						rightPerson = 'green', rightPersonSprite = "what",
						whoTalks = 'right',
						text = 'I think we should no longer be surprised by now.',
				   })

return scenario