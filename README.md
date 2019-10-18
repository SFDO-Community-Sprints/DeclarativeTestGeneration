# DeclarativeTestGeneration

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
1. Create the "Solution Components" wiki page
1. Created template APEX class
1. Demonstrated proof of concept with test flows for Workflow Rules and Process Builder, successfully retrieving 'result' variable string from flows.

### Future Contributions (AKA what were you unable to finish at the Sprint)

1. Modify template class to guarantee running user uniqueness (Username must be unique globally across test and production usernames).
1. Develop UI for end users to invoke template class.
1. Need controller class for UI with button to enter flow name, select running user Profile, with deploy/commit/save action.
1. ToolingAPI grabs template APEX class, passes in flow name and user Profile.
1. Assert test flow is active
1. Intra-test logging by returning more comprehensive result object out of flow
