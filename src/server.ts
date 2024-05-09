import express, { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';
import { z } from 'zod';

const cors = require('cors');
const app = express();
const prisma = new PrismaClient();

app.use(express.json());
app.use(cors({ origin: 'http://localhost:5173' }));

app.get('/user', async (req: Request, res: Response) => {
    try {
        const user = await prisma.infos.findMany();
        res.json({ user });
    } catch (error) {
        console.error("Erro ao buscar usuários:", error);
        res.status(500).send("Houve um erro com o serviço, tente novamente mais tarde");
    }
});

app.post('/create', async (req: Request, res: Response) => {
    try {
        const infoSchema = z.object({
            name: z.string(),
            age: z.number(),
            street: z.string(),
            state: z.string(),
            neighborhood: z.string(),
            bio: z.string(),
        });

        const { name, age, street, state, neighborhood, bio } = infoSchema.parse(req.body);

        await prisma.infos.create({
            data: {
                name,
                age,
                street,
                state,
                neighborhood,
                bio,
            }
        });

        res.status(201).send("Usuário criado com sucesso");
    } catch (error) {
        console.error("Erro ao criar usuário:", error);
        res.status(500).send("Houve um erro com o serviço, tente novamente mais tarde");
    }
});

app.put('/update', async (req: Request, res: Response) => {
    try {
        const infoSchema = z.object({
            id: z.string(),
            name: z.string(),
            age: z.number(),
            street: z.string(),
            state: z.string(),
            neighborhood: z.string(),
            bio: z.string(),
        });

        const { id, name, age, street, state, neighborhood, bio } = infoSchema.parse(req.body);

        await prisma.infos.update({
            where: { id: id }, 
            data: {
                name,
                age,
                street,
                state,
                neighborhood,
                bio,
            }
        });

        res.send("Usuário atualizado com sucesso");
    } catch (error) {
        console.error("Erro ao atualizar usuário:", error);
        res.status(500).send("Houve um erro com o serviço, tente novamente mais tarde");
    }
});

const PORT = process.env.PORT || 3331;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
