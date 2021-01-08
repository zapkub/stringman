# Stringman app
แอพ Stringman เป็นตัวอย่างการทำ deployment Golang application ขึ้น Linux Server โดยจะแบ่งการทำ Deployment เป็น 3 ขั้นตอน

1. การ Build artifact
2. การ Bundle artifact และ installation
3. การ Deploy

โดยมุ่งเน้นความเรียบง่ายในการ Ship และ Install ที่ Target remote server

## การ Build artifact
Artifact ถูก fix ไว้ให้ build ใน `GOOS=linux` และ `GOARCH=amd64` โดยจะ build binary file ไว้ที่ folder bin ของ distribute folder

ให้รันคำสั่ง และ arg สำหรับ version
```
$ ./build.sh [VERSION to build]
```
ตัวอย่างเช่น
```
$ ./build.sh v1.1.0
```

## การ bundle artifact
TBD



