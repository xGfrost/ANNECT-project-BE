const prisma = require('../db');

const getAll = async (user_id) => {
    return await prisma.favorites.findMany({
        where: {
            user_id: user_id
        },
        include: {
            events: true
        }
    })
}

const deleteById = async (favorite_id) => {
    return await prisma.favorites.delete({
        where: {
            id: favorite_id
        }
    })
}

module.exports = {
    getAll,
    deleteById,
}