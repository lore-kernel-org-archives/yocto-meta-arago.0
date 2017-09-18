Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 569B852AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:26:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILQYcN019828
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769994;
	bh=k3dztKk4gBrhllNsXYjoc+ZeMuGEp5tP+A9utnR9sL0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=BN+7YsyKOVRVJdhfbj74mVt6RmjS/8LH7glscY32q97oAk7p6NedFRQqbRvnRIWf/
	9UGn0sMIF6CrWaWH4jbD7/vtuARgkzVGSEDma5q15M+9JG2YOxtk8Y7JHcf81Ho3g3
	XqeXLEdnHbu1IvAMzQqIHEkwF9AdE46pFoj98bJw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILQYuj003418
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:26:34 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 16:26:33 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] Updating to
	osal version 1.0.0.8
Thread-Index: AQHTMMQ2+3I741zCoE6c3ar6+GdEXaK7J+lQ
Date: Mon, 18 Sep 2017 21:26:33 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958254541C7@DFLE09.ent.ti.com>
References: <1505769731-12695-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1505769731-12695-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] Updating to osal version 1.0.0.8
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
X-List-Received-Date: Mon, 18 Sep 2017 21:26:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK. Same comment as previous hyplnk patch.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Monday, September 18, 2017 5:22 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH] Updating to
> osal version 1.0.0.8
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/osal/osal-1.0.0.8.inc       | 6 ++++++
>  recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++  recipes-bsp/osal/osal-
> test_git.bbappend | 2 ++
>  recipes-bsp/osal/osal_git.bbappend      | 2 ++
>  4 files changed, 12 insertions(+)
>  create mode 100644 recipes-bsp/osal/osal-1.0.0.8.inc  create mode 100644
> recipes-bsp/osal/osal-rtos_git.bbappend
>  create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
>  create mode 100644 recipes-bsp/osal/osal_git.bbappend
>=20
> diff --git a/recipes-bsp/osal/osal-1.0.0.8.inc b/recipes-bsp/osal/osal-
> 1.0.0.8.inc
> new file mode 100644
> index 0000000..b43e43c
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-1.0.0.8.inc
> @@ -0,0 +1,6 @@
> +# Below commit ID corresponding to "DEV.OSAL.01.00.00.08"
> +OSAL_SRCREV =3D "ebd3acdbb4e7d6d0393efedd15ce479c5a79772d"
> +
> +PV =3D "01.00.00.08"
> +INC_PR =3D "r0"
> +
> diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-
> bsp/osal/osal-rtos_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-rtos_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +
> diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-
> bsp/osal/osal-test_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal-test_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +
> diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-
> bsp/osal/osal_git.bbappend
> new file mode 100644
> index 0000000..e164619
> --- /dev/null
> +++ b/recipes-bsp/osal/osal_git.bbappend
> @@ -0,0 +1,2 @@
> +require recipes-bsp/osal/osal-1.0.0.8.inc
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

