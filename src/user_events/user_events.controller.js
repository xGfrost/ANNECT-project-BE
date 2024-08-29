const { getUserEventById } = require('./user_events.service');
const { Router } = require('express');
const router = Router();

router.get('/:user_event_id', async (req, res) => {
    try {
        const { user_event_id } = req.params;
        const userEventDetail = await getUserEventById(user_event_id);
        res.send(userEventDetail)
    } catch (error) {
        res.status(400).send(error.message);
    }
})

module.exports = router;