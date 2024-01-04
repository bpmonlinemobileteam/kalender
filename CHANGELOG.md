## 0.2.0
* Added initialHeightPerMinute.
* Fixed MultiDayView header shadow issue.
* Added hourLineLeftMargin to control the left margin of the hour line.

## 0.1.9
* Fixed start and end hour issue.

## 0.1.8
* Fixed enable resize option not working.
  
## 0.1.7
* Fixed alignment issues.
* Changes to layout.
* Added options to enable/disable Resizing and Rescheduling.
* ViewConfiguration is now a ChangeNotifier so making changes to it will now update the view.
* Added Custom Start and End Hours to MultiDayViewConfiguration.

#### Breaking Changes:
* onCreateEvent is now split into onCreateEvent and onEventCreated.

## 0.1.6
* Fixed some gesture bugs.
* Added name parameter to pre-defined multi day configurations.
* Fixed time indicator bug.

## 0.1.5
* Added event tileHandleBuilder for mobile.
* Added mobile reschedule / resize docs.
* Changed event tile layout to use integer values.
* Bug fixes.

## 0.1.4
* Fixed selected date.

## 0.1.3
* Updated example.
* Renamed MultiDayEventGroupLayoutController to MultiDayEventsLayoutController.

## 0.1.2
#### Breaking Changes:
* Added schedule view (so CalendarView now requires schedule widget)
* Fixed typo in CalendarEvent (modifyable => modifiable)

## 0.1.1
* Fixed custom layout delegate.

## 0.1.0

#### Breaking Changes:
* Changed the way events are rendered. (See example)
* Removed Single Day view (Is now classified as multi day view with 1 day visible).

## 0.0.8

* Fixed FirstDayOfWeek bugs.
* Tile stack improvements.

## 0.0.7

* Reworked Event Selection and Changing events.

## 0.0.6

* Added onChangeStart callback.
* Added vertical scroll lock and unlock.
* Fixed timeIndicator snap points.

## 0.0.5
* Added verticalStepDuration (Duration of each vertical step while dragging).
* Added custom LayoutControllers.
* Added custom LayoutControllers example.
* Added modifiable parameter to CalendarEvent.
* Bug fixes (Getting stuck while dragging event)

## 0.0.4

* Fixed link to web example.
* Fixed bugs on mobile.
* Removed intl dependency.

## 0.0.3

* Fixed desktop_views.png in README.md

## 0.0.2

* Fixed images in README.md

## 0.0.1

* Initial Release











