Return-Path: <michele.portolan@imag.fr>
Received: from shiva.imag.fr (mx1.imag.fr [129.88.30.5])
	by arago-project.org (Postfix) with ESMTPS id 61BF75296D
	for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 06:19:44 +0000 (UTC)
Received: from manolette.imag.fr (manolette.imag.fr [129.88.34.201])
	by shiva.imag.fr (8.13.8/8.13.8) with ESMTP id s8I6Jeme020712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-arago@arago-project.org>; Thu, 18 Sep 2014 08:19:40 +0200
Received: from [192.168.0.13] (lns-bzn-61-82-250-83-61.adsl.proxad.net
	[82.250.83.61])
	by manolette.imag.fr (8.13.8/8.13.8) with ESMTP id s8I6JegZ010184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <meta-arago@arago-project.org>; Thu, 18 Sep 2014 08:19:41 +0200
Message-ID: <541A797C.304@imag.fr>
Date: Thu, 18 Sep 2014 08:19:40 +0200
From: Michele Portolan <michele.portolan@imag.fr>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130911 Thunderbird/17.0.9
MIME-Version: 1.0
To: meta-arago@arago-project.org
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.0.1
	(shiva.imag.fr [129.88.30.5]);
	Thu, 18 Sep 2014 08:19:40 +0200 (CEST)
X-IMAG-MailScanner-Information: Please contact MI2S MIM  for more information
X-MailScanner-ID: s8I6Jeme020712
X-IMAG-MailScanner: Found to be clean
X-IMAG-MailScanner-SpamCheck: 
X-IMAG-MailScanner-From: michele.portolan@imag.fr
MailScanner-NULL-Check: 1411625982.05954@Pa6+VPpe0SsatplVjXp7aw
Subject: Make boots partition
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Sep 2014 06:19:45 -0000
X-Groupsio-MsgNum: 4278
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms000501010000030604080203"

--------------ms000501010000030604080203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

is it possible to have arago create a boot.tar.gz with the contents of=20
the boot parition? As of now I have the files created in the "deploy"=20
repository, but the "create-sdcard.sh" script given by TI asks for a=20
compressed image....or can I just make a regular tar from the file?

Thanks,

Michele


--------------ms000501010000030604080203
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Signature cryptographique S/MIME

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIH8zCCA7Yw
ggKeoAMCAQICAQMwDQYJKoZIhvcNAQEFBQAwLDELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMx
DjAMBgNVBAMTBUNOUlMyMB4XDTA5MDEyMTA5MDM1MloXDTI5MDEyMDA5MDM1MlowNTELMAkGA1UE
BhMCRlIxDTALBgNVBAoTBENOUlMxFzAVBgNVBAMTDkNOUlMyLVN0YW5kYXJkMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnKlkarQHIxnDvggIxOIqXe3UKN7+P6DtkkRrFkc1EzeNdKn1
TYPkBRuPCGFM3ndb16n/u2Wdyaw8D/GJe5MioEcPXwa+jnigC3nXQmVhcmOSQIpbZxD61ic+2HdN
Hnnbb0sSAFJY4thCBbIzN3fgjWwdvPj28pRYJfeC2YbZXPPYLs39cIkEh+850SrYkoxpLxxSZfpg
jxB/zI/5XC4U7UyL4J03uNI8lMpQ/UF63vY87K7svVwW3bDwc5l6gf87M9IAnk2Mxls4LjPDdobK
clTbLeIQ/ZJQaJOE7XepiWlRhevglKP5lwgRjCTwD7o4tCzW12xOY/60MZ/vj6ZapQIDAQABo4HZ
MIHWMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFBHj2dFSRxtZsTwbeGZr9KGI7QpbMFQGA1Ud
IwRNMEuAFFCXtg33rDMXr/EdRjxrO/8AoOXloTCkLjAsMQswCQYDVQQGEwJGUjENMAsGA1UEChME
Q05SUzEOMAwGA1UEAxMFQ05SUzKCAQAwDgYDVR0PAQH/BAQDAgEGMD4GA1UdHwQ3MDUwM6AxoC+G
LWh0dHA6Ly9jcmxzLnNlcnZpY2VzLmNucnMuZnIvQ05SUzIvZ2V0ZGVyLmNybDANBgkqhkiG9w0B
AQUFAAOCAQEAT+njF+ZMJ/UXalBV6u7PTKq97izddj5ZoC8LaInaQ9AeHSxrEvlnE55lK6SE0jHP
gqDK7yLoEGzpzxd8rK2HhUyK4dV7TObZDrKh5CmeIK8PPnu5fyRMMuCI/nrarBZgoXWuiZyKZp2U
un6rDiAj7ffHhF2CSBTexNSwxU4sh9SNAxEvNtUpb66ZZxkMjW1aIN/Rn8bLr1XuC8qxWw/vXHT0
80aJY0d+LM6/yDANAEb2GOZsPzB+kG4QjR85Sc+TaevInsJnc69Ki/Z8Qijdpd3tr8lVG2Q/VLxh
JhDrkdXp9+7Q9gsL+qaQ3WD0QJ0Lp5z4zi8hOP6rBr/aDXf6ZzCCBDUwggMdoAMCAQICAm+kMA0G
CSqGSIb3DQEBBQUAMDUxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJTMRcwFQYDVQQDEw5DTlJT
Mi1TdGFuZGFyZDAeFw0xMzA5MTMwODUyMjBaFw0xNTA5MTMwODUyMjBaMHIxCzAJBgNVBAYTAkZS
MQ0wCwYDVQQKEwRDTlJTMRAwDgYDVQQLEwdVTVI1MTU5MRkwFwYDVQQDExBNaWNoZWxlIFBvcnRv
bGFuMScwJQYJKoZIhvcNAQkBFhhNaWNoZWxlLlBvcnRvbGFuQGltYWcuZnIwgZ8wDQYJKoZIhvcN
AQEBBQADgY0AMIGJAoGBAKdnGVX790MhE9jF/9by7PIE4ygndWYyHVoo33a8hAUwjsP6k8TfYMLi
IEtDJ2xLun7mketwyhTZDBLCAdO1H6eRrSaP+m60qkp6sxMR/sa3tMN26dT/GPq+nR+Mn9V4H09p
YcO80RkdKugR/Hdhn+N4D4/JkKC9XVheOO2y5Ip7AgMBAAGjggGUMIIBkDAMBgNVHRMBAf8EAjAA
MBEGCWCGSAGG+EIBAQQEAwIEsDAOBgNVHQ8BAf8EBAMCBeAwegYJYIZIAYb4QgENBG0Wa0NlcnRp
ZmljYXQgQ05SUzItU3RhbmRhcmQuIFBvdXIgdG91dGUgaW5mb3JtYXRpb24gc2UgcmVwb3J0ZXIg
4CBodHRwOi8vaWdjLnNlcnZpY2VzLmNucnMuZnIvQ05SUzItU3RhbmRhcmQvMB0GA1UdDgQWBBSP
FnrNlp+J0dXdWi3pjvl2oaunmjBUBgNVHSMETTBLgBQR49nRUkcbWbE8G3hma/ShiO0KW6EwpC4w
LDELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxDjAMBgNVBAMTBUNOUlMyggEDMCMGA1UdEQQc
MBqBGE1pY2hlbGUuUG9ydG9sYW5AaW1hZy5mcjBHBgNVHR8EQDA+MDygOqA4hjZodHRwOi8vY3Js
cy5zZXJ2aWNlcy5jbnJzLmZyL0NOUlMyLVN0YW5kYXJkL2dldGRlci5jcmwwDQYJKoZIhvcNAQEF
BQADggEBAFP+yKWkJpQDBE+6sGjH9CqMko6xSWlcW2n7Qm0YbpVbfGhfGOf0WsMrlsRMJVEknxEv
yeQrcGPCnvUl5BkCVcg0Y7XBPHpRGsfPbegBZnY6qZJ/zNLGyE6tLHJb/HLJrcex+E5l9G1jBFzf
7qif2R4AVH2bbBqU52RwIZxMjh+1TJxsBYJayRLzyeQg/FpnQpp4HtUoQkZuq7gm2sd4czwyWl91
jtYY3aGl0YAgwJOvmVNUvJkuTi2qaf2XOrbw8JD+y46/p00CVdgwMohjZ18KWBKi/U0F78uUnuI2
r+nniSwFad/EZQGOQujXUnN6b7yXyrDVCXT0Bl+3pejDo38xggJKMIICRgIBATA7MDUxCzAJBgNV
BAYTAkZSMQ0wCwYDVQQKEwRDTlJTMRcwFQYDVQQDEw5DTlJTMi1TdGFuZGFyZAICb6QwCQYFKw4D
AhoFAKCCAWUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTQwOTE4
MDYxOTQwWjAjBgkqhkiG9w0BCQQxFgQUyDdW0Ob9IPBw/mpvaYx9moqSMRQwSgYJKwYBBAGCNxAE
MT0wOzA1MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEXMBUGA1UEAxMOQ05SUzItU3RhbmRh
cmQCAm+kMEwGCyqGSIb3DQEJEAILMT2gOzA1MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEX
MBUGA1UEAxMOQ05SUzItU3RhbmRhcmQCAm+kMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEgYAqbS4B7oZ+fdfEWhA2lqrc
zuJqqPGYshmLNlS1mFG1mM5CpbUvTP9INLe0VhqcOXGGbl0XmTKupjcBzkdw5YwizzwRUfCCXl70
IIk+J/yM2bSn8qSoYZHF9ksVjjnJBDicaB/ykHRKOD/gy6TnGROayWvt7m4bmlXl91jK+kmkTQAA
AAAAAA==

--------------ms000501010000030604080203--
