Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2F0A7520EA
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 21:44:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PLhWGn043180
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 16:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561499012;
	bh=9mXVSUP9c96Ja6VGAItunHs8M4a5cXW++pfcNYxXIiM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=gPRhVhKg31vRM0fKZVbCSmhDs60RUkFO6vFDgoDQyiCpUzuWF9VLcdI3xLrfsm73y
	RUog7souph9aGVXNCjCI/LUVlWcFxYbfBCqBLq25m/xdgt2ZOy/+b6UbfwO/iBN39p
	fehMMK9PhqUt76LajrosJuHg7Ba+WBtRQ5DUjBVE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PLhWQe077903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 16:43:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 25 Jun 2019 16:43:32 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1713.004; Tue, 25 Jun 2019 16:43:32 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/master][PATCH 1/2] arm-compute-library:
	Upgrade to 19.05 version
Thread-Index: AQHVK5PPX+wE2LZNkEasaBDWv2OW1aas5rGg
Date: Tue, 25 Jun 2019 21:43:32 +0000
Message-ID: <debb9dbef8dc495e8ee29a5af452906d@ti.com>
References: <20190624194634.9959-1-x0157990@ti.com>
	<20190625202311.GK4849@beryl>
In-Reply-To: <20190625202311.GK4849@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.96.62]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH 1/2] arm-compute-library: Upgrade to 19.05 version
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
X-List-Received-Date: Tue, 25 Jun 2019 21:44:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,
This is the only change:

3c3
< Copyright (c) 2017-2019 ARM Software
---
> Copyright (c) 2017-2018 ARM Software



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, June 25, 2019 4:23 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/master][PATCH 1/2] arm-compute-library: Upg=
rade to 19.05 version

On Mon, Jun 24, 2019 at 03:46:33PM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../arm-compute-library/arm-compute-library_git.bb       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-co=
mpute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-librar=
y/arm-compute-library_git.bb
> index a2e19fd4..a33a2bc1 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
>  DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library is=
 a set of functions optimised for both ARM CPUs and GPUs."
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D762a7ba8d2ddc3b38d88742fbaf0b=
62d"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8948bc85114b3b716576ef8d732f0=
34f"


License checksum change needs to be explained in the commit log.


>  COMPATIBLE_MACHINE =3D "armv7a|aarch64"
> =20
> @@ -20,11 +20,12 @@ SRC_URI =3D " \
>      file://0011-add-ti-benchmark-test-group.patch \
>  "
>  PR =3D "r0"
> -PV  =3D "19.02"
> +PV  =3D "19.05"
>  PV_MAJOR =3D "${@d.getVar('PV',d,1).split('.')[0]}"
> =20
> -BRANCH =3D "master"
> -SRCREV =3D "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
> +BRANCH =3D "branches/arm_compute_19_05"
> +SRCREV =3D "bd17a169153ee181100f3b31984968b66618ef3c"
> +
> =20

Extra newline being added.

>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

