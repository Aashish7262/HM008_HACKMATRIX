# ---------- BUILD STAGE ----------
FROM eclipse-temurin:17-jdk AS builder

WORKDIR /app

COPY . .

RUN ./mvnw clean package -DskipTests

# ---------- RUN STAGE ----------
FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY --from=builder /app/target/Farmer-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
