const { getAll, updateById, insert } = require('./events.repository');
const { finduserbyid } = require('../users/users.repeository');

const getAllEvents = () => (getAll());

const updateEvent = (eventData, eventId) => (updateById(eventData, eventId));

const insertEvent = async (requestBody, eventData) => {
    const { user_id } = requestBody;
    const { role: userRole } = await finduserbyid(user_id);
    if (userRole == "ADMIN") {
        throw new Error("NOT AUTHORIZED");

    }
    return insert(eventData);
};

module.exports = {
    getAllEvents,
    updateEvent,
    insertEvent,
}