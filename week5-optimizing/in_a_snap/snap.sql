-- =========================================
-- In a Snap - CS50 SQL Week 5
-- =========================================

-- Question 1: The app’s user engagement team needs to identify active users.
-- Find all usernames of users who have logged in since 2024-01-01.

-- Ensure the query uses the index:
-- search_users_by_last_login

-- CREATE INDEX "search_users_by_last_login"
-- ON "users"("last_login_date");

SELECT "username" FROM "users"
WHERE "last_login_date" >= '2024-01-01';

-- Question 2: Users need to be prevented from re-opening a message that has expired.
-- Find when the message with ID 151 expires.

-- Ensure the query uses the index automatically created on the primary key
-- column of the messages table.

SELECT "expires_timestamp" FROM "messages"
WHERE "id" = 151;

-- Question 3: The app needs to rank a user’s “best friends,” similar to Snapchat’s
-- “Friend Emojis” feature.
-- Find the user IDs of the top 3 users to whom creativewisdom377 sends messages
-- most frequently.
-- Order the user IDs by the number of messages sent, from highest to lowest.

-- Ensure the query uses the index:
-- search_messages_by_from_user_id

-- CREATE INDEX "search_messages_by_from_user_id"
-- ON "messages"("from_user_id");

SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" = (
SELECT "id" FROM "users"
WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY COUNT(*) DESC
LIMIT 3;

-- Question 4: The app needs to send users a summary of their engagement.
-- Find the username of the most popular user, defined as the user who has had
-- the most messages sent to them.

-- Ensure the query uses the index:
-- search_messages_by_to_user_id

-- CREATE INDEX "search_messages_by_to_user_id"
-- ON "messages"("to_user_id");

SELECT "username" FROM "users" WHERE "id" = (
    SELECT "to_user_id" FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Question 5: For any two users, the app needs to quickly show a list of the
-- friends they have in common.
-- Given the usernames:
-- lovelytrust487
-- exceptionalinspiration482
-- Find the user IDs of their mutual friends.
-- A mutual friend is a user that both users count among their friends.

-- Ensure the query uses the index automatically created on primary key columns
-- of the friends table:
-- sqlite_autoindex_friends_1

SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'exceptionalinspiration482'
);
