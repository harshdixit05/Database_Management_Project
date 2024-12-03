create database fitness;
use fitness;


-- Subscription Table
CREATE TABLE Subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(255) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    duration_in_months INT NOT NULL,
    features TEXT
);

-- Member Table
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    membership_start DATE NOT NULL,
    membership_end DATE NOT NULL,
    subscription_id INT,
    FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);

-- Trainer Table
CREATE TABLE Trainer (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    availability VARCHAR(50) NOT NULL
);

-- Class Table
CREATE TABLE Class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(255) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    trainer_id INT,
    max_participants INT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);

-- MemberClassEnrollment Table (Junction table for many-to-many relation between Member and Class)
CREATE TABLE MemberClassEnrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    class_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Insert into Subscription Table
INSERT INTO Subscription (plan_name, cost, duration_in_months, features) VALUES 
('Monthly', 50.00, 1, 'Access to gym and yoga classes'),
('Quarterly', 140.00, 3, 'Access to all facilities and classes'),
('Annual', 500.00, 12, 'Full access and free personal training sessions'),
('Weekly', 20.00, 0, 'Access to gym only'),
('Student Plan', 30.00, 1, 'Discounted rate for students'),
('Senior Plan', 40.00, 1, 'Access for senior citizens'),
('Premium Annual', 600.00, 12, 'Full access and unlimited classes'),
('Couples Plan', 90.00, 1, 'Access for couples'),
('Corporate Plan', 300.00, 6, 'Corporate discount rate'),
('Trial', 10.00, 0, '1-week access to gym');

-- Insert into Member Table with Indian Names
INSERT INTO Member (first_name, last_name, email, phone, dob, gender, membership_start, membership_end, subscription_id) VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1992-01-15', 'Male', '2023-01-01', '2023-12-31', 1),
('Priya', 'Verma', 'priya.verma@example.com', '9876543221', '1989-02-10', 'Female', '2023-03-01', '2023-06-30', 2),
('Amit', 'Patel', 'amit.patel@example.com', '9876543232', '1990-05-20', 'Male', '2023-06-01', '2023-06-30', 4),
('Sneha', 'Kapoor', 'sneha.kapoor@example.com', '9876543243', '1995-11-12', 'Female', '2023-05-01', '2023-10-31', 3),
('Vikram', 'Singh', 'vikram.singh@example.com', '9876543254', '1988-07-25', 'Male', '2023-07-01', '2024-06-30', 1),
('Megha', 'Iyer', 'megha.iyer@example.com', '9876543265', '1993-08-14', 'Female', '2023-08-01', '2024-07-31', 5),
('Arjun', 'Desai', 'arjun.desai@example.com', '9876543276', '1991-03-30', 'Male', '2023-02-01', '2023-12-31', 3),
('Radhika', 'Menon', 'radhika.menon@example.com', '9876543287', '1994-09-09', 'Female', '2023-09-01', '2023-09-30', 4),
('Kiran', 'Rao', 'kiran.rao@example.com', '9876543298', '1996-12-01', 'Male', '2023-06-01', '2023-06-30', 2),
('Sonal', 'Jain', 'sonal.jain@example.com', '9876543309', '1997-04-18', 'Female', '2023-04-01', '2023-07-31', 1);

-- Insert into Trainer Table with Indian Names

INSERT INTO Trainer (first_name, last_name, specialty, phone, email, experience, salary, availability) VALUES
('Ravi', 'Kumar', 'Yoga', '9876543310', 'ravi.kumar@example.com', 5, 50000.00, 'Morning'),
('Sanya', 'Shah', 'Weight Training', '9876543321', 'sanya.shah@example.com', 3, 45000.00, 'Evening'),
('Anil', 'Mehta', 'Cardio', '9876543332', 'anil.mehta@example.com', 7, 52000.00, 'Afternoon'),
('Pooja', 'Chaudhary', 'Pilates', '9876543343', 'pooja.chaudhary@example.com', 4, 47000.00, 'Morning'),
('Manish', 'Joshi', 'CrossFit', '9876543354', 'manish.joshi@example.com', 6, 51000.00, 'Evening'),
('Tina', 'Agarwal', 'Aerobics', '9876543365', 'tina.agarwal@example.com', 2, 43000.00, 'Afternoon'),
('Siddharth', 'Reddy', 'Swimming', '9876543376', 'siddharth.reddy@example.com', 8, 55000.00, 'Morning'),
('Neha', 'Ghosh', 'Dance Fitness', '9876543387', 'neha.ghosh@example.com', 3, 44000.00, 'Evening'),
('Abhishek', 'Bhatt', 'Strength Training', '9876543398', 'abhishek.bhatt@example.com', 10, 60000.00, 'Morning'),
('Ritika', 'Mukherjee', 'Zumba', '9876543409', 'ritika.mukherjee@example.com', 1, 40000.00, 'Afternoon');

-- Insert into Class Table with Indian Names
INSERT INTO Class (class_name, start_time, end_time, trainer_id, max_participants) VALUES
('Yoga', '08:00:00', '09:00:00', 1, 20),
('Weight Training', '18:00:00', '19:00:00', 2, 15),
('Cardio', '12:00:00', '13:00:00', 3, 25),
('Pilates', '09:00:00', '10:00:00', 4, 10),
('CrossFit', '19:00:00', '20:00:00', 5, 15),
('Aerobics', '14:00:00', '15:00:00', 6, 20),
('Swimming', '07:00:00', '08:00:00', 7, 10),
('Dance Fitness', '17:00:00', '18:00:00', 8, 12),
('Strength Training', '10:00:00', '11:00:00', 9, 15),
('Zumba', '15:00:00', '16:00:00', 10, 18);

-- Insert into MemberClassEnrollment Table
INSERT INTO MemberClassEnrollment (member_id, class_id, enrollment_date) VALUES
(1, 1, '2023-08-01'),
(2, 2, '2023-09-15'),
(3, 3, '2023-07-20'),
(4, 4, '2023-09-10'),
(5, 1, '2023-08-05'),
(6, 5, '2023-07-25'),
(7, 6, '2023-08-10'),
(8, 7, '2023-09-01'),
(9, 8, '2023-09-12'),
(10, 9, '2023-08-20');

-- Add a stored procedure to retrieve all member details based on subscription type
DELIMITER //
CREATE PROCEDURE GetMembersBySubscription(IN subscription_type VARCHAR(255))
BEGIN
    SELECT 
        m.member_id, 
        m.first_name, 
        m.last_name, 
        m.email, 
        m.phone, 
        s.plan_name
    FROM 
        Member m
    INNER JOIN 
        Subscription s ON m.subscription_id = s.subscription_id
    WHERE 
        s.plan_name = subscription_type;
END //
DELIMITER ;

-- Add a stored procedure to retrieve all classes conducted by a specific trainer
DELIMITER //
CREATE PROCEDURE GetClassesByTrainer(IN trainer_name VARCHAR(255))
BEGIN
    SELECT 
        c.class_id, 
        c.class_name, 
        c.start_time, 
        c.end_time, 
        t.first_name, 
        t.last_name
    FROM 
        Class c
    INNER JOIN 
        Trainer t ON c.trainer_id = t.trainer_id
    WHERE 
        CONCAT(t.first_name, ' ', t.last_name) = trainer_name;
END //
DELIMITER ;

-- Add a stored procedure to update a member's subscription
DELIMITER //
CREATE PROCEDURE UpdateMemberSubscription(IN member_id INT, IN new_subscription_id INT)
BEGIN
    UPDATE 
        Member
    SET 
        subscription_id = new_subscription_id,
        membership_start = CURDATE(),
        membership_end = DATE_ADD(CURDATE(), INTERVAL (SELECT duration_in_months FROM Subscription WHERE subscription_id = new_subscription_id) MONTH)
    WHERE 
        member_id = member_id;
END //
DELIMITER ;

-- Add a stored procedure to retrieve the total revenue generated by each subscription plan
DELIMITER //
CREATE PROCEDURE GetTotalRevenueBySubscription()
BEGIN
    SELECT 
        s.plan_name, 
        COUNT(m.member_id) AS total_members, 
        SUM(s.cost) AS total_revenue
    FROM 
        Subscription s
    LEFT JOIN 
        Member m ON s.subscription_id = m.subscription_id
    GROUP BY 
        s.plan_name;
END //
DELIMITER ;

-- Add a trigger to automatically calculate and update the membership_end date based on the subscription plan
DELIMITER //
CREATE TRIGGER UpdateMembershipEndDate
BEFORE INSERT ON Member
FOR EACH ROW
BEGIN
    SET NEW.membership_end = DATE_ADD(NEW.membership_start, INTERVAL (SELECT duration_in_months FROM Subscription WHERE subscription_id = NEW.subscription_id) MONTH);
END //
DELIMITER ;

-- Add a trigger to validate that a class doesn't exceed the maximum participants during enrollment
DELIMITER //
CREATE TRIGGER ValidateMaxParticipants
BEFORE INSERT ON MemberClassEnrollment
FOR EACH ROW
BEGIN
    DECLARE current_count INT;
    SELECT 
        COUNT(*) INTO current_count
    FROM 
        MemberClassEnrollment
    WHERE 
        class_id = NEW.class_id;
    IF current_count >= (SELECT max_participants FROM Class WHERE class_id = NEW.class_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Class is already full. Enrollment cannot proceed.';
    END IF;
END //
DELIMITER ;

-- Add a view to get an overview of class schedules and trainer information
CREATE VIEW ClassSchedule AS
SELECT 
    c.class_id,
    c.class_name,
    c.start_time,
    c.end_time,
    t.first_name AS trainer_first_name,
    t.last_name AS trainer_last_name,
    c.max_participants
FROM 
    Class c
INNER JOIN 
    Trainer t ON c.trainer_id = t.trainer_id;

-- Add a view to get an overview of all active members
CREATE VIEW ActiveMembers AS
SELECT 
    member_id,
    first_name,
    last_name,
    email,
    phone,
    membership_start,
    membership_end
FROM 
    Member
WHERE 
    membership_end >= CURDATE();

-- Add a query to fetch the most popular classes based on the number of enrollments
SELECT 
    c.class_name, 
    COUNT(e.enrollment_id) AS total_enrollments
FROM 
    Class c
LEFT JOIN 
    MemberClassEnrollment e ON c.class_id = e.class_id
GROUP BY 
    c.class_name
ORDER BY 
    total_enrollments DESC
LIMIT 5;

-- Add a query to fetch the trainer with the highest number of classes assigned
SELECT 
    t.trainer_id, 
    CONCAT(t.first_name, ' ', t.last_name) AS trainer_name, 
    COUNT(c.class_id) AS total_classes
FROM 
    Trainer t
LEFT JOIN 
    Class c ON t.trainer_id = c.trainer_id
GROUP BY 
    t.trainer_id, t.first_name, t.last_name
ORDER BY 
    total_classes DESC
LIMIT 1;

-- Add a query to fetch all members whose membership expires in the next 30 days
SELECT 
    member_id, 
    first_name, 
    last_name, 
    email, 
    phone, 
    membership_end
FROM 
    Member
WHERE 
    membership_end BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY 
    membership_end ASC;

-- Add a query to fetch revenue trends by month
SELECT 
    DATE_FORMAT(membership_start, '%Y-%m') AS month, 
    SUM(s.cost) AS monthly_revenue
FROM 
    Member m
INNER JOIN 
    Subscription s ON m.subscription_id = s.subscription_id
GROUP BY 
    DATE_FORMAT(membership_start, '%Y-%m')
ORDER BY 
    month DESC;
