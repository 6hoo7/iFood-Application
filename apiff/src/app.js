// import express from 'express';
// import categoryRouter from './routers/category';
// import productRouter from './routers/product';
// import authRouter from './routers/auth';
// import { connectDB } from './config/db';
// import dotenv from 'dotenv';
// import morgan from 'morgan';

// dotenv.config();

// const app = express();

// // Middleware
// app.use(express.json());
// app.use(morgan("dev"));

// // Kết nối tới database
// connectDB(process.env.DB_URI);

// // Sử dụng các router
// app.use('/api', productRouter);
// app.use('/api', authRouter);
// app.use('/api', categoryRouter);

// export const viteNodeApp = app;

// import express from 'express';
// import categoryRouter from './routers/category';
// import productRouter from './routers/product';
// import authRouter from './routers/auth';
// import { connectDB } from './config/db';
// import dotenv from 'dotenv';
// import morgan from 'morgan';

// dotenv.config();

// const app = express();

// // Middleware
// app.use(express.json());
// app.use(morgan("dev"));

// // Kết nối tới database
// connectDB(process.env.DB_URI);

// // Sử dụng các router
// app.use('/api', productRouter);
// app.use('/api', authRouter);
// app.use('/api', categoryRouter);

// // Khởi động máy chủ và lắng nghe trên tất cả các giao diện mạng
// const port = process.env.PORT || 8080;
// app.listen(port, '0.0.0.0', () => {
//   console.log(`Server is running on http://0.0.0.0:${port}`);
// });

// export const viteNodeApp = app;

import express from 'express';
import categoryRouter from './routers/category';
import productRouter from './routers/product';
import authRouter from './routers/auth';
import { connectDB } from './config/db';
import dotenv from 'dotenv';
import morgan from 'morgan';

dotenv.config();

const app = express();

// Middleware
app.use(express.json());
app.use(morgan("dev"));

// Kết nối tới database
connectDB(process.env.DB_URI);

// Sử dụng các router
app.use('/api', productRouter);
app.use('/api', authRouter);
app.use('/api', categoryRouter);

// Khởi động máy chủ và lắng nghe trên tất cả các giao diện mạng
const port = process.env.PORT || 8080;
app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on http://0.0.0.0:${port}`);
});

export const viteNodeApp = app;
