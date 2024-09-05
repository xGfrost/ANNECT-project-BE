const {
  findallusersfollowbyid,
  findallchannelfollowersbyid,
  insert,
  deleteid,
  exist,
} = require("./follows.repository");
const { getbyid } = require("../channels/channels.service");

// const getall = async () => {
//     const follow = await findall();
//     return follow;
// }

const findfollowbyuserid = async (id) => {
  const follow = await findallusersfollowbyid(id);
  return follow;
};
const findfollowbychannelid = async (id) => {
  const follow = await findallchannelfollowersbyid(id);
  return follow;
};

const create = async (followdata) => {
  // Ambil data channel berdasarkan channel_id
  const channel = await getbyid(followdata.channel_id);

  // Jika channel tidak ditemukan, lempar error
  if (!channel) {
    throw new Error("Channel not found");
  }

  // Cek apakah user mencoba mengikuti channel mereka sendiri
  if (channel.user_id === followdata.user_id) {
    throw new Error("You can't follow your own channel");
  }

  // Cek apakah sudah ada data follow untuk user dan channel tersebut
  const existingFollow = await exist(followdata.user_id, followdata.channel_id);

  // Jika sudah ada, maka hapus (unfollow)
  if (existingFollow) {
    await deleteid(existingFollow.id);
    return;
  }

  // Jika belum ada, tambahkan follow baru
  const follow = await insert(followdata);

  return follow;
};

const deletefollow = async (id) => {
  await deleteid(id);
};

module.exports = {
  findfollowbyuserid,
  findfollowbychannelid,
  create,
  deletefollow,
  // getall,
};
