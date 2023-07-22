require 'open-uri'

# URL de la imagen que deseas utilizar como perfil del usuario
image_url = 'https://previews.123rf.com/images/siridhata/siridhata1612/siridhata161200032/67974628-ilustraci%C3%B3n-de-dibujos-animados-sonriente-del-vector-persona.jpg'

user = User.create!(
    email: 'normal@mail.com',
    password: '123456',
    password_confirmation: '123456',
    name: 'El usuario 1',
    phone: '123456789',
    cargo: 'Auxiliar'

)
user.avatar.attach(io: URI.open(image_url), filename: 'perfil.jpg', content_type: 'image/jpg')


# URL de la imagen que deseas utilizar como perfil del administrador
admin_image_url = 'https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg'

# Descarga la imagen desde la URL y asóciala al usuario administrador
admin = User.create!(
    email: 'admin@mail.com',
    password: '123456',
    password_confirmation: '123456',
    role: 'admin'
)
admin.avatar.attach(io: URI.open(admin_image_url), filename: 'perfil_admin.jpg', content_type: 'image/jpg')

# Crear ofertas laborales
JobOffer.create!(
    title: 'Desarrollador Full Stack',
    description: 'Buscamos un desarrollador Full Stack con experiencia en Ruby on Rails y React.js o tambien si alguno de nuestros programadores junior quiere intentar esta nueva experiencia.',
    user_id: 2
)

JobOffer.create!(
    title: 'Diseñador Gráfico',
    description: 'Se busca un diseñador gráfico creativo y talentoso para crear ilustraciones y diseños para nuestros productos.',
    user_id: 2 
)

JobOffer.create!(
    title: 'Diseñador Gráfico nivel 2',
    description: 'Se ofrece a los diseñadores graficos ya activos en la empresa el poder subir de nivel a 2 o a programador c.',
    user_id: 2 
)

JobOffer.create!(
    title: 'Desarrollador Web',
    description: 'Estamos buscando un desarrollador web con experiencia en HTML, CSS, JavaScript y frameworks como Ruby on Rails o Django.',
    user_id: 2
)

JobOffer.create!(
    title: 'Analista de Datos',
    description: 'Se necesita un analista de datos para recopilar, procesar y analizar grandes conjuntos de datos y proporcionar información valiosa.',
    user_id: 2
)

JobOffer.create!(
    title: 'Especialista en Marketing Digital',
    description: 'Buscamos un especialista en marketing digital para diseñar y ejecutar estrategias de marketing en línea y campañas publicitarias.',
    user_id: 2
)

JobOffer.create!(
    title: 'Ingeniero de Software o upgrade a programador senior',
    description: 'Se solicita un ingeniero de software para diseñar, desarrollar y probar aplicaciones y sistemas de software.',
    user_id: 2
)

JobOffer.create!(
    title: 'Asistente Administrativo',
    description: 'Estamos contratando a un asistente administrativo para ayudar en tareas de oficina, mantener registros y coordinar actividades administrativas.',
    user_id: 2
)