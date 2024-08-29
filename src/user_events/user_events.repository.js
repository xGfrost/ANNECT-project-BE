const prisma = require("../db/index");

const getById = (user_events_id) =>
  prisma.user_events.findUnique({
    where: {
      id: user_events_id,
    },
    include: {
      events: true,
    },
  });

module.exports = {
  getById,
};
