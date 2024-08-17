import mongoose from "mongoose";

const productSchema = new mongoose.Schema({
    name: {
        type: String,
    },
    description: {
        type: String,
    },
    imagePath: {
        type: String,
    },
    price: {
        type: Number,
    },
    category: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Category',
        required: true
    }
    },
    { timestamps: true, versionKey: false }
);

export default mongoose.model("Product", productSchema);
