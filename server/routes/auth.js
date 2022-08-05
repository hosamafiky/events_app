const express = require("express");
const bcryptjs = require("bcrypt");
const User = require("../models/user");

const authRouter = express.Router();

// Signup
authRouter.post("/api/register", async (req, res) => {
  try {
    const { name, email, phone, password, confirmPassword } = req.body;

    if (await User.findOne({ email })) {
      return res.status(400).json({
        message: "هذاالبريد الإلكتروني مستخدم من قبل",
      });
    }
    if (await User.findOne({ phone })) {
      return res.status(400).json({
        message: "رقم الجوال مستخدم من قبل",
      });
    }
    if (password !== confirmPassword) {
      return res.status(400).json({
        message: "كلمة المرور غير متطابقة",
      });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let newUser = User({
      name,
      email,
      phone,
      password: hashedPassword,
      confirmPassword: hashedPassword,
    });

    newUser = await newUser.save();

    res.json(newUser);
  } catch (error) {
    switch (error.status) {
      case 400:
        res.status(400).json({ error: error.message });
        break;
      case 500:
        res.status(500).json({
          error: error.message,
        });
        break;
    }
  }
});

module.exports = authRouter;
