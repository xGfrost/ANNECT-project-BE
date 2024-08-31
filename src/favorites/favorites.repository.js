const prisma = require("../db");

const getAll = async (user_id) =>{

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
    where: {
      id: favorite_id,
    },
  });

}


module.exports = {
  getAll,
  deleteById,
};
