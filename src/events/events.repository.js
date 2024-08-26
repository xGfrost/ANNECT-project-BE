const prisma = require('../db/index');

const getAll = () => (
    prisma.events.findMany({
        include: {
            user_events: {
                select: {
                    users: true
                }
            }
        }
    })
)

const updateById = (eventData, eventId) => (
    prisma.events.update({
        where: {
            id: eventId
        },
        data: {
            ...eventData
        }
    })
)

module.exports = {
    getAll,
    updateById,
}