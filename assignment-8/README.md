# Assignment 8: Classroom Inventory

## Decisions I made and why

I split the data into `rooms`, `kinds` and `devices`, so each name is stored once and a typo can't create a new kind. The inventory number is `UNIQUE NOT NULL` but not the PRIMARY KEY, because a sticker can be reprinted or renumbered, and the `id` should stay the same when that happens. A device in storage has no room, so `room_id` is NULL instead of pointing to a fake "Storage" room. I don't store the age, because it changes every day and the query can calculate it from `purchase_date`.
