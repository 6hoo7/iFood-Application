import express from 'express';
import { signup, signin, getUserInfo, changePassword, deleteUser } from '../controllers/auth';

const router = express.Router();

router.post('/signup', signup);
router.post('/signin', signin);
router.get('/user/:id', getUserInfo);
router.put('/changepassword/:id', changePassword);
router.delete('/deleteuser/:id', deleteUser);

export default router;

