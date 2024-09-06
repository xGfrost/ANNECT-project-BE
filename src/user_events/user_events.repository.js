const prisma = require("../db/index");

const findall = async () => {
  const ue = await prisma.user_events.findMany({
    include:{
      events:true,
      users:true,
    },
    orderBy:{
      created_at: 'desc'
    }
  })
  return ue;
}

const getById = (user_id) =>
  prisma.user_events.findMany({
    where: {
      user_id: user_id,
    },
    select: {
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
      user_id: user_event_data.user_id,
      event_id: user_event_data.event_id,
      tf_image: user_event_data.image,
      status: false,
    }
  })
)

module.exports = {
  getById,
  insert,
  updateStatus,
  findall,
};
