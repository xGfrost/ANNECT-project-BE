<<<<<<< HEAD
const { getAll, deleteById, insertfavorite } = require("./favorites.repository");
=======
const { getAll, deleteById, insert } = require("./favorites.repository");
>>>>>>> 7334fa49d2018e3a2924b185a1147bd479a797b0
const { getbyid } = require("../users/users.service");
const { getbyid } = require("../channels/channels.service")

const getAllUserFavorites = async (user_id) => {
  await getbyid(user_id); // Check if user exists
  return getAll(user_id);
};

const insertUserFavorite = (favoriteData) => insert(favoriteData);

const deleteFavorite = (favorite_id) => deleteById(favorite_id);

module.exports = {
  getAllUserFavorites,
  deleteFavorite,
  insertUserFavorite,
};
