Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4989152A96
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 20:46:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MKkEUl012525
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 15:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506113174;
	bh=tXctrxxv7B+9g1HwINWyL4WKsd9DpTzZidVDA39aHHA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=B4ubR7uwJpWwOFAtCsJBi/5zii9G5DAeY5MhK+FRmnRP9JVUgstFVHEbDexf3449O
	81xTl/pj+jNzKH4vNT4PZu36Z7SwJuMul7JhrMQxw5WhE2R5rXVO4WWYgskOnl/zIv
	eyEswhbYQrsOem15Qdps3n12ahEMON7XRXMyZ3I0=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MKkENu028117
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 15:46:14 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 22 Sep 2017 15:46:13 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Pang, Ivan" <i-pang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] edma3-lld:
	updated to version 2.12.5.29
Thread-Index: AQHTM92Bq0lQ78ZKDE6ikB9P78+Z7aLBX8kA
Date: Fri, 22 Sep 2017 20:46:13 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D811AE@DLEE08.ent.ti.com>
References: <1506110447-30676-1-git-send-email-i-pang@ti.com>
In-Reply-To: <1506110447-30676-1-git-send-email-i-pang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] edma3-lld: updated to version 2.12.5.29
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
X-List-Received-Date: Fri, 22 Sep 2017 20:46:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Pang, Ivan
> Sent: Friday, September 22, 2017 4:01 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] edma3-lld:
> updated to version 2.12.5.29
>=20
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc        | 4 ----
>  recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc        | 4 ++++
>  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 2 +-
>  recipes-bsp/edma3-lld/edma3-lld_git.bbappend      | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)  delete mode 100644 rec=
ipes-
> bsp/edma3-lld/edma3-lld-2.12.4.inc
>  create mode 100644 recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc
>=20
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc b/recipes-
> bsp/edma3-lld/edma3-lld-2.12.4.inc
> deleted file mode 100644
> index 5a57119..0000000
> --- a/recipes-bsp/edma3-lld/edma3-lld-2.12.4.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_04_28A"
> -EDMA3_LLD_SRCREV =3D "8a8ed96465b6625cc3446a65fecebd9c510f4342"
> -
> -PV =3D "2.12.04.28"
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc b/recipes-
> bsp/edma3-lld/edma3-lld-2.12.5.inc
> new file mode 100644
> index 0000000..57a8c02
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld-2.12.5.inc
> @@ -0,0 +1,4 @@
> +# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_05_29"
> +EDMA3_LLD_SRCREV =3D "2e6011af7e4045c3c26c01f8ace7427a7a3dec10"
> +
> +PV =3D "2.12.05.29"
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-
> bsp/edma3-lld/edma3-lld-rtos_git.bbappend
> index 26b6f4c..1534652 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
> @@ -1 +1 @@
> -require edma3-lld-2.12.4.inc
> +require edma3-lld-2.12.5.inc
> diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend b/recipes-
> bsp/edma3-lld/edma3-lld_git.bbappend
> index 26b6f4c..1534652 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
> +++ b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
> @@ -1 +1 @@
> -require edma3-lld-2.12.4.inc
> +require edma3-lld-2.12.5.inc
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

