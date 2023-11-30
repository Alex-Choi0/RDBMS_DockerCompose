# RDBMS_DockerCompose

<h2>MySQL</h2>
<p>mysql(<a href="https://engineeringshw.blogspot.com/2023/11/docker-compose-yaml-mysql-local.html">링크</a>)</p>
<p>branch : mysql_8.2.0</p>
<p></br></p>
<p></br></p>
<h2>Redis</h2>
<p>redis(<a href="https://engineeringshw.blogspot.com/2023/11/docker-compose-yaml-redis-local.html">링크</a>)</p>
<p>Redis 접속 방법 : redis-cli -h [호스트명] -p [포트번호] -a [비밀번호]</p>
<p>Redis 접속 후에 비밀번호 입력 : AUTH yourPassword</p>
<p>branch : redis_7.2.3</p>
<p></br></p>
<h3>간단한 명령어</h3>
<p>SET: 키-값 쌍을 저장합니다. : SET key value</p>
<p>GET: 지정된 키의 값을 검색합니다. : GET key</p>
<p>INCR: 숫자 값을 가진 키의 값을 1 증가시킵니다. : INCR key</p>
<p>DEL: 키 해당 키값을 삭제합니다.  : DEL key</p>
<p>EXPIRE: 키에 만료 시간(초 단위)을 설정합니다. : EXPIRE key seconds</p>
