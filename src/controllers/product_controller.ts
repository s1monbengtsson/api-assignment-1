import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'

// get all resources
export const index = async (req: Request, res: Response) => {

    try {
        const products = await prisma.product.findMany()

        res.status(200).send({
            status: "success",
            data: products
        })
    } catch (err) {
        res.status(500).send({
            message: "Something went wrong"
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
        res.status(200).send({
            status: "success",
            data: product
        })

    } catch (err) {
        res.status(404).send({
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

    const { id, name, description, price, images, stock_status, stock_quantity } = req.body

    try {
        const product = await prisma.product.create({
            data:
            {
                id,
                name,
                description,
                price,
                images,
                stock_status,
                stock_quantity,
            }
        })
        res.status(201).send({
            status: "success",
            data: product
        })

    } catch (err) {
        res.status(500).send({
            status: "fail",
            message: "Could not create product."
        })
    }
}