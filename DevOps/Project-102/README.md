**Proje Talimatları**

**1:** "production" namespace'inde "ozgurozturknet/k8s:v1" imajından, 5 replikalı, update stratejisi olarak aynı anda 2 pod'un update edilebileceği bir deployment oluşturun. "/healthcheck" endpoint'ini sorgulayan "liveness probe" ve "/ready" endpoint'ini sorgulayan bir "readiness probe" tanımları da olsun. 

**2:** Bir önceki görevde oluşturduğunuz deployment'i "loadbalancer" tipi bir servisle dış dünyadan erişilebilir hale getirin. 

**3:** Bu deployment'i önce 3 replikaya indirin. Ardından 10 replikaya çıkarın. Sonrasında bu deployment'i "ozgurozturknet/k8s:v2" imajıyla güncelleyin.

**4:** "fluentd" uygulamasını bir "daemonset" olarak cluster'da deploy edin. 

**5:** 2 node'lu bir "mongodb" cluster'i "statefulset" olarak cluster'da deploy edin. "mongodb" cluster'ın çalıştığından emin olun. 

**6:** Cluster'da tüm objeler üstünde "okuma ve listeleme" haklarına sahip bir "service account" oluşturun. Bu service account’u bağladığınız bir pod oluşturun ve bağlanarak "curl" ile cluster’daki tüm podları listeleyin. 

**7:** Worker node'lardan bir tanesinin üzerindeki tüm podları tahliye edin ve ardından yeni pod schedule edilememesini sağlayın. 