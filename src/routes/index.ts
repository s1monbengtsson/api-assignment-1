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

router.use('/products', products)

router.use('/orders', orders)

export default router
