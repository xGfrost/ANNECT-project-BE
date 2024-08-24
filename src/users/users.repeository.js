const prisma = require('../db');

const findallusers = async () => {
    const user = await prisma.users.findMany();
    return user;
}

const finduserbyid = async (id) => {
    const user = await prisma.users.findUnique({
        where:{
            id: id,
        },
        include:{
            user_events:{
                include:{
                    events:true
                }
            },
            channels:true,
            favorites:true
        }
    })
    return user;
}

module.exports = {
    findallusers,
    finduserbyid,
}