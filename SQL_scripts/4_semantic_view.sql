USE DATABASE BRAZE_ENGAGEMENT;
USE SCHEMA EMAIL_DATA;

CREATE OR REPLACE SEMANTIC VIEW CAMPAIGN_ANALYTICS_VIEW
  TABLES (
    sends AS BRAZE_ENGAGEMENT.EMAIL_DATA.EMAIL_SENDS
      PRIMARY KEY (ID)
      COMMENT = 'Email send events from Braze campaigns',

    opens AS BRAZE_ENGAGEMENT.EMAIL_DATA.EMAIL_OPENS
      PRIMARY KEY (DISPATCH_ID, EXTERNAL_USER_ID)
      COMMENT = 'Email open events from Braze campaigns',

    clicks AS BRAZE_ENGAGEMENT.EMAIL_DATA.EMAIL_CLICKS
      PRIMARY KEY (DISPATCH_ID, EXTERNAL_USER_ID)
      COMMENT = 'Email click events from Braze campaigns',

    unsubs AS BRAZE_ENGAGEMENT.EMAIL_DATA.EMAIL_UNSUBSCRIBES
      PRIMARY KEY (DISPATCH_ID, EXTERNAL_USER_ID)
      COMMENT = 'Email unsubscribe events from Braze campaigns',

    campaigns AS BRAZE_ENGAGEMENT.EMAIL_DATA.CAMPAIGN_CHANGELOGS
      PRIMARY KEY (API_ID)
      COMMENT = 'Campaign metadata and changelog information'
  )

  RELATIONSHIPS (
    sends(CAMPAIGN_API_ID) REFERENCES campaigns(API_ID),
    opens(CAMPAIGN_API_ID) REFERENCES campaigns(API_ID),
    clicks(CAMPAIGN_API_ID) REFERENCES campaigns(API_ID),
    unsubs(CAMPAIGN_API_ID) REFERENCES campaigns(API_ID)
  )

  DIMENSIONS (
    sends.send_time AS sends.TIME
      COMMENT = 'Timestamp when the email was sent',
    sends.timezone AS sends.TIMEZONE
      COMMENT = 'Timezone of the recipient',
    sends.gender AS sends.GENDER
      COMMENT = 'Gender of the recipient',
    sends.external_user_id AS sends.EXTERNAL_USER_ID
      COMMENT = 'External user identifier',
    sends.dispatch_id AS sends.DISPATCH_ID
      COMMENT = 'Unique dispatch identifier',
    sends.campaign_api_id AS sends.CAMPAIGN_API_ID
      COMMENT = 'Campaign API identifier',
    sends.message_variation_api_id AS sends.MESSAGE_VARIATION_API_ID
      COMMENT = 'Message variation API identifier',

    opens.open_time AS opens.TIME
      COMMENT = 'Timestamp when the email was opened',
    opens.timezone AS opens.TIMEZONE
      COMMENT = 'Timezone of the recipient',
    opens.gender AS opens.GENDER
      COMMENT = 'Gender of the recipient',
    opens.external_user_id AS opens.EXTERNAL_USER_ID
      COMMENT = 'External user identifier',
    opens.dispatch_id AS opens.DISPATCH_ID
      COMMENT = 'Unique dispatch identifier',
    opens.campaign_api_id AS opens.CAMPAIGN_API_ID
      COMMENT = 'Campaign API identifier',

    clicks.click_time AS clicks.TIME
      COMMENT = 'Timestamp when the email link was clicked',
    clicks.timezone AS clicks.TIMEZONE
      COMMENT = 'Timezone of the recipient',
    clicks.gender AS clicks.GENDER
      COMMENT = 'Gender of the recipient',
    clicks.external_user_id AS clicks.EXTERNAL_USER_ID
      COMMENT = 'External user identifier',
    clicks.dispatch_id AS clicks.DISPATCH_ID
      COMMENT = 'Unique dispatch identifier',
    clicks.campaign_api_id AS clicks.CAMPAIGN_API_ID
      COMMENT = 'Campaign API identifier',
    clicks.url AS clicks.URL
      COMMENT = 'URL that was clicked',
    clicks.link_alias AS clicks.LINK_ALIAS
      COMMENT = 'Alias for the clicked link',

    unsubs.unsub_time AS unsubs.TIME
      COMMENT = 'Timestamp when user unsubscribed',
    unsubs.timezone AS unsubs.TIMEZONE
      COMMENT = 'Timezone of the recipient',
    unsubs.gender AS unsubs.GENDER
      COMMENT = 'Gender of the recipient',
    unsubs.external_user_id AS unsubs.EXTERNAL_USER_ID
      COMMENT = 'External user identifier',
    unsubs.dispatch_id AS unsubs.DISPATCH_ID
      COMMENT = 'Unique dispatch identifier',
    unsubs.campaign_api_id AS unsubs.CAMPAIGN_API_ID
      COMMENT = 'Campaign API identifier',

    campaigns.campaign_name AS campaigns.NAME
      COMMENT = 'Name of the campaign',
    campaigns.api_id AS campaigns.API_ID
      COMMENT = 'Unique API identifier for the campaign'
  )

  METRICS (
    sends.total_sends AS COUNT(sends.ID)
      COMMENT = 'Total number of emails sent',
    sends.unique_sends AS COUNT(DISTINCT sends.EXTERNAL_USER_ID)
      COMMENT = 'Number of unique users who received emails',

    opens.total_opens AS COUNT(opens.ID)
      COMMENT = 'Total number of email opens',
    opens.unique_openers AS COUNT(DISTINCT opens.EXTERNAL_USER_ID)
      COMMENT = 'Number of unique users who opened emails',

    clicks.total_clicks AS COUNT(clicks.ID)
      COMMENT = 'Total number of email clicks',
    clicks.unique_clickers AS COUNT(DISTINCT clicks.EXTERNAL_USER_ID)
      COMMENT = 'Number of unique users who clicked',

    unsubs.total_unsubs AS COUNT(unsubs.ID)
      COMMENT = 'Total number of unsubscribes',
    unsubs.unique_unsubs AS COUNT(DISTINCT unsubs.EXTERNAL_USER_ID)
      COMMENT = 'Number of unique users who unsubscribed'
  )

  COMMENT = 'Semantic view for Braze email engagement analytics including sends, opens, clicks, and unsubscribes'

  AI_SQL_GENERATION '
- "Engagement" is defined as opens or clicks
- "Success" is defined as opens or clicks
- This dataset contains email engagement data spanning from June 2023 through June 2025
- When suggesting time-based queries, use specific date ranges like "in 2024", "in 2025", "in June 2025", "in the first half of 2025", or "between January and June 2025"
- Avoid suggesting queries with "last month", "this month", or "recent" timeframes since the data has a fixed range ending in June 2025
- The most recent data available is from June 2025, so queries should reference that timeframe or earlier periods within the dataset range
- When users ask about recent performance, interpret this as referring to the most recent data available (June 2025 or late 2024/early 2025)
';

-- Verify the semantic view was created
SHOW SEMANTIC VIEWS IN SCHEMA BRAZE_ENGAGEMENT.EMAIL_DATA;
