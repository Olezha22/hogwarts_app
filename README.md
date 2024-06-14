# hogwards_app

This is a flutter application which works on ios and android
The app is developed using bloc state management
Also I have added functionality that allow us use app without internet so I have used Hive for local database

## HomeScreen

The screen consists of a table on top of attempts to guess a specific character that is on our page, below is a photo and the name of the character, and below that are fields with the student's choice of faculty, if the student chose correctly or incorrectly, the attempts are updated, a snack bar with success or failure is displayed, and moves to random next character. Also there is pull to fresh if we do it it also randomly shows another character. And in app bar is button reset when you press it resets all of your data.

## ListScreen

This screen displays a table with the total number of attempts. At the bottom there is a search bar that searches for elements according to what you wrote. the app bar also has a reset button that resets all data. And under the search there is a list of elements that we tried to guess, for those who did not guess, there is a button that allows you to guess again. clicking on an element opens a detailed page about the character.

## DetailsScreen

This screen displays a photo and detailed information about the character. If we have not guessed the character yet, we are not allowed to see this data.

### Something else

if we do not have internet connection app is completely working but instead of internet image it shows image from asset which describes no internet.
