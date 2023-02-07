/**
 * Validation rules for Product resource 
 */

import { body } from 'express-validator'

export const productRules = [
    body('name').isString().withMessage('Has to be a string').bail().isLength({ min: 3 }).withMessage('Has to be minimum 2 characters long'),
    body('description').isString().withMessage('Has to be a string'),
    body('price').isInt({min: 1}).withMessage('Has to be a number larger than 0'),
    body('images').isObject().withMessage('Has to be an object'),
    body('stock_status').isIn(["instock", "outofstock"]).withMessage('Has to be a string of "instock" or "outofstock"'),
    body('stock_quantity').isInt({min: 0}),
]