import jwt from 'jsonwebtoken';

export const generateToken = (user) => {
    const payload = { id: user._id, email: user.email };
    const secret = process.env.JWT_SECRET;
    const options = { expiresIn: '1h' };

    return jwt.sign(payload, secret, options);
};
