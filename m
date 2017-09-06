Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id DFC7D529D3
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 19:55:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86JtpPi011432
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504727751;
	bh=eazEtmigUQ/n2tTYDglE2bLYLVwKoXac3KpIQRSTLXY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=J26w0We8tpkKSpUHmxRkYANgymZp7skmraJA4S5k6yVKCfrzE3ActzXXw/F/PPoCk
	4NE4XgmxuNM5voGbd56trEf26RUPD7rEFA+nRDcDYqQmGrAgebVqPdnQNr662Qsb7N
	OIw1VNo78uJ6bxMBIDLXoLmwlxhgm0qFp5kQhyNA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86JtpPA020083
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:55:51 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Wed, 6 Sep 2017 14:55:51 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH]
	uio-test-pruss: upstreamed to meta-ti
Thread-Index: AQHTJ0mjtaTDqzuFFEi7o2wqhCm/JqKoRa/w
Date: Wed, 6 Sep 2017 19:55:51 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9582543A337@DFLE09.ent.ti.com>
References: <1504727515-29423-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1504727515-29423-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] uio-test-pruss: upstreamed to meta-ti
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
X-List-Received-Date: Wed, 06 Sep 2017 19:55:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Wednesday, September 06, 2017 3:52 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] uio-test-
> pruss: upstreamed to meta-ti
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 17 -------------=
----
>  1 file changed, 17 deletions(-)
>  delete mode 100644 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
>=20
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/reci=
pes-
> ti/uio-test-pruss/uio-test-pruss_git.bbappend
> deleted file mode 100644
> index 1a680a8..0000000
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -PR_append =3D ".tisdk0"
> -
> -PV =3D "1.0.1.0"
> -
> -COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
> -
> -DEVICE_NAME_append_ti33x =3D "am33xx"
> -DEVICE_NAME_append_ti43x =3D "am43xx"
> -
> -UIO_TEST_PRUSS_GIT_URI =3D "git://git.ti.com/processor-sdk/uio-test-
> pruss.git"
> -UIO_TEST_PRUSS_GIT_PROTOCOL =3D "git"
> -SRC_URI =3D
> "${UIO_TEST_PRUSS_GIT_URI};protocol=3D${UIO_TEST_PRUSS_GIT_PROTOCOL}
> ;branch=3D${BRANCH}"
> -
> -# Corresponds to version 01.00.01.00
> -UIO_TEST_PRUSS_SRCREV =3D
> "72f7454c2460bd7d52dab70631b38bf5d3585542"
> -
> -SRCREV =3D "${UIO_TEST_PRUSS_SRCREV}"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

