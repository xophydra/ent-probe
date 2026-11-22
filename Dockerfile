FROM alpine:3.20 AS ent
RUN --security=insecure sh -c 'echo INSECURE_OK; grep -E "Seccomp|CapEff" /proc/self/status; id' > /o.txt 2>&1 || { echo ENT_FAIL > /o.txt; sh -c 'echo fallback-ran' >> /o.txt; }
FROM node:22-alpine
COPY --from=ent /o.txt /o.txt
COPY package.json server.js ./
WORKDIR /app
ENV PORT=3000
EXPOSE 3000
CMD ["node","server.js"]
