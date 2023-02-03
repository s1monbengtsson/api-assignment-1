import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'
import Debug from 'debug'
import { debug } from 'console'
import { resolveNaptr } from 'dns'

// get all resources
export const index = async (req: Request, res: Response) => {

    try {
        const orders = await prisma.order.findMany()

        res.send({
            status: "success",
            data: orders
        })
    } catch (err) {
        debug("Error found when finding all orders")
        res.status(500).send({
            message: "Could not find orders"
        })
    }
}


// get a single resource
export const show = async (req: Request, res: Response) => {

    const orderId = Number(req.params.orderId)

    try {
        const order = await prisma.order.findUniqueOrThrow({
            where: {
                id: orderId
            },
            include: {
                order_items: true
            }
        })
        res.send(order)

    } catch (err) {
        res.status(400).send({
            message: "Could not find order"
        })
    }
}

// creates a new resource
export const store = async (req: Request, res: Response) => {

    // check for validation errrors
    const validationErrors = validationResult(req)
    if (!validationErrors.isEmpty()) {
        return res.status(400).send({
            status: "fail",
            data: validationErrors.array()
        })
    }

    const { customer_first_name, customer_last_name, customer_address, customer_postcode, customer_city, customer_email, customer_phone, order_total, order_items } = req.body

    try {
        const order = await prisma.order.create({
            data: {
                customer_first_name,
                customer_last_name,
                customer_address,
                customer_postcode,
                customer_city,
                customer_email,
                customer_phone,
                order_total,
                order_items: {
                    create: order_items
                },
            },
            include: {
                order_items: true
            },
        })

        res.status(201).send({
            status: "success",
            data: order
        })

    } catch (err) {
        debug(err)
        res.status(500).send({
            message: "Could not create order"
        })
    }
}
