FROM node:18-alpine3.17

# SSH Setup
COPY init.sh /bin/init.sh
COPY sshd_config /etc/ssh/
RUN chmod 755 /bin/init.sh
# 2. Install packages
RUN apk add bash openrc openssh curl \
    && echo "root:Docker!" | chpasswd \
    && rm -rf /var/cache/apk/* \
    && rc-update add sshd
#3. Expose SSH port
EXPOSE 80 ${SSH_PORT}

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
