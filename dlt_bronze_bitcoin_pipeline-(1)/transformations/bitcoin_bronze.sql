CREATE OR REFRESH STREAMING LIVE TABLE bronze_bitcoin_spot_raw
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw/raw_coinbase/coinbase/bitcoin_spot',
  'json'
);
