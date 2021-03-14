
# order-management
Order management app

Steps to Deploy application:

Composer up 

Rename .env.example to .env 

Create database name and set database credentials on .env

php artisan migrate

php artisan db:seed

php artisan db:seed --class=ProductSeeder

php artisan db:seed --class=DiscountSeeder

For building layout builds:

npm install

npm run dev 

To run test: 

vendor/phpunit/phpunit/phpunit --testsuite Feature Tests
