Create Table CalUser
(
UserEmailAddress varchar(30) NOT NULL,
UserFullName varchar(30) NOT NULL,
MobilePhoneNo varchar(11) NOT NULL,
PRIMARY KEY (UserEmailAddress)
)

Create Table CalInvitation
(
UserEmailAddress varchar(30) NOT NULL,
EventID varchar(5) NOT NULL,
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress),
FOREIGN KEY (EventID) REFERENCES CalEvent(EventID)
)

Create Table CalGroupMembers
(
GroupID varchar(5) NOT NULL,
GroupAdmin varchar(30) NOT NULL,
UserEmailAddress varchar(30) NOT NULL,
GroupName varchar(30) NOT NULL,
FOREIGN KEY (GroupID, GroupAdmin) REFERENCES CalGroup(GroupID, GroupAdmin),
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress)


)

Create Table CalGroupInvitation
(
EventID varchar(5) NOT NULL,
GroupID varchar(5) NOT NULL,
GroupAdmin varchar(30) NOT NULL,
UserEmailAddress varchar(30) NOT NULL,
FOREIGN KEY (EventID) REFERENCES CalEvent(EventID),
FOREIGN KEY (GroupID, GroupAdmin) REFERENCES CalGroup(GroupID, GroupAdmin),
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress)

)

Create Table CalGroup
(
GroupID varchar(5) NOT NULL,
GroupAdmin varchar(30) NOT NULL,
UserEmailAddress varchar(30) NOT NULL,
GroupName varchar(30) NOT NULL,
PRIMARY KEY (GroupID, GroupAdmin),
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress)


)

Create Table CalEvent
(
EventID varchar(5) NOT NULL,
UserEmailAddress varchar(30) NOT NULL,
EventName varchar(20) NOT NULL,
Location varchar(20),
StartDateTime datetime NOT NULL,
FinshDateTime datetime NOT NULL,
Invitees varchar(20),
Notes varchar(100),
PRIMARY KEY (EventID),
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress)
)

Create Table CalContact
(
UserEmailAddress varchar(30) NOT NULL,
UserFullName varchar(30) NOT NULL,
MobilePhoneNo varchar(11) NOT NULL,
FOREIGN KEY (UserEmailAddress) REFERENCES CalUser(UserEmailAddress)
)
