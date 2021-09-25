BASE_URL="http://localhost:8000"
NUM_CONCURRENCY=10
NUM_REQUEST=10000

echo "Copy routes/_std.php -> routes/api.php"
cp routes/_std.php routes/api.php

echo ""
echo "[std] Clear route caches"
php artisan route:clear

echo ""
echo "[std] Running curl to POST /std-0/register (without cache)"
curl -s -X POST "$BASE_URL/api/std-0/register" \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret"}'
echo ""

echo ""
echo "[std] Running ab on POST /std-0/register (without cache)"
ab -q -p register-data.json -T application/json -c $NUM_CONCURRENCY -n $NUM_REQUEST "$BASE_URL/api/std-0/register" | grep 'Requests per second'

echo ""
echo "[std] Running curl to POST /std-99/register (without cache)"
curl -s -X POST http://localhost:8000/api/std-99/register \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret"}'
echo ""

echo ""
echo "[std] Running ab on POST /std-99/register (without cache)"
ab -q -p register-data.json -T application/json -c $NUM_CONCURRENCY -n $NUM_REQUEST "$BASE_URL/api/std-99/register" | grep 'Requests per second'

echo ""
echo "[std] Caching routes"
php artisan route:cache

echo ""
echo "[std] Running curl to POST /std-0/register (with cache)"
curl -s -X POST http://localhost:8000/api/std-0/register \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret"}'
echo ""

echo ""
echo "[std] Running ab on POST /std-0/register (with cache)"
ab -q -p register-data.json -T application/json -c $NUM_CONCURRENCY -n $NUM_REQUEST "$BASE_URL/api/std-0/register" | grep 'Requests per second'

echo ""
echo "[std] Running curl to POST /std-99/register (with cache)"
curl -s -X POST http://localhost:8000/api/std-99/register \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret"}'
echo ""

echo ""
echo "[std] Running ab on POST /std-99/register (with cache)"
ab -q -p register-data.json -T application/json -c $NUM_CONCURRENCY -n $NUM_REQUEST "$BASE_URL/api/std-99/register" | grep 'Requests per second'

