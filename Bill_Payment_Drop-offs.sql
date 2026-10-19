USE upi_payment_db;

-- Insight 2: Bill Payment Drop-offs.
SELECT 
    'transaction type',
    merchant_category,
    COUNT(*) AS total_attempts,
    SUM(CASE WHEN transaction_status = 'SUCCESS' THEN 1 ELSE 0 END) AS successful_transactions,
    SUM(CASE WHEN transaction_status = 'FAILED' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND((SUM(CASE WHEN transaction_status = 'FAILED' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS dropout_rate_percent
FROM historical_payment_records
GROUP BY 'transaction type', merchant_category
ORDER BY dropout_rate_percent DESC;
