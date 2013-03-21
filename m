Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C2559529A3
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 11:58:03 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LBw3tm017459
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:58:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LBw20f006767
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:58:03 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 21 Mar 2013 06:58:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Mar 2013 06:58:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 04/17] ti-compat-bluetooth: Add back old
	r5.00.18 compat-bluetooth release version
Thread-Index: AQHOJRLSDZ2TJaJvKUqO8pSlwgF5dJiwDCkw
Date: Thu, 21 Mar 2013 11:58:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948E986@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 04/17] ti-compat-bluetooth: Add back old	r5.00.18 compat-bluetooth release version
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
X-List-Received-Date: Thu, 21 Mar 2013 11:58:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:05 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 04/17] ti-compat-bluetooth: Add back
> old r5.00.18 compat-bluetooth release version
>=20
> * Current am180x-evm ships with a PG 2 wilink 6 module that isn't
> supported in
>   newer wilink 6 releases.
> * A newer PG 3 wilink 6 module is available for am180x-evm but
> needs to be
>   purchased separately..
> * Bring old r5.00.18 ti-compat-bluetooth recipe with updated
> recipe name to add
>   support for am180x-evm default wilink 6 module.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-compat-bluetooth_r5.00.18.bb                |    8
> ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_r5.00.18.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_r5.00.18.bb b/meta-arago-
> extras/recipes-bsp/ti-compat-bluetooth/ti-compat-
> bluetooth_r5.00.18.bb
> new file mode 100644
> index 0000000..eee79d0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-
> compat-bluetooth_r5.00.18.bb
> @@ -0,0 +1,8 @@
> +require ti-compat-bluetooth.inc
> +
> +PR_append =3D "-r0"
> +
> +SRC_URI +=3D
> "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-
> bluetooth-wl12xx-2012-05-22-r5-18.tgz"
> +
> +SRC_URI[md5sum] =3D "85118756a605ebd8f4fbff19995368a6"
> +SRC_URI[sha256sum] =3D
> "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393
> "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

