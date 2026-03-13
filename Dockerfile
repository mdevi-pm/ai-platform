# Use lightweight Node runtime
FROM node:20-alpine

# Create working directory inside container
WORKDIR /app

# Copy dependency files first (improves caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source code
COPY . .

# Build production Next.js bundle
RUN npm run build

# Expose port used by Next.js
EXPOSE 3000

# Start Next.js production server
CMD ["npm","start"]
