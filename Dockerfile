FROM node:20.0-alpine3.16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the application source code
COPY . .

# Start the application
CMD ["npm", "run", "dev"]
