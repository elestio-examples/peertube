docker-compose exec -T -u peertube peertube node dist/scripts/migrations/peertube-5.0.js
echo "Wait for running"
sleep 10s;
