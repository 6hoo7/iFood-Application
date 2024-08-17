import Category from "../model/category";

// Lấy tất cả các danh mục
export const getAllCategories = async (req, res) => {
    try {
        const categories = await Category.find();
        res.status(200).json(categories);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

// Lấy một danh mục theo ID
export const getCategoryById = async (req, res) => {
    try {
        const category = await Category.findById(req.params.id);
        if (!category) return res.status(404).json({ message: "Category not found" });
        res.status(200).json(category);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

// Tạo một danh mục mới
export const createCategory = async (req, res) => {
    const category = new Category(req.body);
    try {
        const newCategory = await category.save();
        res.status(201).json(newCategory);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

// Cập nhật một danh mục
export const updateCategory = async (req, res) => {
    try {
        const updatedCategory = await Category.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedCategory) return res.status(404).json({ message: "Category not found" });
        res.status(200).json(updatedCategory);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

// Xóa một danh mục
export const deleteCategory = async (req, res) => {
    try {
        const deletedCategory = await Category.findByIdAndDelete(req.params.id);
        if (!deletedCategory) return res.status(404).json({ message: "Category not found" });
        res.status(200).json({ message: "Category deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};
