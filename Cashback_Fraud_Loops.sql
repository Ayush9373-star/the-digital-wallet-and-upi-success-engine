USE upi_payment_db;

-- Insight 3: Cashback loops Trap.
SELECT 
    sender_bank AS suspect_bank_route,
    sender_state AS tracking_location,
    COUNT(*) AS total_transactions_sent,
    ROUND(AVG('amount (INR)'), 2) AS avg_transaction_value_inr,
    SUM(fraud_flag) AS total_fraud_triggers
FROM historical_payment_records
GROUP BY sender_bank, sender_state
ORDER BY total_fraud_triggers DESC;
