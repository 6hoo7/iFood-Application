import express from 'express';
import { addProduct, deleteProduct, getProducts, getProductsById, updateProduct, getProductsByCategory } from "../controllers/product";

const router = express.Router();

router.get('/products', getProducts);
router.get('/products/:id', getProductsById);
router.post('/products', addProduct);
router.put('/products/:id', updateProduct);
router.delete('/products/:id', deleteProduct);
router.get('/products/categories/:categoryId', getProductsByCategory);

export default router;