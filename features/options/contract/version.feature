@prepare @options @version
Feature: osrm-contract command line options: version
# the regex will match these two formats:
# v0.3.7.0          # this is the normal format when you build from a git clone
# -128-NOTFOUND     # if you build from a shallow clone (used on Travis)

    Background:
        Given the profile "testbot"

    Scenario: osrm-contract - Version, long
        When I run "osrm-contract --version"
        Then stderr should be empty
        And stdout should contain 1 line
        And stdout should contain /(v\d{1,2}\.\d{1,2}\.\d{1,2}|\w*-\d+-\w+)/
        And it should exit with code 0
