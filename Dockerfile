FROM tomcat:9.0-jdk21

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR into Tomcat ROOT (so it runs on /)
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Limit memory for Render free tier (512MB)
ENV JAVA_OPTS="-Xmx256m"

EXPOSE 8080

CMD ["catalina.sh", "run"]