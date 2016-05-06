Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8CEA05299F
	for <meta-arago@arago-project.org>;
	Fri,  6 May 2016 14:41:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u46EfuPM017424
	for <meta-arago@arago-project.org>; Fri, 6 May 2016 09:41:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u46EfuEw029419
	for <meta-arago@arago-project.org>; Fri, 6 May 2016 09:41:56 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 6 May 2016 09:41:55 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH] arago-krogoth-config:
	choose	krogoth branch for meta-qt5
Thread-Index: AQHRp5FKgZIzeFtwdk+9csogE8xzI5+r+yWw
Date: Fri, 6 May 2016 14:41:55 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426DD34@DFLE09.ent.ti.com>
References: <1462556811-11845-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1462556811-11845-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH] arago-krogoth-config: choose	krogoth branch for meta-qt5
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
X-List-Received-Date: Fri, 06 May 2016 14:41:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With the latest on meta-qt5 master, I am seeing failures due to the removal=
 of qtbase-fonts, so at this time, this appears to be a solution.

- Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Friday, May 06, 2016 1:47 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [oe-layersetup][PATCH] arago-krogoth-config: choose
> krogoth branch for meta-qt5
>=20
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  configs/arago-krogoth-config.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-
> config.txt
> index 76f8caa..031ffa2 100644
> --- a/configs/arago-krogoth-config.txt
> +++ b/configs/arago-krogoth-config.txt
> @@ -3,7 +3,7 @@
>=20
>  bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=3D
>  meta-arago,git://arago-project.org/git/meta-
> arago.git,master,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=3D
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=3D
>  meta-openembedded,git://git.openembedded.org/meta-
> openembedded,master,HEAD,layers=3Dmeta-networking:meta-ruby:meta-
> python:meta-oe
>  meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,master,HEAD,layers=3Dmeta-linaro-toolchain
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

