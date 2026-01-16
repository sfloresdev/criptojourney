import { Redis } from '@upstash/redis';

const redis = new Redis({
    url: process.env.UPSTASH_KV_REST_URL,
    token: process.env.UPSTASH_KV_REST_TOKEN,
});

export default async function handler(req, res) {
    try{
        const cookieHeader = req.headers.cookie || '';
        const cookies = Object.fromEntries(
            cookieHeader
                .split('; ')
                .map(c => c.trim())
                .filter(c => c.includes('='))
                .map(c => c.split('='))
        );

        if(!cookies.visitor_counted){
            //Incrementamos el contador solo si no existe la cookie
            const visitas = await redis.incr('contador_visitas');

            // Mandamos cookie de sesion que expira al cerrar el navegador
            res.setHeader('Set-Cookie', `visitor_counted=true; Path=/; HttpOnly`);

            // Devolvemos status code 200 ('OK')
            return res.status(200).json({visitas});
        } else {
            const visitas = await redis.get('contador_visitas') || 0;
            return res.status(200).json({visitas});
        }
    } catch (err){
        console.error(err);
        return res.status(500).json({error: 'Error incrementando el contador'});
    }
}