const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const EquipoSchema = new Schema({
    nombre: { type: String, required: true, unique: true, index: true },
    escudo_url: { type: String },
    rating_general: { type: Number, default: 0 },
    api_football_data_id: { type: Number },
    api_sportsdb_id: { type: Number },
    pais: {
        codigo: { type: String, uppercase: true, max_length: 3 },
        nombre: { type: String },
        bandera_url: { type: String }
    }
}, { timestamps: true });

const JugadorRatingSchema = new Schema({
    fecha: { type: Date, required: true, default: Date.now },
    velocidad: { type: Number, default: 0 },
    definicion: { type: Number, default: 0 },
    pase: { type: Number, default: 0 },
    regate: { type: Number, default: 0 },
    defensa: { type: Number, default: 0 },
    fisico: { type: Number, default: 0 },
    rating_general: { type: Number, default: 0 }
}, { timestamps: true });

const JugadorSchema = new Schema({
    nombre: { type: String, required: true, index: true },
    edad: { type: Number },
    equipo_id: { type: Schema.Types.ObjectId, ref: 'Equipo', index: true },
    atributos: {
        velocidad: { type: Number, default: 0 },
        definicion: { type: Number, default: 0 },
        pase: { type: Number, default: 0 },
        regate: { type: Number, default: 0 },
        defensa: { type: Number, default: 0 },
        fisico: { type: Number, default: 0 }
    },
    rating_general: { type: Number, default: 0 },
    historial_ratings: [JugadorRatingSchema]
}, { timestamps: true });

const CompeticionSchema = new Schema({
    nombre: { type: String, required: true },
    tipo: { type: String, required: true, index: true },
    logo_url: { type: String },
    liga: {
        nombre: { type: String },
        logo_url: { type: String }
    }
}, { timestamps: true });

const EstadisticaPartidoSchema = new Schema({
    posesion_local: { type: Number, default: 0 },
    posesion_visitante: { type: Number, default: 0 },
    tiros_local: { type: Number, default: 0 },
    tiros_visitante: { type: Number, default: 0 },
    corners: { type: Number, default: 0 }
});

const CuotaSchema = new Schema({
    local: { type: Number },
    empate: { type: Number },
    visitante: { type: Number },
    casa_apuesta: { type: String },
    fecha_actualizacion: { type: Date, default: Date.now }
});

const PronosticoEmpresaSchema = new Schema({
    probabilidad_local: { type: Number, required: true },
    probabilidad_empate: { type: Number, required: true },
    probabilidad_visitante: { type: Number, required: true },
    recomendacion: { type: String, required: true },
    analisis_detalle: { type: String },
    es_premium: { type: Boolean, default: false },
    fecha_generacion: { type: Date, default: Date.now }
});

const PartidoSchema = new Schema({
    equipo_local_id: { type: Schema.Types.ObjectId, ref: 'Equipo', required: true, index: true },
    equipo_visitante_id: { type: Schema.Types.ObjectId, ref: 'Equipo', required: true, index: true },
    fecha: { type: Date, required: true, index: true },
    estado: { type: String, required: true, index: true },
    competicion_id: { type: Schema.Types.ObjectId, ref: 'Competicion', index: true },
    estadisticas: EstadisticaPartidoSchema,
    cuotas: [CuotaSchema],
    pronostico: PronosticoEmpresaSchema
}, { timestamps: true });

const SuscripcionSchema = new Schema({
    tipo: { type: String, required: true, enum: ['Gratis', 'Premium', 'VIP'], default: 'Gratis' },
    estado: { type: String, required: true, enum: ['Activa', 'Inactiva', 'Expirada'], default: 'Inactiva' },
    fecha_inicio: { type: Date },
    fecha_fin: { type: Date },
    id_pago: { type: String }
});

const UsuarioSchema = new Schema({
    nombre: { type: String, required: true },
    email: { type: String, required: true, unique: true, index: true },
    password: { type: String, required: true },
    rol: { type: String, enum: ['Usuario', 'Administrador'], default: 'Usuario' },
    suscripcion: SuscripcionSchema
}, { timestamps: true });

module.exports = {
    Equipo: mongoose.model('Equipo', EquipoSchema),
    Jugador: mongoose.model('Jugador', JugadorSchema),
    Competicion: mongoose.model('Competicion', CompeticionSchema),
    Partido: mongoose.model('Partido', PartidoSchema),
    Usuario: mongoose.model('Usuario', UsuarioSchema)
};
