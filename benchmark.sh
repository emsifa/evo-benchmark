export BM_BASE_URL="http://localhost:8000"
export BM_NUM_CONCURRENCY=10
export BM_NUM_REQUEST=100

echo "BENCHMARKING LARAVEL STANDARD"
./benchmark-std.sh > benchmark-std.result.txt
echo "Result: benchmark-std.result.txt"

echo "BENCHMARKING LARAVEL EVO"
./benchmark-evo.sh > benchmark-evo.result.txt
echo "Result: benchmark-evo.result.txt"

echo "DONE"
