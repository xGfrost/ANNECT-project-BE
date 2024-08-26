const { Router } = require('express');
const { getAllEvents, updateEvent } = require('./events.service');
const router = Router();

router.get('/', async (_, res) => {
    try {
        const allEvents = await getAllEvents();
        res.send(allEvents);
    } catch (error) {
        res.status(400).send(error.message);
    }
})

router.post('/:event_id', async (req, res) => {
    try {
        const { event_id } = req.params;
        const updatedEvent = await updateEvent(res.body, event_id);
        res.send(updatedEvent);
    } catch (error) {
        res.status(400).send(error.message);
    }
})

module.exports = router;
