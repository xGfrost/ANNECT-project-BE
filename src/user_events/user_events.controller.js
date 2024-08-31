const { getUserEventById, inserUserEvent } = require("./user_events.service");
const { Router } = require("express");
const upload = require('../middleware/multer');
const router = Router();

router.get("/:user_id", async (req, res) => {
  try {
    const { user_id } = req.params;
    const userEventDetail = await getUserEventById(user_id);
    res.send(userEventDetail);
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.post("/add", upload.single('image'), async (req, res) => {
  try {
    await inserUserEvent(req.body);
    res.status(201).send("success");
  } catch (error) {
    res.status(400).send(error.message);
  }
})

module.exports = router;
