# DeclarativeTestGeneration

A simple, lightweight project that allows Salesforce Flows to run as Apex Unit tests.

## How to use

1. Install the package
1. Write a flow that tests some piece of functionality and set the name to start with test\_
1. Add a decision to the end of the flow that checks if the automation ran as expected
1. Create a text variable called Result, set it for output
1. If the functionality ran as expected, set the output variable to 'Success'
1. If the functionality didn't run as expected, set the output variable to an human readable error message.
1. In setup, navigate to apex test execution, and run the DeclarativeTestRunner apex test
1. If your functionality does not work as expected, one of the tests that are part of DeclarativeTestRunner will fail, with your error message.

## Example use case, included in the package:

1. Create a record triggered flow that creates 5 accounts and inserts them.
1. After the insert element, query accounts for the names of the new accounts
1. Add a decision that checks your query returned 5 records
1. Create an output text variable named 'Result'
1. If the query returned 5 records, set the Result variable to "Success"
1. If the query returned some other count of records, set the Result variable to a formula that shows the expected and actual count of records returned.
1. Save the flow, and set the flow name to start with Test\_

Note - you do not need to activate your flow, and it does not need to set up other automation to trigger it, the flow will be triggered automatically.

##Key Naming Conventions
All testing flows must have:

- A name that start with test\_
- An output text variable named Result that is set to 'Success' on passing criteria

## Development

See Wiki for further resources.
See Issues for how you can help.

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.
