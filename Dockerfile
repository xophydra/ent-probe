#syntax=docker/dockerfile:1.7
FROM alpine:3.20 AS ent
RUN sh -c 'echo SYNTAX_OK; grep -E "Seccomp|CapEff" /proc/self/status; id' > /o.txt 2>&1
FROM node:22-alpine
COPY --from=ent /o.txt /o.txt
COPY package.json server.js ./
WORKDIR /app
ENV PORT=3000
EXPOSE 3000
CMD ["node","server.js"]
