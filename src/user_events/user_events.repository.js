const prisma = require("../db/index");

const getById = (user_id) =>
  prisma.user_events.findUnique({
    where: {
      user_id: user_id,
    },
    include: {
      events: true,
    },
  });

const updateStatus = (user_event_id, updated_user_event_status) => (
  prisma.user_events.update({
    where: {
      id: user_event_id
    },
    data: {
      status: updated_user_event_status
    }
  })
)

const insert = (user_event_data) => (
  prisma.user_events.create({
    data: {
      user_event_data,
      status: false,
    }
  })
)

module.exports = {
  getById,
  insert,
  updateStatus
};
