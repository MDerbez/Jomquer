#!/bin/bash

# Script para crear una nueva release de Jomquer
# Uso: ./create-release.sh <version>
# Ejemplo: ./create-release.sh v0.1.0

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Error: Debes especificar una versión"
    echo "Uso: $0 <version>"
    echo "Ejemplo: $0 v0.1.0"
    exit 1
fi

echo "🚀 Creando release $VERSION..."

# Verificar que estamos en la rama correcta
CURRENT_BRANCH=$(git branch --show-current)
echo "📋 Rama actual: $CURRENT_BRANCH"

# Verificar que no hay cambios pendientes
if [[ -n $(git status --porcelain) ]]; then
    echo "❌ Error: Hay cambios sin commitear"
    git status
    exit 1
fi

# Actualizar desde remote
echo "🔄 Actualizando desde remote..."
git pull origin $CURRENT_BRANCH

# Crear y push del tag
echo "🏷️  Creando tag $VERSION..."
git tag -a "$VERSION" -m "Release $VERSION"

echo "⬆️  Pushing tag to remote..."
git push origin "$VERSION"

echo "✅ Tag creado y enviado exitosamente!"
echo "🔗 Ve a GitHub para verificar que se creó la release automáticamente:"
echo "   https://github.com/MDerbez/Jomquer/releases"
echo ""
echo "Si no se creó automáticamente, puedes crearla manualmente en GitHub."