const { getById, insert, findall } = require("./user_events.repository");

const getUserEventById = (user_id) => getById(user_id);

const inserUserEvent = (user_event_data) => insert(user_event_data);

const getall = async () => {
  const ue = await findall();
  return ue;
}

module.exports = {
  getUserEventById,
  inserUserEvent,
  getall,
};
