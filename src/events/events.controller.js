const { Router } = require("express");
const {
  getAllEvents,
  updateEvent,
  insertEvent,
  getEventDetail,
} = require("./events.service");
const router = Router();

router.get("/", async (req, res) => {
  try {
    const name = req.query.name;
    const is_paid = req.query.is_paid === 'true'; // Konversi string 'true' atau 'false' ke Boolean
    let event;
    
    if (name || typeof is_paid === 'boolean') {
      event = await getAllEvents(name, is_paid);
    } else {
      event = await getAllEvents(); // Jika tidak ada parameter, ambil semua events
    }
    // const allEvents = await getAllEvents();
    res.send(event);
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.post("/:event_id", async (req, res) => {
  try {
    const { event_id } = req.params;
    const updatedEvent = await updateEvent(req.body, event_id);
    res.send(updatedEvent);
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.get("/:event_id", async (req, res) => {
  try {
    const { event_id } = req.params;
    const eventDetail = await getEventDetail(event_id);
    res.send(eventDetail);
  } catch (error) {
    res.status(400).send(error.message);
  }
});

router.post("/", async (req, res) => {
  try {
    const insertedEvent = await insertEvent(req.body);
    res.send(insertedEvent);
  } catch (error) {
    if (error.message == "NOT AUTHORIZED") {
      res.status(403).send(error.message);
    }
    res.status(400).send(error.message);
  }
});

module.exports = router;
