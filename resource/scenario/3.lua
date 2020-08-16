local scenario = {}

table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "hmm",
						 	rightPerson = 'orange', rightPersonSprite = "huh",
						 	whoTalks = 'left',
						 	text = 'What the..?',
						})
	     
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'orange', rightPersonSprite = "huh",
						 	whoTalks = 'right',
						 	text = 'Um, why there is another me? Why is she blue?',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						rightPerson = 'orange', rightPersonSprite = "huh",
						whoTalks = 'right',
						text = 'Is something wrong with me?!',
				   })
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "neutral",
						 	rightPerson = 'orange', rightPersonSprite = "hmm",
						 	whoTalks = 'left',
						 	text = 'There should be some logic... I need too...',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "what",
						 	rightPerson = 'orange', rightPersonSprite = "huh",
						 	whoTalks = 'right',
						 	text = 'Why there are TWO OF ME?!',
						})
table.insert(scenario, { 	leftPerson = 'blue', leftPersonSprite = "ugh",
						 	rightPerson = 'orange', rightPersonSprite = "huh",
						 	whoTalks = 'left',
						 	text = 'SIGH...',
						})

return scenario
