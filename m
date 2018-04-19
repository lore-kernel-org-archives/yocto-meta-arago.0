Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E2F5F5203A
	for <meta-arago@arago-project.org>;
	Thu, 19 Apr 2018 13:03:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3JD3MwB023195
	for <meta-arago@arago-project.org>; Thu, 19 Apr 2018 08:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524143002;
	bh=zLWKmsq0kMX2ME0+llTjhrSpcZoLsPwLw2aSS24PD08=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=fJU3Av2+fxBYxEGMtwOB7lAgjyDvOFelkGum7+LmXoPIAvX0nuimdPfKQZprL+gIH
	4B6bTYvof/64NyY/SqjNeMd5X/tkztnhKN/vephAQSUDvNCkTITEWlVWDvqqeaiKTX
	XrWkW9elPKPWX2aB/aFYcRzIPZrVipA2Cl9ck9HI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3JD3Lad002117
	for <meta-arago@arago-project.org>; Thu, 19 Apr 2018 08:03:22 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Apr 2018 08:03:21 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Thu, 19 Apr 2018 08:03:21 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [rocko/master][PATCH 2/2] clocl-rtos: fix installation to sysroot
Thread-Index: AQHT1ouzTSFP6PNkxkmFk8OeJweDaaQIEFbA
Date: Thu, 19 Apr 2018 13:03:21 +0000
Message-ID: <0a0f4ee5c6d64ee7aab365df44a20f9c@ti.com>
References: <1523996734-5478-1-git-send-email-j-stiffler@ti.com>
	<1523996734-5478-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1523996734-5478-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [rocko/master][PATCH 2/2] clocl-rtos: fix installation to sysroot
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
X-List-Received-Date: Thu, 19 Apr 2018 13:03:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You may want to hold off on these. There are similar problems in the other =
opencl-rtos recipes.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, April 17, 2018 4:26 PM
> To: meta-arago@arago-project.org
> Cc: Zhao, Yuan; Stiffler, Jacob
> Subject: [rocko/master][PATCH 2/2] clocl-rtos: fix installation to sysroo=
t
>=20
> * Move all installation to do_install and install relative to ${D}.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/me=
ta-
> arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
> index 3725567..fad8d77 100644
> --- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
> @@ -17,7 +17,7 @@ TARGET_class-target =3D "am57xx"
>  TARGET_class-native =3D "x86"
>=20
>  export WANT_LLVM_RELEASE =3D "3.6-ti"
> -export DESTDIR=3D"${OCL_RTOS_INSTALL_DIR}"
> +export DESTDIR=3D"${D}${OCL_RTOS_INSTALL_DIR_RECIPE}"
>  export LDFLAGS=3D"${BUILD_LDFLAGS}"
>  export CXXFLAGS=3D"${BUILD_CFLAGS}"
>=20
> --
> 2.7.4


