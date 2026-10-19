USE upi_payment_db;

-- Insight 1: Failed Bank Server Paths.
SELECT 
    sender_bank AS bank_name,
    COUNT(*) AS total_payments,
    SUM(CASE WHEN transaction_status = 'FAILED' THEN 1 ELSE 0 END) AS failed_payments,
    ROUND((SUM(CASE WHEN transaction_status = 'FAILED' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS failure_rate_percent
FROM historical_payment_records
GROUP BY sender_bank
ORDER BY failure_rate_percent DESC;

