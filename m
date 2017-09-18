Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C5345529B6
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 18:27:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IIRdq8012135
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 13:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505759259;
	bh=gNYXr8WDR5voFdzv4G7dxG2ti5eY68UV36ThnnDnviU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=IMCxojk91WTEAoVUBpr8dR+LbzpgOZl27e254+aDT5BzUmir4Vkp5ERwa5eQTEcKG
	Jkqp/9FLudcbndzLFJc3o/a8phlhZf7iCx9qbgDxcfo5Iop6P6K+wtzocuPfmSR5ms
	uXu4fZqkjHnV+5eOj8nx2P3pfRzchtQPGysM4y8Q=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IIRYuQ019352
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 13:27:34 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 13:27:34 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH]
	multiprocmgr: Update to new version 3.0.4.0
Thread-Index: AQHTMKdh1hX9j+az+EeBhyB0naurjKK69jfA
Date: Mon, 18 Sep 2017 18:27:33 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825453F20@DFLE09.ent.ti.com>
References: <1505757347-17137-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1505757347-17137-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] multiprocmgr: Update to new version 3.0.4.0
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
X-List-Received-Date: Mon, 18 Sep 2017 18:27:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Monday, September 18, 2017 1:56 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH]
> multiprocmgr: Update to new version 3.0.4.0
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> meta-ti already has this update
> Applying here as the processor SDK release needs this
> ---
> ---
>  recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend | 6 ++++++
> recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend | 6 ++++++
>  recipes-ti/multiprocmgr/multiprocmgr_git.bbappend      | 6 ++++++
>  3 files changed, 18 insertions(+)
>  create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-
> rtos_git.bbappend
>  create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-
> test_git.bbappend
>  create mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bbappend
>=20
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
> b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
> new file mode 100644
> index 0000000..ee9f453
> --- /dev/null
> +++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# The following commits correspond to DEV.MPM-3.00.04.00
> +MULTIPROCMGR_SRCREV =3D "21579a066b469ff4620e7cff12803ae152880bb5"
> +
> +PV =3D "3.0.4.0"
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
> b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
> new file mode 100644
> index 0000000..ee9f453
> --- /dev/null
> +++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# The following commits correspond to DEV.MPM-3.00.04.00
> +MULTIPROCMGR_SRCREV =3D "21579a066b469ff4620e7cff12803ae152880bb5"
> +
> +PV =3D "3.0.4.0"
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bbappend b/recipes-
> ti/multiprocmgr/multiprocmgr_git.bbappend
> new file mode 100644
> index 0000000..ee9f453
> --- /dev/null
> +++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# The following commits correspond to DEV.MPM-3.00.04.00
> +MULTIPROCMGR_SRCREV =3D "21579a066b469ff4620e7cff12803ae152880bb5"
> +
> +PV =3D "3.0.4.0"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

