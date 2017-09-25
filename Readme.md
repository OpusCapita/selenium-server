## Usage

Selenium service is present in docker-compose.local.test.yml. You can start it with `docker-compose -f docker-compose.yml
-f docker-compose.override.yml -f docker-compose.local.test.yml --rm run test`. It usually takes ~10 minutes to run
so be patient, it does not mean it freeze. When tests are done container stops and can be restarted any time
in Kitematic or by running `docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.local.test.yml --rm run test`
or with Kitematic. Test results output is configurable and right now it is set 
as `spec` (human readable command line output to be read in docker logs) and `junit` which output can be found in
/tmp (locally mounted directory). Every `*.js` file from onboarding `test` directory will be run in separate
session (no need to reference it anywhere, it just needs to exist).
##### Spec development
When writing new spec you may find it hard unconfortable to reset container after every change and wait until all tests
are completed. It is possible to run container in `watch mode` and to run different file/files than specified in
config. For that you append regular WebDriverIO arguments after docker-compose command just like that `docker-compose -f
docker-compose.yml -f docker-compose.override.yml -f docker-compose.local.test.yml --rm run test --watch --spec /test/spec.js`
(Please note that spec directory is mounted to /test)

##### Running test on local browser
Docker image has some cons. For example you cannot see what is really running and it is very slow in virtual X11. When
you are working on tests it is highly recommended to run selenium localy. To do it you need to download `selenium-server`
, `geckodriver` and Firefox browser. When it is installed you run `selenium-server -port 4444`. After that you change
`host` parameter in wdio.conf.js from `localhost` to you local IP and thats it! Every time you run test service now
it will use your local Firefox browser to run tests and you can see it in realtime.

##### Test results
Every run spec file has its own junit xml file which can be found in /tmp directory on host machine.
Every time a test fails screenshot is done and saved in /tmp/errorShots.

##### Known issues
- Docker log merges stdout with stderr what makes it hard to read when tests fail
- Running tests using selenium docker builtin browser is very slow (X11 is emulated)
- As we are using React many views are not available when webdriver gets `pageLoaded` event so we need to
wait for React separately using `browser.waitUntil`