const prisma = require('../db');
const cuid = require('cuid');

const findall = async () => {
    const ch = await prisma.channels.findMany();
    return ch;
}

const findbyid = async (id) => {
    const ch = await prisma.channels.findUnique({
        where:{
            id:id,
        },
        include:{
            users:true
        }
    })
    return ch;
}

const insert = async (channelsdata) => {
    const ch = await prisma.channels.create({
        data:{
            id: cuid(),
            user_id:channelsdata.user_id,
            name:channelsdata.name,
            description:channelsdata.description,
            image:channelsdata.image,
        }
    })
    return ch;
}

const edit = async (id, channelsdata) => {
    const ch = await prisma.channels.update({
        where:{
            id: id,
        },
        data:{
            name:channelsdata.name,
            description:channelsdata.description,
            image:channelsdata.image,
        }
    })
    return ch;
}

module.exports = {
    findall,
    findbyid,
    insert,
    edit,
}

