import { config } from 'dotenv';
import http from 'http';

config();

const { NODE_ENV, APP_DEVELOPMENT_PORT, APP_PRODUCTION_PORT } = process.env;

const PORT = NODE_ENV === 'development' ? APP_DEVELOPMENT_PORT : APP_PRODUCTION_PORT;

http.createServer((req, res) => {
    res.write('Hello World!')
    res.end();
}).listen(PORT, () => console.log(`Running on ${PORT}`));