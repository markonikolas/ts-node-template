import { config } from 'dotenv';
import http from 'http';

config();

const { NODE_ENV, APP_DEVELOPMENT_PORT, APP_PRODUCTION_PORT } = process.env;

const PORT = NODE_ENV === 'development' ? APP_DEVELOPMENT_PORT : APP_PRODUCTION_PORT;

http
    .createServer((req, res) => {
        res.write('Hello World!');
        res.end();
    })
    .listen(Number(PORT), '0.0.0.0', () => console.log(`Running on localhost ${PORT} in ${NODE_ENV} environment`));
