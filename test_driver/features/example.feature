Feature: Fill empty mandatory information
    Scenario: Open App
        Given "scaffold-tag" loaded
        Then  I should see "firstname-tag" appeared
        Then  I should see "lastname-tag" appeared
        Then  I should see "nickname-tag" appeared
        Then  I should see "age-tag" appeared

# # action steps
# When  I fill empty text to "firstname-tag"
# Then  I fill empty text to "lastname-tag"
# Then  I fill empty text to "age-tag"
# Then  I select male
# Then  I select "syntoms-one-tag" and "syntoms-two-tag"
# Then  I tap on "save-button-tag"

