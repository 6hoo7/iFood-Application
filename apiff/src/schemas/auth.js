// import Joi from "joi";

// export const registerSchema = Joi.object({
//     imagePath: Joi.string().uri().required().messages({
//         "any.required": "Image Path là trường bắt buộc.",
//         "string.empty": "Image Path không được để trống.",
//         "string.uri": "Image Path phải là một URL hợp lệ."
//     }),

//     username: Joi.string().required().messages({
//         "any.required": "Username là trường bắt buộc.",
//         "string.empty": "Username không được để trống.",
//     }),

//     phoneNum: Joi.string().pattern(/^\d+$/).required().messages({
//         "any.required": "SĐT là trường bắt buộc.",
//         "string.empty": "SĐT không được để trống.",
//         "string.pattern.base": "SĐT chỉ được chứa số.",
//     }),
    
//     email: Joi.string().required().email().pattern(/^[\w.+-]+@gmail\.com$/).messages({
//         "any.required": "Email là trường bắt buộc.",
//         "string.email": "Email không hợp lệ.",
//         "string.empty": "Email không được để trống.",
//         "string.pattern.base": "Email phải có đuôi @gmail.com.",
//     }),

//     password: Joi.string().min(6).required().messages({
//         "any.required": "Password là trường bắt buộc.",
//         "string.min": "Password phải có ít nhất {#limit} ký tự.",
//         "string.empty": "Password không được để trống.",
//     }),

//     confirmPassword: Joi.string().required().valid(Joi.ref('password')).messages({
//         "any.required": "Confirm Password là trường bắt buộc.",
//         "any.only": "Mật khẩu nhập lại không trùng khớp!"
//     }),
// });

import Joi from "joi";

export const registerSchema = Joi.object({
    imagePath: Joi.string().uri().required().messages({
        "any.required": "Image Path là trường bắt buộc.",
        "string.empty": "Image Path không được để trống.",
        "string.uri": "Image Path phải là một URL hợp lệ."
    }),

    username: Joi.string().required().messages({
        "any.required": "Username là trường bắt buộc.",
        "string.empty": "Username không được để trống.",
    }),

    phoneNum: Joi.string().pattern(/^\d+$/).required().messages({
        "any.required": "SĐT là trường bắt buộc.",
        "string.empty": "SĐT không được để trống.",
        "string.pattern.base": "SĐT chỉ được chứa số.",
    }),

    email: Joi.string().required().email().pattern(/^[\w.+-]+@gmail\.com$/).messages({
        "any.required": "Email là trường bắt buộc.",
        "string.email": "Email không hợp lệ.",
        "string.empty": "Email không được để trống.",
        "string.pattern.base": "Email phải có đuôi @gmail.com.",
    }),

    password: Joi.string().min(6).required().messages({
        "any.required": "Password là trường bắt buộc.",
        "string.min": "Password phải có ít nhất {#limit} ký tự.",
        "string.empty": "Password không được để trống.",
    }),

    confirmPassword: Joi.string().required().valid(Joi.ref('password')).messages({
        "any.required": "Confirm Password là trường bắt buộc.",
        "any.only": "Mật khẩu nhập lại không trùng khớp!"
    }),
});


