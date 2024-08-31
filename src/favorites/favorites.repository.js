const prisma = require("../db");

const getAll = async (user_id) =>{

<<<<<<< HEAD
 const  favorite = await prisma.favorites.findMany({
   where: { 
     user_id: user_id,
   },
   include: {
     events: true,
   },
 });
 return favorite;
}

const deleteById = async (favorite_id) =>{
  await prisma.favorites.delete({
=======
const insert = (favoriteData) => (
  prisma.favorites.create({
    data: {
      ...favoriteData
    }
  })
)

const deleteById = (favorite_id) =>
  prisma.favorites.delete({
>>>>>>> 7334fa49d2018e3a2924b185a1147bd479a797b0
    where: {
      id: favorite_id,
    },
  });

}


module.exports = {
  getAll,
  deleteById,
  insert
};
