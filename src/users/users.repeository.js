const prisma = require("../db");

const findallusers = async () => {
  const user = await prisma.users.findMany({
    where: {
      NOT: {
        role: "ADMIN",
      },
    },
  });
  return user;
};

const finduserbyid = async (id) => {
  const user = await prisma.users.findUnique({
    where: {
      id: id,
    },
    include: {
      user_events: {
        include: {
          events: true,
        },
        take: 3,
      },
      channels: {
        include: {
          users: true,
        },
        take: 3,
      },
      favorites: {
        include: {
          events: true,
        },
        take: 3,
      },
    },
  });

  // Mengambil data tambahan seperti is_favorite, is_following, dan status pembayaran
  const favoriteEventIds = user.favorites.map(favorite => favorite.event_id);

  // Menambahkan is_favorite dan is_join ke setiap event di user_events
  const userEventsWithFavoritesAndJoin = user.user_events.map((userEvent) => {
    return {
      ...userEvent,
      is_Payment: userEvent.status
    };
  });

  // Mengambil list channel yang diikuti user (follows)
  const is_following = await prisma.follows.findMany({
    where: {
      user_id: id,
    },
    select: {
      channel_id: true, // Hanya mengambil id channel yang diikuti
    },
  });

  const followingChannelIds = is_following.map(follow => follow.channel_id);

  // Menambahkan is_following ke setiap channel di user channels
  const userChannelsWithFollowing = user.channels.map((channel) => {
    return {
      ...channel,
      is_following: followingChannelIds.includes(channel.id), // cek apakah channel ini diikuti
    };
  });

  // Mengembalikan data user dengan field tambahan
  return {
    ...user,
    user_events: userEventsWithFavoritesAndJoin,
    channels: userChannelsWithFollowing,
  };
};

const findHistoryEvent = async (user_id) => {
  const user = await prisma.user_events.findMany({
    where: {
      user_id,
    },
    include: {
      events: true,
      
    },
  });

  return user;
};


module.exports = {
  findallusers,
  finduserbyid,
  findHistoryEvent,
};
