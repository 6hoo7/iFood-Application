import express from "express";
import { 
    getAllCategories, 
    getCategoryById, 
    createCategory, 
    updateCategory, 
    deleteCategory 
} from "../controllers/category";

const router = express.Router();

// Định nghĩa các routes cho category
router.get("/categories", getAllCategories);
router.get("/categories/:id", getCategoryById);
router.post("/categories", createCategory);
router.put("/categories/:id", updateCategory);
router.delete("/categories/:id", deleteCategory);

export default router;
