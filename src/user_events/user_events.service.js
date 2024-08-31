const { getById, insert } = require("./user_events.repository");

const getUserEventById = (user_id) => getById(user_id);

const inserUserEvent = (user_event_data) => insert(user_event_data);

module.exports = {
  getUserEventById,
  inserUserEvent,
};
