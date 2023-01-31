import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/product_controller'

const router = express.Router()

// get all products
router.get('/', index)

// get a single product
router.get('/:orderId', show)

// creates a new product
router.post('/', store)

export default router