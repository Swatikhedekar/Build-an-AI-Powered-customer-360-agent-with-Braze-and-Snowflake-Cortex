--Load Data

USE DATABASE BRAZE_ENGAGEMENT;
USE SCHEMA EMAIL_DATA;

-- load data into changelog 
COPY INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."CAMPAIGN_CHANGELOGS"
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7
    FROM '@"BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_STAGE"'
)
FILES = ('CHANGELOGS_CAMPAIGN_VIEW.csv')
FILE_FORMAT = (
    TYPE=CSV,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY='"',
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO
)
ON_ERROR=ABORT_STATEMENT;

-- Insert product reviews data directly
INSERT INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."PRODUCT_REVIEWS" 
    (REVIEW_ID, USER_ID, RATING, REVIEW_TEXT, PRODUCT_SENTIMENT, REVIEW_DATE, PURCHASE_LOCATION, PRODUCT_CATEGORY, ITEM_NAME)
VALUES
    ('R-1001', '06Y1ResADlZutwm', 5, 'The denim jeans fit perfectly and the quality is exceptional for the price. I wish I had bought two pairs!', 'Positive', '2026-03-01', 'Retail Store', 'Apparel', 'Denim Jeans'),
    ('R-1002', '0MJWsStTQuYWYq7', 1, 'My coffee maker stopped working after the first week. Customer service was unhelpful and the return process is lengthy.', 'Negative', '2026-03-02', 'Online', 'Home Goods', 'Coffee Maker'),
    ('R-1003', '1NQHFvWpLpo5LkC', 4, 'Love these wireless earbuds! Great sound for the price, though the charging case feels a little cheap.', 'Positive', '2026-03-03', 'App', 'Electronics', 'Wireless Earbuds'),
    ('R-1004', '1N6R4EtkRuKEjFP', 3, 'The travel guide was adequate, but definitely focused on tourist traps. Could have found better information online.', 'Neutral', '2026-03-04', 'Retail Store', 'Books', 'Travel Guide'),
    ('R-1005', '1OEy7FFzL9n5FTl', 5, 'Gorgeous leather belt. High quality leather and the buckle looks very classy. Fast shipping too!', 'Positive', '2026-03-05', 'Online', 'Accessories', 'Leather Belt'),
    ('R-1006', '09cW2jhmIPQ6CZ8', 2, 'The Desk Organizer was broken upon arrival. The plastic is very brittle. Disappointed with the packaging.', 'Negative', '2026-03-06', 'Retail Store', 'Office Supplies', 'Desk Organizer'),
    ('R-1007', '0PCkfnjde7Pz7Ya', 5, 'This portable charger is a lifesaver. Holds multiple charges and is surprisingly slim. Five stars!', 'Positive', '2026-03-07', 'App', 'Electronics', 'Portable Charger'),
    ('R-1008', '1kQ6yr6aL53RiIi', 4, 'Great comfy throw pillow, but the colour online was slightly different than in person. Still keeping it.', 'Positive', '2026-03-08', 'Online', 'Home Goods', 'Throw Pillow'),
    ('R-1009', '1rBWPEkCfELrJvN', 1, 'The blouse I ordered was completely mis-sized. Their sizing chart is inaccurate. Painful return.', 'Negative', '2026-03-09', 'Retail Store', 'Apparel', 'Women''s Blouse'),
    ('R-1010', '1CiXHH9esPaVbPD', 5, 'Fantastic graphic novel! Gripping story and beautiful artwork. I finished it in one sitting.', 'Positive', '2026-03-10', 'Online', 'Books', 'Graphic Novel'),
    ('R-1011', '2TJbTSzVuzOLCyV', 3, 'The Ballpoint Pen Set is okay. They write smoothly, but the ink runs out very quickly. Average performance.', 'Neutral', '2026-03-11', 'App', 'Office Supplies', 'Ballpoint Pen Set'),
    ('R-1012', '1nr0Sc7qqc11Yvs', 5, 'The smartwatch is incredible. Battery lasts for days, and the fitness tracking is spot-on.', 'Positive', '2026-03-12', 'Retail Store', 'Electronics', 'Smartwatch'),
    ('R-1013', '1wVK1lM7ubrkm2X', 4, 'Very stylish sunglasses. They feel durable and the lens clarity is excellent.', 'Positive', '2026-03-13', 'Online', 'Accessories', 'Sunglasses'),
    ('R-1014', '0qQjEmXLdgz60m4', 2, 'Received the wrong colour sweater. Tried to exchange it at the store, but they were sold out. Frustrating.', 'Negative', '2026-03-14', 'Retail Store', 'Apparel', 'Wool Sweater'),
    ('R-1015', '1FSTUNOW1Rvxm9x', 5, 'The bestseller novel was a phenomenal read! A true page-turner. Highly recommend this author.', 'Positive', '2026-03-15', 'Online', 'Books', 'Bestseller Novel'),
    ('R-1016', '0aAwdB6llYxSJTf', 3, 'The kettle is functional, but it''s much louder than my previous one. Neutral experience overall.', 'Neutral', '2026-03-16', 'App', 'Home Goods', 'Electric Kettle'),
    ('R-1017', '0y1lStmktDkJe2V', 1, 'The store layout was confusing and the staff seemed more interested in talking amongst themselves.', 'Negative', '2026-03-17', 'Retail Store', 'Accessories', 'Handbag'),
    ('R-1018', '0xzqZ2V5su9JSBj', 5, 'Perfect set of noise-cancelling headphones. Essential for my commute. Worth every cent.', 'Positive', '2026-03-18', 'Online', 'Electronics', 'Noise-Cancelling Headphones'),
    ('R-1019', '2TYPHX063nLHydF', 4, 'The Notebook has high quality paper. Only drawback is the cover scratches easily.', 'Positive', '2026-03-19', 'App', 'Office Supplies', 'Lined Notebook'),
    ('R-1020', '10ltT8M0ESCZD8M', 2, 'The Premium T-Shirt shrank significantly after the first wash, even following the care instructions.', 'Negative', '2026-03-20', 'Retail Store', 'Apparel', 'Premium T-Shirt');

-- load data into email sends tables
COPY INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_SENDS"
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27
    FROM '@"BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_STAGE"'
)
FILES = ('USERS_MESSAGES_EMAIL_SEND_VIEW.csv')
FILE_FORMAT = (
    TYPE=CSV,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY='"',
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO
)
ON_ERROR=ABORT_STATEMENT;

-- load data into email opens tables
COPY INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_OPENS"
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29
    FROM '@"BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_STAGE"'
)
FILES = ('USERS_MESSAGES_EMAIL_OPEN_VIEW.csv')
FILE_FORMAT = (
    TYPE=CSV,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY='"',
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO
)
ON_ERROR=ABORT_STATEMENT;

-- load data into email clicks tables
COPY INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_CLICKS"
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, null, $28, $29, $30, $31
    FROM '@"BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_STAGE"'
)
FILES = ('USERS_MESSAGES_EMAIL_CLICK_VIEW.csv')
FILE_FORMAT = (
    TYPE=CSV,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY='"',
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO
)
ON_ERROR=ABORT_STATEMENT;

-- load data into email unsubscribes tables
COPY INTO "BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_UNSUBSCRIBES"
FROM (
    SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24
    FROM '@"BRAZE_ENGAGEMENT"."EMAIL_DATA"."EMAIL_STAGE"'
)
FILES = ('USERS_MESSAGES_EMAIL_UNSUBSCRIBE_VIEW.csv')
FILE_FORMAT = (
    TYPE=CSV,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY='"',
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO
)
ON_ERROR=ABORT_STATEMENT;


select * from BRAZE_ENGAGEMENT.EMAIL_DATA.PRODUCT_REVIEWS;

