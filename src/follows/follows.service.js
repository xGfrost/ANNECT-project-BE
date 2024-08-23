const {  findallusersfollowbyid, findallchannelfollowersbyid, insert, deleteid } = require('./follows.repository');


const findfollowbyuserid = async (id) => {  
    const follow = await findallusersfollowbyid(id);
    return follow;
}
const findfollowbychannelid = async (id) => {  
    const follow = await findallchannelfollowersbyid(id);
    return follow;
}

const create = async (followdata) => {
    const follow = await insert(followdata);
    return follow;
}

const deletefollow = async (id) => {
    await deleteid(id);
}

module.exports = {
    findfollowbyuserid,
    findfollowbychannelid,
    create,
    deletefollow,
}
