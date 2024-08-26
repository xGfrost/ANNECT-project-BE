const { getAll, updateById, insert } = require('./events.repository');

const getAllEvents = () => (getAll());

const updateEvent = (eventData, eventId) => (updateById(eventData, eventId));

const insertEvent = (eventData) => (insert(eventData));

module.exports = {
    getAllEvents,
    updateEvent,
    insertEvent,
}