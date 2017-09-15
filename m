Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 507CE52AA4
	for <meta-arago@arago-project.org>;
	Fri, 15 Sep 2017 14:13:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8FEDgI3014232
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 09:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505484822;
	bh=syPT9t02hxLqEGcMFiWdUGayIRr8HZRQggqLHYTDc6w=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=mdGru+HJwS7uTfhbVNcumG8Qvpg8nj2USZCND9DJ1U7rX6wjRh2kg9sqd8sBsiHtp
	yzTHAu1QZWvRIKuqCcyYgkHm4xeKU36t2CSdzVD+7GAGICCRGnMRDvMVxzwHRVGmQ8
	VBpUPSGNiNSr+URqj70Cap/sU9RFlYn3r0/GIZt4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8FEDgqO014101
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 09:13:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 15 Sep 2017 09:13:42 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [EXTERNAL][meta-processor-sdk][PATCH]
	opencv: bump SRCREV to fix OpenCL context iniitialization
Thread-Index: AQHTLhWRMYTBFXWqjkyRns4pVtDeDKK1/WwQ
Date: Fri, 15 Sep 2017 14:13:41 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958254534DB@DFLE09.ent.ti.com>
References: <1505474786-20531-1-git-send-email-x0157990@ti.com>
In-Reply-To: <1505474786-20531-1-git-send-email-x0157990@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [EXTERNAL][meta-processor-sdk][PATCH] opencv: bump SRCREV to fix OpenCL context iniitialization
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
X-List-Received-Date: Fri, 15 Sep 2017 14:13:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you. This has been pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Senicic, Djordje
> Sent: Friday, September 15, 2017 7:26 AM
> To: meta-arago@arago-project.org
> Cc: Senicic, Djordje; Senicic, Djordje
> Subject: [EXTERNAL] [meta-arago] [EXTERNAL][meta-processor-sdk][PATCH]
> opencv: bump SRCREV to fix OpenCL context iniitialization
>=20
> * Initialize OpenCL context only if cmem module is inserted and ti-mctd i=
s
> running
>=20
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-support/opencv/opencv_3.1.bbappend | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 recipes-support/opencv/opencv_3.1.bbappend
>=20
> diff --git a/recipes-support/opencv/opencv_3.1.bbappend b/recipes-
> support/opencv/opencv_3.1.bbappend
> new file mode 100644
> index 0000000..a8aeef0
> --- /dev/null
> +++ b/recipes-support/opencv/opencv_3.1.bbappend
> @@ -0,0 +1,3 @@
> +PR_append =3D ".tisdk0"
> +
> +SRCREV_opencv =3D "4458601eb2766461f2f9da0d2527ff25ecb20284"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

