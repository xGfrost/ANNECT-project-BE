const { getById } = require("./user_events.repository");

const getUserEventById = (user_event_id) => getById(user_event_id);

module.exports = {
  getUserEventById,
};
