# DeclarativeTestGeneration

Add a brief description of this project here, in Markdown format.
It will be shown on the main page of the project's GitHub repository.

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.

### Project Vision (Your first task as a team)
Current test framework is handled by APEX code and is not easily applicable to declarative customization. A test framework for declarative automation, with a regression test function created using Flow, administrators could create new customizations without worrying about whether a validation rule or Process Builder automation was breaking other components of their organization.
This framework and test functionality would be most helpful for administrators and implementation partners adding declarative customizations to Salesforce organizations where code maintenance is not practical.
### Project Team
* Team Leader(s): Chris Pifer
* GitHub Scribe(s): Brian Ricter, Fatma Ahmed
* List of all Contributors: Jim Letts, Jason Cook, Brian Weldon

### Project Resources
* Wiki within this repository contains Business Requirements and Limitations.

### Project Team Accomplishments
1. Created the "Business Rquirements" wiki page that explains the specs for a "crawl" phase
2. Create the "Solution Components" wiki page
3. Created template APEX class
4. Demonstrated proof of concept with test flows for Workflow Rules and Process Builder, successfully retrieving 'result' variable string from flows.

### Future Contributions (AKA what were you unable to finish at the Sprint)

**Important**: If you have specific asks to help move this project forward we would recommend that you list them here, but also create separate Issues for each and add the label of "help wanted". This is a well-worn best practice for projects living in GitHub.
>>>>>>> a05f5c7d43e216802a52a62146c19a512d263d89
