Feature: Fill empty mandatory information
    Scenario: Open App
        Given "form-page-tag" loaded

        # When // action
        Then I should see "firstname-tag" appeared
        # And // chain reaction

        When I should see "lastname-tag" appeared
        Then I should see "nickname-tag" appeared
        Then I should see "age-tag" appeared
        Then I tap the "male-tag" button
        Then I chill out for a bit
        Then I tap the "female-tag" button
        Then I tap the "syntom-one-tag" button
        Then I tap the "syntom-two-tag" button

        When I scroll down until find "syntom-three-tag"
        Then I tap the "syntom-three-tag" button
        Then I tap the "save-form" button
        Then I chill out for a bit

        

# # action steps
# When  I fill empty text to "firstname-tag"
# Then  I fill empty text to "lastname-tag"
# Then  I fill empty text to "age-tag"
# Then  I select male
# Then  I select "syntoms-one-tag" and "syntoms-two-tag"
# Then  I tap on "save-button-tag"

