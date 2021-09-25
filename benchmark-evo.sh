echo "Copy routes/_evo.php -> routes/api.php"
cp routes/_evo.php routes/api.php

echo ""
echo "[evo] Clear route caches"
php artisan route:clear

echo ""
echo "[evo] Running curl to POST /evo-0/register (without cache)"
curl -s -X POST "$BM_BASE_URL/api/evo-0/register" \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret"}'
echo ""

echo ""
echo "[evo] Running ab on POST /evo-0/register (without cache)"
ab -q -p register-data.json -T application/json -c $BM_NUM_CONCURRENCY -n $BM_NUM_REQUEST "$BM_BASE_URL/api/evo-0/register" | grep 'Requests per second'

echo ""
echo "[evo] Running curl to POST /evo-99/register (without cache)"
curl -s -X POST "$BM_BASE_URL/api/evo-99/register" \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret", "password_confirmation": "secret"}'
echo ""

echo ""
echo "[evo] Running ab on POST /evo-99/register (without cache)"
ab -q -p register-data.json -T application/json -c $BM_NUM_CONCURRENCY -n $BM_NUM_REQUEST "$BM_BASE_URL/api/evo-99/register" | grep 'Requests per second'

echo ""
echo "[evo] Caching routes"
php artisan route:cache

echo ""
echo "[evo] Running curl to POST /evo-0/register (with cache)"
curl -s -X POST "$BM_BASE_URL/api/evo-0/register" \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret", "password_confirmation": "secret"}'
echo ""

echo ""
echo "[evo] Running ab on POST /evo-0/register (with cache)"
ab -q -p register-data.json -T application/json -c $BM_NUM_CONCURRENCY -n $BM_NUM_REQUEST "$BM_BASE_URL/api/evo-0/register" | grep 'Requests per second'

echo ""
echo "[evo] Running curl to POST /evo-99/register (with cache)"
curl -s -X POST "$BM_BASE_URL/api/evo-99/register" \
    -H 'Content-type: application/json' \
    -d '{"name": "John Doe", "email": "johndoe@mail.com", "password": "secret", "password_confirmation": "secret"}'
echo ""

echo ""
echo "[evo] Running ab on POST /evo-99/register (with cache)"
ab -q -p register-data.json -T application/json -c $BM_NUM_CONCURRENCY -n $BM_NUM_REQUEST "$BM_BASE_URL/api/evo-99/register" | grep 'Requests per second'

