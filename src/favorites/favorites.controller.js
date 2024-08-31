const { Router } = require("express");
<<<<<<< HEAD
const { getAllUserFavorites, deleteFavorite, createfavorite } = require("./favorites.service");
=======
const { getAllUserFavorites, deleteFavorite, insertUserFavorite } = require("./favorites.service");
>>>>>>> 7334fa49d2018e3a2924b185a1147bd479a797b0
const router = Router();

router.get("/users/:user_id/follows", async (req, res) => {
  try {
    const { user_id } = req;
    const userFavorites = await getAllUserFavorites(user_id);
    res.send(userFavorites);
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.post("/favorites/add", async (req, res) => {
  try {
    await insertUserFavorite(req.body);
    res.send({
      message: "Success",
    });
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.post("/favorites/:favorite_id", async (req, res) => {
  try {
    const { favorite_id } = req;
    await deleteFavorite(favorite_id);
    res.send({
      message: "Success",
    });
  } catch (error) {
    res.status(400).send(error.message);
  }
});


module.exports = router;
