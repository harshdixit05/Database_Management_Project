

# Fitness Center Management System

## Description
The Fitness Center Management System is a relational database designed to efficiently manage member subscriptions, class schedules, and trainer assignments. It provides comprehensive solutions for organizing data about members, classes, trainers, and subscriptions. 

This system uses **MySQL** to create and manage tables, define constraints, and implement triggers and stored procedures for automated and efficient database operations.


## Features

### 1. **Member Management**
   - Maintains detailed member profiles, including:
     - `member_id` (Primary Key)
     - `name`
     - `email`
     - `contact_number`
     - `membership_start_date`
     - `membership_end_date`
   - Ensures unique emails for each member.

### 2. **Class Scheduling**
   - Organizes fitness classes with the following attributes:
     - `class_id` (Primary Key)
     - `class_name`
     - `class_time`
     - `class_duration`
     - `trainer_id` (Foreign Key linking to Trainers table)
   - Automatically updates class capacity when members are added to classes.

### 3. **Trainer Profiles**
   - Tracks trainers' profiles and expertise:
     - `trainer_id` (Primary Key)
     - `trainer_name`
     - `specialization`
     - `contact_number`
   - Links trainers to specific classes.

### 4. **Subscription Management**
   - Handles member subscriptions with details such as:
     - `subscription_id` (Primary Key)
     - `member_id` (Foreign Key linking to Members table)
     - `subscription_type`
     - `start_date`
     - `end_date`
   - Implements validation triggers to prevent overlapping subscriptions for members.



## Database Schema
### Tables
- **Members**: Stores member information.
- **Classes**: Contains class schedules and details.
- **Trainers**: Tracks trainer profiles.
- **Subscriptions**: Manages subscriptions and links them to members.

### Relationships
- Classes are linked to Trainers via `trainer_id`.
- Subscriptions are linked to Members via `member_id`.



## Automation & Constraints
### Triggers
- Automatically decrement class capacity when a member is added.
- Ensure subscription dates do not overlap for the same member.

### Stored Procedures
- Add members to classes and update capacities.
- Retrieve class schedules and trainers based on specific queries.



## How to Use
1. **Set Up the Database**  
   - Create the schema using the provided SQL scripts.
   - Ensure the necessary constraints and relationships are established.

2. **Insert Data**  
   - Populate tables with sample data for members, trainers, classes, and subscriptions.

3. **Perform Operations**  
   - Use the stored procedures and queries to:
     - Assign members to classes.
     - View trainer schedules.
     - Monitor subscription validity.

4. **Modify Data**  
   - Add, update, or delete entries in any table, ensuring all constraints and triggers function correctly.



## Future Enhancements
- **User Interface**: Develop a frontend application for easy interaction with the database.
- **Analytics**: Add reports on class popularity and trainer performance.
- **Notifications**: Implement alerts for subscription renewals or class updates.


