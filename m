Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8AADD52AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:25:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILPcIb018914
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769938;
	bh=Gy9JS+nMJt2bxQVR4RMPqZT6Z0mggrh03OcmRhhV5MQ=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=hQ94kXrcPVSa2cgR60+P1E66MaKkgxwMc19NxkbSWXUg9t4KuS42ASB8Y59olS5Q3
	trtiOAuTeiSIDS2TAPJnkpOUyYrygD05DsVbJSCms2m8XEwBF7/Szb/L3sDIlqtMD/
	3Tee9orvrFwgX0AJruXrQ3GdzFAtqO4CMJxIt9bg=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILPc08002206
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:25:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 16:25:37 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] Updating to
	hyplnk version 2.1.0.7
Thread-Index: AQHTMMQlbYgXkyvwDkux2huf/oqTM6K7J6Bw
Date: Mon, 18 Sep 2017 21:25:37 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958254541B4@DFLE09.ent.ti.com>
References: <1505769696-12646-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1505769696-12646-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] Updating to hyplnk version 2.1.0.7
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
X-List-Received-Date: Mon, 18 Sep 2017 21:25:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK.

Please follow the commit message guidelines.=20

<recipe>: <brief description>



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Monday, September 18, 2017 5:22 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] Updating to
> hyplnk version 2.1.0.7
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc       | 6 ++++++
>  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend | 2 ++
>  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend      | 2 ++
>  3 files changed, 10 insertions(+)
>  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
>  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
>  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend
>=20
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc b/recipes-
> bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
> new file mode 100644
> index 0000000..6fc64dd
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
> @@ -0,0 +1,6 @@
> +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.07
> +HYPLNK_SRCREV =3D "7799dd3b1ef425494bf52534adebb915f6566885"
> +
> +PV =3D "2.1.0.7"
> +INC_PR =3D "r0"
> +
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend b/recipe=
s-
> bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
> new file mode 100644
> index 0000000..2f8a18f
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
> @@ -0,0 +1,2 @@
> +require hyplnk-lld-2.1.0.7.inc
> +
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend b/recipes-
> bsp/hyplnk-lld/hyplnk-lld_git.bbappend
> new file mode 100644
> index 0000000..2f8a18f
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend
> @@ -0,0 +1,2 @@
> +require hyplnk-lld-2.1.0.7.inc
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

