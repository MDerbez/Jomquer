# Guía de Publicación (Release Guide)

Esta guía explica cómo publicar nuevas versiones de Jomquer.

## Crear una Nueva Release

### Opción 1: Release Manual (Recomendado para la primera vez)

1. **Actualizar el código**
   - Asegúrate de que todos los cambios estén commiteados
   - Actualiza el CHANGELOG.md con los nuevos cambios
   - Actualiza la versión en package.json si corresponde

2. **Crear un tag de versión**
   ```bash
   git tag -a v0.1.0 -m "Release v0.1.0"
   git push origin v0.1.0
   ```

3. **Crear la release en GitHub**
   - Ve a https://github.com/MDerbez/Jomquer/releases
   - Haz clic en "Create a new release"
   - Selecciona el tag v0.1.0
   - Título: "Jomquer v0.1.0"
   - Descripción: Copia el contenido relevante del CHANGELOG.md
   - Haz clic en "Publish release"

### Opción 2: Release Automática (Usando GitHub Actions)

1. **Via tag push**
   ```bash
   git tag -a v0.1.0 -m "Release v0.1.0"
   git push origin v0.1.0
   ```
   Esto activará automáticamente el workflow de release.

2. **Via workflow manual**
   - Ve a Actions > Release workflow
   - Haz clic en "Run workflow"
   - Introduce la versión (ej: v0.1.0)
   - Haz clic en "Run workflow"

## Estructura de Versionado

Seguimos [Semantic Versioning](https://semver.org/lang/es/):
- **MAJOR.MINOR.PATCH** (ej: 1.0.0)
- **MAJOR**: Cambios incompatibles con versiones anteriores
- **MINOR**: Nueva funcionalidad compatible con versiones anteriores
- **PATCH**: Corrección de errores compatibles con versiones anteriores

## Checklist para Releases

- [ ] Código actualizado y testeado
- [ ] CHANGELOG.md actualizado
- [ ] package.json con versión correcta
- [ ] Tag creado con git
- [ ] Release creada en GitHub
- [ ] Documentación actualizada si es necesario

## Distribución de la Aplicación

Si tu aplicación tiene archivos binarios o build artifacts:

1. **Subir archivos a la release**
   - Compila/construye tu aplicación
   - Sube los archivos resultantes a la release de GitHub
   - Incluye instrucciones de instalación en la descripción

2. **Distribución via package managers**
   - Para Node.js: `npm publish`
   - Para Python: `twine upload dist/*`
   - Para otros: sigue las guías específicas del ecosistema

## Próximos Pasos

1. Crea tu primera release (v0.1.0)
2. Sube los archivos de tu aplicación construida
3. Actualiza las instrucciones de instalación en README.md
4. Considera automatizar el proceso de build si aún no lo has hecho