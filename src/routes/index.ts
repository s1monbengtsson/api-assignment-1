import express from "express"
import products from './products'
import orders from './orders'
import { orderRules } from "../validations/order_rules"
import { productRules } from "../validations/product_rules"

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

router.use('/orders', orderRules, orders)

// router.post('/orders', orders)

router.use('/products', productRules, products)

// router.post('/products', products)


export default router
