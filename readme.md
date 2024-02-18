# Scala-cli && docker-compose

Database based on <https://www.w3schools.com/postgresql/postgresql_create_demodatabase.php>

```bash
docker run -d\
  --name postgres \
  --restart always \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 postgres
```

```bash
//removing name
docker run -d\
  --restart always \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 postgres
```

```bash
docker run -d \
  --restart always \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -v $(pwd)/db.v001.sql:/db.v001.sql \
  postgres
  ```

## run migration

``` bash
$> docker exec -it <container> psql -U postgres
$> \c
$> \i db.v001.sql
```


```curl
curl 'https://www.metrocuadrado.com/rest-search/search?realEstateBusinessList=venta&realEstateStatusList=usado&locationsList=chapinero&realEstateTypeList=apartamento&from=0&size=50' \
  -H 'authority: www.metrocuadrado.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-US,en;q=0.9,es-CO;q=0.8,es;q=0.7,la;q=0.6,gl;q=0.5' \
  -H 'cookie: at_check=true; AMCVS_9873253863FFB2BE0A495C51%40AdobeOrg=1; _gcl_au=1.1.1890795278.1702521995; _fbp=fb.1.1702521994983.833890700; _tt_enable_cookie=1; _ttp=0zSss4ar1UzFqaeUZb3gGgoL3a4; _hjSessionUser_3298791=eyJpZCI6IjcyNzYxNzI4LWY1NjItNThjNy1hZjBmLWRhNWNiNWZiMWIxMCIsImNyZWF0ZWQiOjE3MDI1MjE5OTQ4NTcsImV4aXN0aW5nIjp0cnVlfQ==; mzona=; mbarrio=; companyType=; companyName=; midempresa=; G_ENABLED_IDPS=google; s_cc=true; _hjSessionUser_966913=eyJpZCI6IjAzMzU1ZmQ2LWU3ZWEtNWIyZS1iZTlmLWZjODBiMDc2NTM4MCIsImNyZWF0ZWQiOjE3MDI3NjE5OTM4NzUsImV4aXN0aW5nIjp0cnVlfQ==; CASTGCBUILDERS=TGT-1701830864953-qJOe6QbPBFrGHRr2fqX6c7AbCz0JcIdunDokNEl2tJQsVICtDo-www.metrocuadrado.com; CASTGCSELLERS=TGT-1701830864953-qJOe6QbPBFrGHRr2fqX6c7AbCz0JcIdunDokNEl2tJQsVICtDo-www.metrocuadrado.com; _rtbhouse_source_=direct; s_cm=Other%20Natural%20Referrersundefinedcheckout.payulatam.com; customRedirectLogin=https://www.metrocuadrado.com/publicar-inmuebles/publication/property/edit/MC4725255; s_v8=%5B%5B%27other%2520natural%2520referrers%253A%2520checkout.payulatam.com%27%2C%271702766837519%27%5D%2C%5B%27other%2520natural%2520referrers%253A%2520checkout.payulatam.com%27%2C%271702766848233%27%5D%2C%5B%27other%2520natural%2520referrers%253A%2520checkout.payulatam.com%27%2C%271702766857752%27%5D%2C%5B%27other%2520natural%2520referrers%253A%2520checkout.payulatam.com%27%2C%271702767279079%27%5D%2C%5B%27other%2520natural%2520referrers%253A%2520checkout.payulatam.com%27%2C%271702767286799%27%5D%5D; _ga_9FV726Q1DW=GS1.1.1702846566.4.1.1702846601.25.0.0; utag_main_v_id=018c6637fbb1003041aaa83a650205075001e06d01328; s_vnum=1708380926084%26vn%3D1; s_v10=%5B%5B%27Typed%2FBookmarked%27%2C%271702846578769%27%5D%2C%5B%27Typed%2FBookmarked%27%2C%271702938673817%27%5D%2C%5B%27Typed%2FBookmarked%27%2C%271702951999372%27%5D%2C%5B%27Typed%2FBookmarked%27%2C%271702997224980%27%5D%2C%5B%27Typed%2FBookmarked%27%2C%271705788926085%27%5D%5D; s_sq=%5B%5BB%5D%5D; s_nr=1705790768258-New; s_lv=1705790768259; _gid=GA1.2.1916445876.1708236820; AMCV_9873253863FFB2BE0A495C51%40AdobeOrg=179643557%7CMCIDTS%7C19772%7CMCMID%7C61164510472318969631782477883886060203%7CMCAAMLH-1708841632%7C4%7CMCAAMB-1708841632%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1708244032s%7CNONE%7CvVersion%7C5.5.0; utag_main_dc_visit=5; mciudad=; mubicacion=chapinero; location=chapinero; mtipoinmueble=apartamento; mtiponegocio=venta-usado; lastSearch=%2Fapartamento%2Fventa%2Fusado%2Fchapinero%2F%3Fsearch%3Dsave%26realEstateBusinessList%3Dventa%26realEstateStatusList%3Dusado%26locationsList%3Dchapinero%26realEstateTypeList%3Dapartamento; _ga=GA1.2.952584573.1702521995; _ga_02LQXVPQF9=GS1.1.1708242725.27.0.1708242725.0.0.0; utag_main__sn=22; utag_main__se=1%3Bexp-session; utag_main__ss=1%3Bexp-session; utag_main__st=1708244525523%3Bexp-session; utag_main_ses_id=1708242725523%3Bexp-session; utag_main__pn=1%3Bexp-session; mbox=PC#9892103f5dc949d883bb382d92f71c59.34_0#1771487526|session#4c52f68ee15d47b498130adddcc20d3f#1708244586; mboxEdgeCluster=34' \
  -H 'referer: https://www.metrocuadrado.com/apartamento/venta/usado/chapinero/?search=form' \
  -H 'sec-ch-ua: "Not A(Brand";v="99", "Google Chrome";v="121", "Chromium";v="121"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36' \
  -H 'x-api-key: P1MfFHfQMOtL16Zpg36NcntJYCLFm8FqFfudnavl' \
  -H 'x-requested-with: XMLHttpRequest' \
  --compressed
  ```