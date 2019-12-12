Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 08923529C0
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 21:35:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCLY2IU012419
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:34:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576186442;
	bh=9Z/J9IUmbRdnvcBlbSfewYStpMTXWBHr1HWxGFs0w1s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KSJwJMXgnpZyU+JxD+4be9phETzGIsiPgSkrsozPp5pelsC2Q3vJb8F1uVtCSm4Hk
	BRD4Bh69W6/rqLRLJKcJrm2KCaFWp3yPvPPTMbIx+GkDv9OtlrINIsQvJF3iCT0BVj
	jFYEctncOkYMimE/Wm+v5YA3ZGxs0JRqShUzXdXs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCLY2p9005144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:34:02 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 15:34:01 -0600
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1847.003; Thu, 12 Dec 2019 15:34:01 -0600
From: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [master/thud/ti2019.05][PATCH]
	tidl-api: fix package-qa issues
Thread-Index: AQHVsTNVeqVU/XFN206TJ0iYc6ahHae3BJVg
Date: Thu, 12 Dec 2019 21:34:01 +0000
Message-ID: <57d9265856a64f69ab7db030230ebfd3@ti.com>
References: <1576184573-9278-1-git-send-email-j-stiffler@ti.com>
	<20191212212957.GH32050@beryl>
In-Reply-To: <20191212212957.GH32050@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.48.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [master/thud/ti2019.05][PATCH] tidl-api: fix package-qa issues
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
X-List-Received-Date: Thu, 12 Dec 2019 21:35:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good question.  I overlooked this library versioning issue in the recipe wh=
en installing the .so file to /usr/lib.

Is there a quick way to use $PV for versioning?   E.g. currently PV is 1.4.=
0, so we should create libtidl_api.so.1.4.0, then libtidl_api.so.1, then li=
btidl_api.so.

Thanks!

- Yuan

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, December 12, 2019 3:30 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: [EXTERNAL] Re: [meta-arago] [master/thud/ti2019.05][PATCH] tidl-ap=
i: fix package-qa issues

On Thu, Dec 12, 2019 at 04:02:53PM -0500, Jacob Stiffler wrote:
> tidl-api does not create versioned libraries,

Should it be fixed then? What's the plan to address it?



> so provide these in the
> base package and skip the QA checks.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index a8829c1..ea12fb0 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -52,5 +52,9 @@ FILES_${PN} +=3D "\
>      ${TIDL_INSTALL_DIR} \
>  "
> =20
> +# Versioned libs are not created. See do_install().
> +SOLIBS =3D ".so*"
> +FILES_SOLIBSDEV =3D ""
> =20
> -INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev"
> +INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev libdir"
> +INSANE_SKIP_${PN}-dbg =3D "libdir"
> --=20
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

