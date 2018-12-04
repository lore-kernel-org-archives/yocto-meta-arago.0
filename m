Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CD3F1529A6
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:06:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4L60ZA013490
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543957560;
	bh=L+9oT0dehqS16QI48pTo3RAvLq9dLzdqipn5m0yZGNM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=HUqKaMSaLj61fufXcoggdaKpxoe4Sa7VV525P3iDOzgn0ysGTswmUWqXslMUrxVYK
	yaS4w2yNgYfrVgzh3NAILmtJMBGHm44YA/cPFV4KAhgqH1BthI8Rm1mTCRTYy1zvzF
	+JO9fVtsbvp/CJ2ugCaZcCPdVuuCKViOK4rvnS08=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4L60DO051349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:06:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:06:00 -0600
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1591.008; Tue, 4 Dec 2018 15:06:00 -0600
From: "Zhao, Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] tidl-api: update to version 1.2.0
Thread-Index: AQHUjBLM/8CaYvePEkWkNqZg/ApXf6Vvdj0A//+biDA=
Date: Tue, 4 Dec 2018 21:06:00 +0000
Message-ID: <788e3928354f4642900db3d9c7a2f8a0@ti.com>
References: <20181204204833.27940-1-yuanzhao@ti.com>
	<20181204210410.GS6887@beryl>
In-Reply-To: <20181204210410.GS6887@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.54.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] tidl-api: update to version 1.2.0
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
X-List-Received-Date: Tue, 04 Dec 2018 21:06:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

License is the same.  We added a top level text license file which points t=
o components in html file.  The checksum is now based on the top level lice=
nse file.  - Yuan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, December 4, 2018 3:04 PM
To: Zhao, Yuan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v2] tidl-api: update to version 1.2.0

On Tue, Dec 04, 2018 at 02:48:33PM -0600, Yuan Zhao wrote:
> - Minimized TIDL API/OpenCL dispatch overhead using multiple execution
>   contexts on devices.  Added MNIST example for demonstration.
> - Execution graph generation with timestamps.
> - Python 3 bindings for TIDL API.
> - Add a top level license file.

Is the license the same, just moved to a separate file?


> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 ++
>  meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
>  3 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
> index fb37a249..1b1167ec 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,11 +1,11 @@
> -PV =3D "1.1.0.1"
> +PV =3D "1.2.0"

I see you changed it back to not have leading zeros. I'm fine either way.


>  INC_PR =3D "r0"
> =20
> -LIC_FILES_CHKSUM =3D "file://tidl_api_manifest.html;md5=3Dfb8d8b8edb866b=
0b233462139d1c3222"
> +LIC_FILES_CHKSUM =3D "file://license.txt;md5=3De3daeabffb9fc131a73f16d16=
cbdb118"
> =20
>  GIT_URI =3D "git://git.ti.com/tidl/tidl-api.git"
>  GIT_PROTOCOL =3D "git"
>  BRANCH =3D "master"
> =20
>  SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANCH}"
> -SRCREV =3D "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +SRCREV =3D "03978a83b03d8881261222344d1a08e0f4e2bd06"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 47e98ef9..fbea9aa8 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -11,6 +11,8 @@ PR =3D "${INC_PR}.0"
>  COMPATIBLE_MACHINE =3D "am57xx-evm|am57xx-hs-evm"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> +inherit python3native
> +
>  DEPENDS =3D "opencv \
>             opencl \
>             opencl-monitor \
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b=
/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index 94f215c3..2f5ca537 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -15,11 +15,13 @@ DEPENDS =3D "opencv \
>             clocl-native \
>             ti-cgt6x-native \
>             tidl-api \
> +           json-c \
>  "
> =20
>  RDEPENDS_${PN} +=3D "tidl-api \
>                     opencl-runtime \
>                     opencv \
> +                   json-c \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

