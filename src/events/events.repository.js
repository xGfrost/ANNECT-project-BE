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

const insert = (eventData) => (
    prisma.events.create({
        data: { ...eventData }
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
    insert,
}