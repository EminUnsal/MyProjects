**Proje Talimatları**

**1:** 5 node'lu "1 Master + 4 Worker Node" bir Kubernetes cluster kurun. 

**2:** "test" ve "production" adlarında 2 namespace oluşturun.

**3:** "junior" isimli grubun "test" namespace'inde tüm kaynaklar üstünde "okuma, listeleme, yaratma..." gibi tüm haklara, "production" namespace'inde ise tüm kaynaklar üstünde sadece "okuma ve listeleme" haklarına sahip olacağı rol oluşturup bunları grupla ilişkilendirin. Aynı şekilde "senior" isimli grubun "production" ve "test" namespace'lerindeki tüm kaynaklar üstünde "okuma, listeleme, yaratma..." gibi tüm haklara ve cluster üstündeki diğer kaynaklar üstünde ise sadece "okuma ve listeleme" haklarına sahip olacağı rol oluşturup bunları grupla ilişkilendirin.

**4:** Sizin seçeceğiniz bir "ingress controller" kurun. (nginx, traefik, haproxy vb.)

**5:** Cluster'da seçeceğiniz 3 worker node sadece "production" ortamında deploy edeceğiniz ve cluster tarafından oluşturulan podlar schedule edilebilsin. Bunun dışındaki podların bu worker node üstünde oluşturulmamasını sağlayın. 

**6:** Wordpress uygulamasını hem "test" hem de "production" namespace'lerinde deploy edin. (wordpress:latest ve mysql:5.6 imajlarından oluşturulacak)

- mysql "ClusterIp" tipi bir servisle cluster içinden erişilebilir olacak. 
- Her iki uygulamanın da uzun dönem verilerini "persistent volume"ler üzerinde saklanacak.
- Her iki uygulamanın da hiç bir hassas bilgisi "ör: şifre" uygulama ya da yaml dosyaları içerisinde tutulmayacak. 
- Her iki uygulama da aynı worker node üstünde schedule edilecek.
- Her iki uygulama için de cpu ve memory kaynak kısıtları tanımlı olacak.  

**7:** "test" namespace'inde deploy edilen wordpress uygulaması "testblog.example.com", "production" namespace'inde deploy edilen wordpress uygulaması "companyblog.example.com" olarak ingress üstünden dış dünyaya expose edilecek. 
