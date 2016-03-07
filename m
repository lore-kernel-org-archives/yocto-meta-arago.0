Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 97C4A529CF
	for <meta-arago@arago-project.org>;
	Mon,  7 Mar 2016 22:40:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27Mei0X020652;
	Mon, 7 Mar 2016 16:40:44 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27MeiB9031448;
	Mon, 7 Mar 2016 16:40:44 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 7 Mar 2016 16:40:44 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only add
	multimedia when alsa is enabled
Thread-Index: AQHReLb5iF+Loi5mdE6CYAzqrxE3z59Okaww
Date: Mon, 7 Mar 2016 22:40:43 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B90A8B@DLEE08.ent.ti.com>
References: <1457385534-2153-1-git-send-email-denis@denix.org>
In-Reply-To: <1457385534-2153-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk-server-extra-rootfs-image: only add multimedia when alsa is enabled
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
X-List-Received-Date: Mon, 07 Mar 2016 22:40:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Multimedia/gstreamer packagegroup is needed for all K2 platforms due to the=
 reasons below:

1. OpenCV is intended for all K2 platforms, which has dependency on gstream=
er
2. The dsp66 GST plugin (a new feature in the coming Processor SDK 2.0.2 re=
lease) is intended for all K2 platforms, which needs gstreamer also

Thanks,
Hongmei

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 07, 2016 4:19 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only add
> multimedia when alsa is enabled
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/images/tisdk-server-extra-rootfs-image.bb              =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-roo=
tfs-
> image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-
> rootfs-image.bb
> index 432f421..51237cb 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-
> image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-
> image.bb
> @@ -3,7 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-image.bb
>  IMAGE_INSTALL +=3D "\
>      packagegroup-arago-test-addons \
>      packagegroup-arago-tisdk-addons-extra \
> -    packagegroup-arago-tisdk-multimedia \
> +    ${@base_contains('MACHINE_FEATURES', 'alsa', 'packagegroup-arago-
> tisdk-multimedia', '',d)} \
>  "
>=20
>  export IMAGE_BASENAME =3D "tisdk-server-extra-rootfs-image"
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

