Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 763A5529BE
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2020 11:45:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BBgfq3099168;
	Mon, 11 May 2020 06:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589197361;
	bh=3ApQakZRV/jpb1BYkPP8YPIBKLuKatGpVjlBqUiqY/8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=IJnlYI+LyEGLcS7wThLd7GGgZ0tiRYRXSiVJtAzaCXiXGoEthPW5Fto4WdTS88UdR
	tePcnf+2+292QXHP0u4HAYQdOhEN8+5F7RSWi7xrL0tkhvbqeUDdBjExgR80NHiTLu
	SWa+sBRfUZm+qiJoBdLsqsh/Bwd1t1EDM4M649/c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBgfXI047013;
	Mon, 11 May 2020 06:42:41 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 11 May 2020 06:42:41 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1979.003; Mon, 11 May 2020 06:42:41 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [dunfell/master][PATCH] python3: skip
	shebang-size QA check for nativesdk-python3 packages
Thread-Index: AQHWJnTMtuDF41PHVkSPvYeVyQJAuKiixZ4w
Date: Mon, 11 May 2020 11:42:41 +0000
Message-ID: <fe9c46ce660d48ceb4e7a153c73faa31@ti.com>
References: <1589078601-28009-1-git-send-email-denis@denix.org>
In-Reply-To: <1589078601-28009-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [dunfell/master][PATCH] python3: skip shebang-size QA check for nativesdk-python3 packages
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
X-List-Received-Date: Mon, 11 May 2020 11:45:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Saturday, May 09, 2020 10:43 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [dunfell/master][PATCH] python3: skip
> shebang-size QA check for nativesdk-python3 packages
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-devtools/python/python3_%.bbappend | 12
> ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-
> devtools/python/python3_%.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-
> devtools/python/python3_%.bbappend b/meta-arago-distro/recipes-
> devtools/python/python3_%.bbappend
> new file mode 100644
> index 0000000..3e5bb4c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
> @@ -0,0 +1,12 @@
> +# In arago.conf, we pre-allocate SDK path very long to reserve enough
> space in ELF headers
> +# and then it gets replaced with a short real path at the time of SDK
> creation:
> +# SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
> +# SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
> +# Unfortunately, that triggers the new shebang-size QA check in nativesd=
k-
> python3 packages
> +
> +python() {
> +    if d.getVar('CLASSOVERRIDE') =3D=3D "class-nativesdk":
> +        pkgs =3D d.getVar("PACKAGES").split()
> +        for p in pkgs:
> +            d.appendVar('INSANE_SKIP_%s' % (p), ' shebang-size')
> +}
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

