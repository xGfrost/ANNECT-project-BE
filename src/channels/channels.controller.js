const express = require('express')
const { getall, getbyid, create, update } = require('./channels.service');
const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const ch = await getall();
        res.send(ch)
    } catch (error) {
        res.status(400).send(error.message)
    }
})

router.get('/:id', async (req, res) => {
    try {
        const id = req.params.id
        const ch = await getbyid(id);
        res.send(ch)
    } catch (error) {
        res.status(400).send(error.message)
    }
})

router.post('/', async (req,res) => {
    const{file}= req;
    const image = file.filename;
    try {
        const channelsdata = req.body;
        channelsdata.image = image;
        const ch = await create(channelsdata);
        res.send(ch);
    } catch (error) {
        res.status(400).send(error.message)
    }
})

router.post('/:id', async (req,res) => {
    const{file}= req;
    const image = file.filename;
    try {
        const id = req.params.id
        const channelsdata = req.body;
        channelsdata.image = image;
        const ch = await update(id, channelsdata);
        res.send(ch);
    } catch (error) {
        res.status(400).send(error.message)
    }
})



module.exports = router;