/**
 * Validation rules for Product resource 
 */

import { body } from 'express-validator'

export const productRules = [
    body('name').isString().withMessage('Has to be a string').bail().isLength({ min: 3 }).withMessage('Has to be minimum 2 characters long'),
    body('description').isString().withMessage('Has to be a string'),
    body('price').isNumeric().withMessage('Has to be a number').bail().notEmpty(),
    body('images').isObject().withMessage('Has to be an object'),
    body('stock_status').isString().withMessage('Has to be a string'),
    body('stock_quantity').isNumeric().withMessage('Has to be a number'),
]