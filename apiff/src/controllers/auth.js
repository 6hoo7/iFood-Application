import { registerSchema } from "../schemas/auth";
import User from "../model/user";
import bcryptjs from 'bcryptjs';
import { generateToken } from '../config/jwt';

export const signup = async (req, res) => {
    const { imagePath, username, phoneNum, email, password, confirmPassword } = req.body;

    // Validate dữ liệu đầu vào
    const { error } = registerSchema.validate(req.body, { abortEarly: false });
    if (error) {
        const messages = error.details.map((message) => message.message)
        return res.status(400).json({ messages });
    }

    // Kiểm tra xem phoneNum đã tồn tại chưa
    const existingUser = await User.findOne({ phoneNum });
    if (existingUser) {
        return res.status(400).json({
            messages: ["Tài khoản đã tồn tại trên hệ thống."],
        });
    }

    // Mã hóa password sử dụng bcryptjs
    const hashedPassword = await bcryptjs.hash(password, 10);

    // Tạo mới user
    const user = await User.create({
        imagePath,
        username,
        phoneNum,
        email,
        password: hashedPassword,
    });

    // Trả về thông tin user đã đăng ký (không bao gồm password)
    user.password = undefined;
    return res.status(201).json({ user });
};

export const signin = async (req, res) => {
    const { phoneNum, password } = req.body;

    // Kiểm tra xem số điện thoại có tồn tại không
    const user = await User.findOne({ phoneNum });
    if (!user) {
        return res.status(400).json({
            messages: ["Số điện thoại hoặc mật khẩu không đúng."],
        });
    }

    // Kiểm tra mật khẩu
    const isPasswordValid = await bcryptjs.compare(password, user.password);
    if (!isPasswordValid) {
        return res.status(400).json({
            messages: ["Số điện thoại hoặc mật khẩu không đúng."],
        });
    }

    // Tạo token JWT
    const token = generateToken(user);

    // Trả về token và thông tin user
    user.password = undefined;
    return res.status(200).json({
        user,
        token,
    });
};

export const getUserInfo = async (req, res) => {
    try {
        const user = await User.findById(req.params.id).select('-password');
        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json(user);
    } catch (err) {
        res.status(500).json({ message: 'Server error' });
    }
};

export const changePassword = async (req, res) => {
    const { oldPassword, newPassword, confirmPassword } = req.body;
    const userId = req.params.id;

    if (newPassword !== confirmPassword) {
        return res.status(400).json({ message: "Mật khẩu mới và xác nhận mật khẩu không khớp" });
    }

    try {
        const user = await User.findById(userId);

        if (!user) {
            return res.status(404).json({ message: "Không tìm thấy người dùng" });
        }

        const isMatch = await bcryptjs.compare(oldPassword, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Mật khẩu cũ không đúng" });
        }

        const hashedPassword = await bcryptjs.hash(newPassword, 10);
        user.password = hashedPassword;
        await user.save();

        res.status(200).json({ message: "Đổi mật khẩu thành công" });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

export const deleteUser = async (req, res) => {
    try {
        const user = await User.findByIdAndDelete(req.params.id);

        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }

        res.status(200).json({ message: 'User deleted successfully' });
    } catch (err) {
        res.status(500).json({ message: 'Server error' });
    }
};
