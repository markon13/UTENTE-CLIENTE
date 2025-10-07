FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY prisma ./prisma/

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Generate Prisma Client
RUN npx prisma generate

# Build Next.js app
RUN npm run build

EXPOSE 3000

# Run migrations and start
CMD ["sh", "-c", "npx prisma migrate deploy && npm start"]
