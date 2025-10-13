CREATE OR REFRESH STREAMING LIVE TABLE bronze_yfinance
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw/raw_yfinance/commodities/latest_prices',
  'json'
);
