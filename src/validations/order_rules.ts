/**
 * Validation rules for Order resource
 */
import { body } from 'express-validator'


export const orderRules = [
    body('customer_first_name').isString().withMessage('Has to be a string').bail().isLength({ min: 2 }).withMessage('Has to be minimum 2 characters long'),
    body('customer_last_name').isString().withMessage('Has to be a string').bail().isLength({ min: 2 }).withMessage('Has to be minimum 2 characters long'),
    body('customer_address').isString().withMessage('Has to be a string').bail().isLength({ min: 3 }).withMessage('Has to be minimum 3 characters long'),
    body('customer_postcode').isString().withMessage('Has to be a string').bail().isLength({ min: 5, max: 6 }).withMessage('Has to be between 5 characters long'),
    body('customer_city').isString().withMessage('Has to be a string').bail().isLength({ min: 2 }).withMessage('Has to be minimum 2 characters long'),
    body('customer_email').isEmail().withMessage('Has to be a valid email'),
    body('customer_phone').isString().withMessage('Has to be a string').bail().isLength({ min: 10, max: 10}).withMessage('Has to be 10 characters long'),
    body('order_items.*.product_id').isInt({min:1}).withMessage('Cannot be 0'),
    body('order_items.*.qty').isInt({min:1}).withMessage('Cannot be 0'),
    body('order_items.*.item_price').isInt({min:1}).withMessage('Cannot be 0'),
    body('order_items.*.item_total').isInt({min:1}).withMessage('Cannot be 0'),
]
