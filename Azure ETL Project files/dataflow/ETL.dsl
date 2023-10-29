source(output(
		EEID as string,
		{Full Name} as string,
		{Job Title} as string,
		Department as string,
		{Business Unit} as string,
		Gender as string,
		Ethnicity as string,
		Age as string,
		{Hire Date} as string,
		{Annual Salary} as string,
		{Bonus %} as string,
		Country as string,
		City as string,
		{Exit Date} as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false) ~> source
source filter(equals('IT', Department)) ~> filterforITDept
filterforITDept sink(allowSchemaDrift: true,
	validateSchema: false,
	partitionFileNames:['final'],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1)) ~> sink