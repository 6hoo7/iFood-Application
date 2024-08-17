// import { required, string } from "joi";
// import mongoose from "mongoose";

// const userSchema = new mongoose.Schema({
//     username: {
//         type: String,
//         required: true,
//         unique: true,
//         trim: true,
//         lowercase: true,
//     },
//     email: {
//         type: String,
//     },
//     phoneNum: {
//         type: String,
//         required: true, 
//         unique: true,
//     },
//     password: {
//         type: String,
//         required: true,
//         minlength: 6,
//     },
// },
// { timestamps: true, versionKey: false }
// );

// userSchema.index({ username: 1, phoneNum: 1});
// export default mongoose.model("User", userSchema);

import { required } from "joi";
import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
    imagePath: {
        type: String,
        required: true
    },
    username: {
        type: String,
        required: true,
        trim: true,
    },
    phoneNum: {
        type: String,
        required: true,
        unique: true, // Nếu muốn phoneNum là duy nhất
    },
    email: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        required: true,
        minlength: 6,
    },
}, { timestamps: true, versionKey: false });

export default mongoose.model("User", userSchema);



