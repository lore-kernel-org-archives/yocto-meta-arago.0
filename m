Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 24C215296F
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:11:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFBHYS031379
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:11:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFBHml020879
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:11:17 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:11:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/11]
	ti-connectivity/hostap-daemon-wl18xx:	Add Wilink8 r8.a7.02
Thread-Index: AQHOxUuNovFwCcwU1UmJzxDbf/5O4JnuCvSA
Date: Thu, 10 Oct 2013 15:11:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C571A44@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-7-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366658-13630-7-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 06/11] ti-connectivity/hostap-daemon-wl18xx:	Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:11:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Monk, Roger
> Sent: Wednesday, October 09, 2013 7:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 06/11] ti-connectivity/hostap-daemon-wl18xx:
> Add Wilink8 r8.a7.02
>=20
>    * Add v r8.a7.02 engineering release hostap daemon
>    * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with=
 ES
> 2.1 WL8
>       * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 1=
8xx
> module
>       * OMAP5432x-xx-x1-xx
>    * Rebase config patch to match new release (which configures default S=
SID
> and channel)
>    * Bump PR
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
>  ...d-change-conf-file-for-better-oob-startup.patch |   43
> ++++++++++++++++++++
>  .../hostap/hostap-daemon-wl18xx_r8.a7.02.bb        |   25 ++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-
> startup.patch
>  create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon-wl18xx_r8.a7.02.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patc=
h
> b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-
> r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
> new file mode 100644
> index 0000000..a355d8b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx
> +++ -r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
> @@ -0,0 +1,43 @@
> +From 5aa31444740dff3d3f6f93c5f9361019873d0737 Mon Sep 17 00:00:00
> 2001
> +From: Roger Monk <r-monk@ti.com>
> +Date: Tue, 3 Sep 2013 12:26:48 +0100
> +Subject: [PATCH] hostapd: change conf file for better sdk out of box
> +startup
> +
> +Change the default channel to 6 and change the ssid to a more
> +meaningful name.
> +
> +Upstream-status: inappropriate [SDK specific patch]
> +
> +Copied from Eyal Reizer Patch from r8.a6.01, updated patch for latest
> +version for conf file.
> +
> +Signed-off-by: Roger Monk <r-monk@ti.com>
> +---
> + hostapd/hostapd.conf |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf index
> +9001d16..a871977 100644
> +--- a/hostapd/hostapd.conf
> ++++ b/hostapd/hostapd.conf
> +@@ -83,7 +83,7 @@ ctrl_interface_group=3D0  ##### IEEE 802.11 related
> +configuration #######################################
> +
> + # SSID to be used in IEEE 802.11 management frames -ssid=3Dtest
> ++ssid=3DTexasInstruments_0001
> + # Alternative formats for configuring SSID  # (double quoted string,
> +hexdump, printf-escaped string)  #ssid2=3D"test"
> +@@ -112,7 +112,7 @@ hw_mode=3Dg
> + # channel will need to be configured separately with iwconfig.
> + # When set to 0, automatic channel selection will be engaged. A
> +channel  # will be selected from the desired hw_mode.
> +-channel=3D1
> ++channel=3D6
> +
> + # Automatic channel selection (ACS) whitelist  # (default: not set)
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap=
-
> daemon-wl18xx_r8.a7.02.bb
> new file mode 100644
> index 0000000..734a798
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx
> +++ _r8.a7.02.bb
> @@ -0,0 +1,25 @@
> +# This is a TI specific version of the hostap-daemon recipe for use
> +with the # wl18xx wlan and bluetooth module.
> +
> +require hostap.inc
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> +
> +COMPATIBLE_MACHINE =3D "(omap-a15)"
> +
> +PR_append =3D "c+gitr${SRCPV}"
> +
> +FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon:"
> +
> +# Add TI to the end to make it clear that this is a TI customized
> +version # of hostap PV =3D "2.0-devel-ti"
> +
> +# Tag: ol_r8.a7.02
> +SRCREV =3D "4dda294a5186f3efb437ae0898a6df71655843ef"
> +
> +PROVIDES +=3D "hostap-daemon"
> +RPROVIDES_${PN} +=3D "hostap-daemon"
> +RREPLACES_${PN} +=3D "hostap-daemon"
> +RCONFLICTS_${PN} +=3D "hostap-daemon"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

