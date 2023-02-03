import express from "express"
import products from './products'
import orders from './orders'

// instantiate a new router
const router = express.Router()

/**
 * GET /
 */
router.get('/', (req, res) => {
    res.send({
        message: "I AM API, BEEP BOOP",
    })
})

router.use('/orders', orders)
router.use('/products', products)

router.post('/products', products)


export default router
