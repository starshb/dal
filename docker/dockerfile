FROM ubuntu:20.04

#우분투 업데이트, git 관련설치
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y git curl \
 && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
 && apt-get install -y git-lfs \
 && git lfs install \
 && rm -rf /var/lib/apt/lists/*

#각종 유틸 설치
RUN apt-get update \
 && apt-get install -y unzip \
 && apt-get install -y wget \
 && apt-get install -y vim


#JDK 설치 및 환경변수 등록
ENV DEBIAN_FRONTEND=noninteractive
RUN 6 | apt-get install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

#Gradle 설치 및 환경변수 등록
ADD https://services.gradle.org/distributions/gradle-7.1-all.zip /opt/
RUN unzip /opt/gradle-7.1-all.zip -d /opt/gradle
ENV GRADLE_HOME /opt/gradle/gradle-7.1
ENV PATH $GRADLE_HOME/bin:$PATH

#젠킨스 관련 변수 및 환경변수 등록
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000
ARG JENKINS_HOME=/var/jenkins_home
ARG REF=/usr/share/jenkins/ref
ENV JENKINS_HOME $JENKINS_HOME
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV REF $REF


RUN mkdir -p $JENKINS_HOME \
 && chown ${uid}:${gid} $JENKINS_HOME \
 && groupadd -g ${gid} ${group} \
 && useradd -d /var/jenkins_home -u ${uid} -g ${gid} -m -s /bin/bash ${user}

#로컬 호스트와 공유할 컨테이너 내부 디렉토리 설정
VOLUME $JENKINS_HOME

RUN mkdir -p ${REF}/init.groovy.d

#tini 설치
ARG TINI_VERSION=v0.16.1
COPY tini_pub.gpg ${JENKINS_HOME}/tini_pub.gpg
RUN curl -fsSL https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-$(dpkg --print-architecture) -o /sbin/tini \
 && curl -fsSL https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-$(dpkg --print-architecture).asc -o /sbin/tini.asc \
 && gpg --no-tty --import ${JENKINS_HOME}/tini_pub.gpg \
 && gpg --verify /sbin/tini.asc \
 && rm -rf /sbin/tini.asc /root/.gnupg \
 && chmod +x /sbin/tini

#Jenkins버전 지정 및 환경변수 등록
ARG JENKINS_VERSION
ENV JENKINS_VERSION ${JENKINS_VERSION:-2.289.1}

#Jenkins 설치에 필요한 SHA-256 (Jenkins 버전에 따라 달라짐)
ARG JENKINS_SHA=70f9cc6ff1ac59aeeb831b980709a9ddb0ee70d216ee50625a8508b9840f75f2

#Jenkins 다운로드 Url 변수 등록
ARG JENKINS_URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war

#Jenkins 다운로드 및 설치
RUN curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war && \
    echo "${JENKINS_SHA}  /usr/share/jenkins/jenkins.war" | sha256sum -c -
ENV JENKINS_UC https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
ENV JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals
RUN chown -R ${user} /var/jenkins_home "$REF"

#Android SDK 설치, 라이센스 등록, 환경변수 등록(sdk 버전 30, 29)
RUN apt-get update && apt-get -y install mc && mkdir /var/android-sdk && cd /var/android-sdk
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN chown -R jenkins:jenkins /var/android-sdk/
RUN unzip sdk-tools-linux-4333796.zip
RUN mv tools /var/android-sdk/
RUN cd /var/android-sdk/tools/bin/
RUN yes | /var/android-sdk/tools/bin/sdkmanager --update
RUN yes | /var/android-sdk/tools/bin/sdkmanager --licenses
RUN yes | /var/android-sdk/tools/bin/sdkmanager --list
RUN yes | /var/android-sdk/tools/bin/sdkmanager \
"tools" \
"platform-tools" \
"platforms;android-30" \
"build-tools;30.0.0" \
"build-tools;30.0.1" \
"build-tools;30.0.2" \
"build-tools;30.0.3" \
"platforms;android-29" \
"build-tools;29.0.0" \
"build-tools;29.0.1" \
"build-tools;29.0.2" \
"extras;android;m2repository" \
"extras;google;m2repository"
RUN rm -r sdk-tools-linux-4333796.zip

# 웹포트 지정
EXPOSE ${http_port}

# slave agent포트 지정. 도커엔진이 사용하는 포트이다.
EXPOSE ${agent_port}

ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log

USER ${user}

COPY jenkins-support /usr/local/bin/jenkins-support
COPY jenkins.sh /usr/local/bin/jenkins.sh
COPY tini-shim.sh /bin/tini
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

# from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup ${REF}/plugins from a support bundle
COPY plugins.sh /usr/local/bin/plugins.sh
COPY install-plugins.sh /usr/local/bin/install-plugins.sh