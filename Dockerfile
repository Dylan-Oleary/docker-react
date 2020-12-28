# Base Image - BUILD PHASE
FROM node:alpine
WORKDIR /app

COPY package*.json ./
RUN yarn

COPY ./ ./

RUN yarn build

# Base Image - RUN PHASE
FROM nginx
EXPOSE 80
# Copy build folder from previous stage into nginx
COPY --from=0 /app/build /usr/share/nginx/html



