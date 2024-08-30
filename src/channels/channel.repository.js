const prisma = require('../db');
const cuid = require('cuid');

const findall = async (name, user_id) => {
    const ch = await prisma.channels.findMany({
        where:{
            NOT:{
                user_id:user_id
            },
            name:{
                contains: name,
            }
        },
        include: {
            users:true
        }
    });
    return ch;
}

const findbyid = async (id) => {
    const ch = await prisma.channels.findUnique({
        where:{
            id:id,
        },
        include:{
            users:true,
            follows:true,
            events:true,
        }
    })
    return ch;
}

const findchannelbyiduser = async (user_id) => {
    const channel = await prisma.channels.findFirst({
        where:{
            user_id: user_id
        },
        include:{
            events:{
                include: {
                    categories:true,
                    tags:true,
                    user_events:true,
                }
            },
            users:true,
            follows:{
                include:{
                    users:true
                }
            },
            _count:true,
        }
    }) 
    return channel;
}

const insert = async (channelsdata) => {
    const ch = await prisma.channels.create({
        data:{
            id: cuid(),
            user_id:channelsdata.user_id,
            name:channelsdata.name,
            description:channelsdata.description,
            image:channelsdata.image,
            no_rek: channelsdata.no_rek,
            nik: channelsdata.nik,
            ktp: channelsdata.ktp,
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
            nik:channelsdata.nik,
            no_rek:channelsdata.no_rek,
            phone:channelsdata.phone,
            status:channelsdata.status,

        }
    })
    return ch;
}

module.exports = {
    findall,
    findbyid,
    insert,
    edit,
    findchannelbyiduser,
}

