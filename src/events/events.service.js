const { getAll, updateById } = require('./events.repository');

const getAllEvents = () => (getAll());

const updateEvent = (eventData, eventId) => (updateById(eventData, eventId));

module.exports = {
    getAllEvents,
    updateEvent,
}