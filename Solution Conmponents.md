### Solution Components

## MVP
- Sample Flow
- Test Class Generator
- Custom Metadata Type
  - Flow (Name, Built)
  - Assertions (^Flow, Custom assert definition)
- App
    - Build Test from CMT
  - Execute test from apex with TEST keyword?

## Future Enhancements
- Simple Assertions 
- Sandbox mode (complex logging)
  - identified test user (delete where created/modified = testuser)
  - rollback for teardown
    - evaluations stored in heap, rather than assertions (as would be used in test framework)
    - rollback all DML at end of test flow to teardown test data, then write log, evaluations data an persist
  - App
    - Rebuild all tests from CMT
    - Test definition/edit UI
    - Selective test execution

