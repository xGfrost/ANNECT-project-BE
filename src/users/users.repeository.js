const prisma = require('../db');

const findallusers = async () => {
    const user = await prisma.users.findMany();
    return user;
}

const finduserbyid = async (id) => {
    const user = await prisma.users.findUnique({
        where:{
            id: id,
        }
    })
    return user;
}

module.exports = {
    findallusers,
    finduserbyid,
}