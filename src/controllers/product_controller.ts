import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'
import Debug from 'debug'
import { debug } from 'console'

// get all resources
export const index = async (req: Request, res: Response) => {

    try {
        const products = await prisma.product.findMany()

        res.send({
            "status": "success",
            data: products
        })
    } catch (err) {
        debug("Error found when finding all products")
        res.status(500).send({
            message: "Could not find products"
        })
    }
}

// get a single resource
export const show = async (req: Request, res: Response) => {

    const productId = Number(req.params.productId)

    try {
        const product = await prisma.product.findUniqueOrThrow({
            where: {
                id: productId
            }
        })
        res.send(product)

    } catch (err) {
        res.status(400).send({
            message: "Could not find product"
        })
    }
}



// creates a new resource
export const store = async (req: Request, res: Response) => {

    // check for validation errors
    const validationErrors = validationResult(req)
    if (!validationErrors.isEmpty()) {
        return res.status(400).send({
            status: "fail",
            data: validationErrors.array()
        })
    }

    try {
        const product = await prisma.product.create({
            data: {
                id: req.body.id,
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                images: req.body.images,
                stock_status: req.body.stock_status,
                stock_quantity: req.body.stock_quantity,
            }
        })
        res.send(product)

    } catch (err) {
        res.status(500).send({
            message: "Could not create a new product."
        })
    }
}