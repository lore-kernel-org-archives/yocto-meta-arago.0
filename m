Return-Path: <hzhang@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8914052A48
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 19:26:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OJQhdi032283
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:26:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OJQhRe005294
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:26:43 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 24 Apr 2013 14:26:43 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
	and	.out support in Matrix PHP
Thread-Index: AQHOQSA84jUPMMtokUe6fEwZu44OVJjlwMMg
Date: Wed, 24 Apr 2013 19:26:43 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-lighttpd-config: add static cgi and	.out support in Matrix PHP
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
X-List-Received-Date: Wed, 24 Apr 2013 19:26:44 -0000
X-Groupsio-MsgNum: 1285
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41DLEE09entticom_"

--_002_ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

See attached the example.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, April 24, 2013 3:17 PM
To: Zhang, Hao; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi an=
d .out support in Matrix PHP

cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi" =
=3D> "/bin/sh",  ".o" =3D> "" )

Can you give an example of the .cgi and .o file that requires this change?


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Zhang, Hao
> Sent: Wednesday, April 24, 2013 1:29 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi=20
> and .out support in Matrix PHP
>=20
> From: Hao Zhang <hzhang@ti.com>
>=20
> ---
>  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix b/meta-arago-extras/recipes-=20
> core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> index 82a9fb8..2dce736 100755
> --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> config/lighttpd.conf.matrix
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lig
> +++ ht
> +++ tpd.conf.matrix
> @@ -137,7 +137,7 @@ $HTTP["url"] =3D~ "\.pdf$" {  # which extensions=20
> should not be handle via static-file transfer  #  # .php, .pl, .fcgi=20
> are most often handled by mod_fastcgi or mod_cgi=20
> -static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi" )
> +static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi", ".cgi", ".o=
"
> +)
>=20
>  ######### Options that are good to be but not neccesary to be changed=20
> #######
>=20
> @@ -225,7 +225,7 @@ compress.filetype          =3D ("text/plain",
> "text/html","text/javascript","text/
>  #                            )
>=20
>  #### CGI module
> -cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi")
> +cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi"=
 =3D>	"/bin/sh",
> ".o" =3D> "" )
>  #cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
>  #                               ".cgi" =3D> "/usr/bin/perl" )
>  #
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_002_ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41DLEE09entticom_
Content-Type: application/x-gzip; name="utility_apps.tar.gz"
Content-Description: utility_apps.tar.gz
Content-Disposition: attachment; filename="utility_apps.tar.gz"; size=2267;
	creation-date="Wed, 24 Apr 2013 19:26:19 GMT";
	modification-date="Wed, 24 Apr 2013 19:24:06 GMT"
Content-Transfer-Encoding: base64

H4sIAFYxeFEAA+1Ze3PayhX3v9FMvsMpSUsyAxYPG6cJMINB2JryqiTieDqdXCEtsDd6VSuMmbbf
vWdXAmSbXCcdx+ljf5MJ0u55n7N7tGtyG4VxwlS78q7x7uSPDTUOw2TOyrYXLe1qRV2xWGVLOyaq
bycxvS0vVrRcO66odhQxdZVQjyaUsM9sNfNJsFKPDqCCODs9Fb+I+7/iuVqr1k/PGo1GtX5UqTUq
SA6nh4Q9NVYssWOAI+73b9E9Nv9fCvLE+d+NHLuEfUnC6CjNf+Pk5Kv5r52d3M1/vXrSaBxB5TkC
8H+e/1e/Eyme0UAlwQ3cuotyGJFA+UsvTR9oQRJv/qqMbJ+0ptvkKhckIDF17o3qThi0HikZ6tsL
kqucMkWm4yhYKNYmIq0ejYmThPFG+VQedixD/1Tu2glZ4IhlxwuStHacys+O3f8CnmL9bz7TYB4e
3PoFvn//P63UanL/fw48Yf7zL7nd//H9v1Gt3t//q/Wq3P+fA9+1/5sblhAfdEwwVgMNA7jTCHrE
D6ETRR51xOxT9IO8OO2WOI+J+3pFsqWSdRLUkusikzhcxLYvtKFqFnpk33swCk5MI67+uzRj+Tuf
76hfJr6Xk0tZ5NmbSUzRnGTTqv6sZvaj1j9b7nU8sv/X65Wze+u/Uq3U5Pp/DuD652sfF8crGIbu
yiPvYf9V79s0UF7hVG4dvAdrSRmk74BPK0ZcSEKIVwEkS7JnB3u/eMHFzQEF4b9uGG1iulgm8Kb7
FmqVah0scmsz3FdYEq/wGJHwZyeMsTRxxbpQhmWSRO9Vdb1eHyf02Al9VZgFBnEpMtHZSiixA5eb
AzQAFq5ih4gRdNCONzAPY5+VYE2TJYSx+A1XXIgfunSe2VkCrHWISOzThKuO4vCGutzBpZ0I9+ah
54VrGiwAdwuXcibGpXA+nyTvDxnGIJxvLXJCFwmx7CAmCcZXCLVn4Q2fyiLDJQRhQh1SwmmMsYfC
uIy9SuHZXXtQo+PZ1CfxMRdwyAxUl4vG1gx00l2haT/AEkgd5GLc0BHJtbepUjELIU7GgHsLdhHb
Y/t4izRtOXM+HKfxHREqOLneAJsPN+mRKgrCPTlPCBdDkQg9SaWHMUNLNjAju5omgYujhNcLWuaH
CYE0WMjnosk3xOVi5jiXhoeF82TNSyEtrwRYRBxeXchHedXFvK6CtMIY2ztkXeommOO+ddUxNMDn
iTH+qPe0Hpxf46QG3fHk2tAvLi24HA96mmFCZ9TD0RE2lPOpNTZMLqbQMZG5IOY6o2vQPk0MzTRh
bIA+nAx0lIcKjM7I0jWzBPqoO5j29NFFCVAGjMYWFzLQh7qFlNa4JFQ/5IRxH4aa0b3E1865PtCt
a6Gyr1sjrq4/NrigDkw6hqV3p4OOAZOpMRmbGnD/errZHXT0odY7RhtQL2gftZEF5mVnMLjrLpcz
vhppBvch7y6ca2hp53ygcXXC255uaF2Lu7V/6mIQ0chBiQsyJ1pXx2eMi4ZOdYzrUibW1P48RTqc
hF5n2LlAH988Hh1MUndqaENuO4bEnJ6blm5NLQ0uxuOeCLupGR/1rmZ+gMHYFIGbmpowptexOkI9
SsHAIQU+n09NXYRQH1maYUwnlj4evcWcX2GE0NIOcvdErMcj7nNaO9rYuOaieTxENkpwdanhuMHD
K6LW4eEwMXpdK0+GKjGYwrG9vzDSLgb6hTbqapxgzAVd6ab2FpOnm5xAF8qxIlDtVPjOk4a2iXT1
75ZzSWQX9D50eh91bn9Gj/Vg6ln5iPB1L7Po81WhbPfwB58azoKWedsSnxr4Iq8C/l084fff4W/e
o8fPf9XG6YP7v5q8/3sWNJfVNqQ3eJs732ssPesx3q4Z9n8mvuCgqSLDS+Wl0oza6YegGF5TzwO2
DNcpg7Nl52UQp2fF46YaCc6XcrX+5+AJ1/92U36g41vv/xqVWgU3Af73n3r1TN7/PQd+QP63TXmn
47Hzf6Nau5f/s7OTutz/nwP7879CnGWIh/MAjydJOdlE5D0k5DZRxc2VmMz+xw4BzSZo46HSXBLb
bStNPPja4pBeJn9b0ZtWwcnJKUD21irsBH4AB6uKib/nzMvvCqCilIQmHmn/iWDvCAMCur7rTLlr
QHhwC9lUU0YFm1Nqzix0N/jj0hugbqu4jrFaSVzMDXnhIiy2effT9y1KNLemijQ5Si7yLi//Qyd/
Twn345G9IHm6zGs+tIy5e/bMw6M18bzIdl08J7eKDT6ZiEkXbmyPLgLkQyausSnuRoHFTqt4+K7U
aTRu+V0p0qqJm0pZUzdZtorVSuX3Rcgk/opVTucbYUntnse1dnPGDYgAj+yMtYq5ux6UO2vn736a
6ixr+9xZfjDn15hMnKu/3vmBt34lM1EV7qoiGNvIZCHndvCqerEtMTz9VEU8OWG9nWV+GoFFfYK2
19svlCYecNuKoBRsKh7QHXWF9vpEyQmqKYzwSwuG6gRLqlUoFdNb2u5kqo/64yrkNOOYKDihM1O5
pcurdaIVd/y+rBocULqd2xGbVw/0DmiwuoUbErM0WTvlGa2irMTtR5nF/j05B3VmU4piDSd9faC1
fvG/YEijXxQ/XAUJ/APs9Rcowt+jmOJrwSU3FE9ghRK8rpYKIIiIC7gKC6XX9RIUwGZi9hSf59Qj
afYL/yxCG15nSnaGDcdTPGELH/NODoXq++HdE6f8O2mx/xuSD3q9n90x6H08FPf1i7uWjEiyDuMv
aAsuwLntEJa3aMejKHSOpTSniwfyDurfTe7IDTw0aw8jYYS4toMFiMWRV72nV5QYichDSQc172eV
XKx6h3LA734PJKGXafWYH7r3ZXwl2r27sdbG/Wyd852RJRuP4CbnETt+D7MwWX4otv8QzFj0YbsP
3N2BC3NsvSQutJUXuEnxAY8sbK/QfgMOfNMFcir95/6fbYGZg1mDEq2Q73l9RR6KJCQkJCQkJCQk
JCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCS+Af8CawErgQBQAAA=

--_002_ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41DLEE09entticom_--
