Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0434752A77
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 22:12:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75MCi5C010707
	for <meta-arago@arago-project.org>; Tue, 5 Aug 2014 17:12:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75MCi8G017677
	for <meta-arago@arago-project.org>; Tue, 5 Aug 2014 17:12:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 17:12:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2 v2] wpa-supplicant-wl18xx:
	configuration	files update
Thread-Index: AQHPsOcHbeT5kMhQq0ax1rl76WctdpvCkuow
Date: Tue, 5 Aug 2014 22:12:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F4897@DFLE08.ent.ti.com>
References: <1407268142-6229-1-git-send-email-yanivma@ti.com>
	<1407268142-6229-2-git-send-email-yanivma@ti.com>
In-Reply-To: <1407268142-6229-2-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2 v2] wpa-supplicant-wl18xx: configuration	files update
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
X-List-Received-Date: Tue, 05 Aug 2014 22:12:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Tuesday, August 05, 2014 2:49 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2 v2] wpa-supplicant-wl18xx: configuration
> files update
>=20
> - clean non releveant configuration flags.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
> v2 - Bumped PR
>=20
>  .../wpa-supplicant/wpa-supplicant.inc              |    2 +-
>  .../wpa-supplicant/p2p_supplicant.conf             |    3 +--
>  .../wpa-supplicant/wpa_supplicant.conf             |    3 ++-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wp=
a-
> supplicant.inc
> index c8611ea..e4be180 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt.inc
> @@ -14,7 +14,7 @@ RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase
> wpa-supplicant-cli"
>  # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
>  DEFAULT_PREFERENCE =3D "-1"
>=20
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  SRC_URI =3D "git://git.ti.com/wilink8-
> wlan/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> index 2de8730..3bdc306 100755
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/p2p_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt/p2p_supplicant.conf
> @@ -3,12 +3,11 @@ update_config=3D0
>  device_name=3DTI-SITARA-P2P
>  device_type=3D1-0050F204-1
>  config_methods=3Dvirtual_push_button physical_display keypad
> -p2p_go_intent=3D0
> +#p2p_go_intent=3D0
>  country=3DUS
>  ##p2p_pref_chan=3D115:36 115:40
>  driver_param=3Duse_multi_chan_concurrent=3D1 use_p2p_group_interface=3D1
>  p2p_go_max_inactivity=3D60
>  p2p_go_ht40=3D1
> -p2p_multi_chan=3D1
>  disassoc_low_ack=3D1
>  concurrent_sched_scan=3D1
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> index f144a38..4233eb2 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/wpa_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt/wpa_supplicant.conf
> @@ -59,6 +59,7 @@ driver_param=3Duse_multi_chan_concurrent=3D1
> use_p2p_group_interface=3D1  # inactive stations.
>  p2p_go_max_inactivity=3D60
>  p2p_go_ht40=3D1
> -p2p_multi_chan=3D1
>  disassoc_low_ack=3D1
>  concurrent_sched_scan=3D1
> +p2p_disabled=3D1
> +
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

