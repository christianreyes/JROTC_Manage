# JROTC Manage

An open-source management application for Junior Reserve Officers' Training Corps units.

When completed, the JROTC Manage system will track:
* cadets
* events
* ribbons
* awards
* PRT
* advancements (including tests)

JROTC Manage has many benefits over the traditional systems in place, most of which are derived from the ability of cadets to be able to easily view what has been recorded for them.

Currently, many units track event and ribbon data with spreadsheets or paper forms. Methodologies which can easily lead to errors or inaccountability.

## Current status

The application is currently in a prototyping stage and does not fully address the scope of managing cadets, ribbons, or events. The system will soon have authentication required in order to minimize junk data.

Also, most of this did not get implemented.

![Screenshot](/screenshot.jpg)

## Short term development goal (Summer 2011)

By the end of Summer 2011, we plan to have the system managing cadet, event, ribbon, and award data. All other features will be on hold or in a prototyping / experimental phase. The system is planned to be trial tested as a management system by one unit. The trial will be extended to other units after the initial trial period.

The system will most likely not be under active development during the academic school year, but patches will be issued and support will be available to quickly resolve problems.

## Resources

Application link: http://jrotcmanage.heroku.com

Entity-Relationship Diagram: http://www.gliffy.com/publish/2588747/

Run this command to get your database set up:
    rake db:migrate

Run this command to populate the database with the ribbons:
    rake db:populate
