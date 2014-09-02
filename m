Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 90FDA52A80
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 21:46:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82Lke6Y022385
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 16:46:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82Lkev6012759
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 16:46:40 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 2 Sep 2014 16:46:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 00/12] Enabling WL8 R8.4 on dora
Thread-Index: AQHPxpxdQmXYS5jboEinVzpBXqpCnJvuYCKw
Date: Tue, 2 Sep 2014 21:46:40 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7262FB@DFLE08.ent.ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] Enabling WL8 R8.4 on dora
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
X-List-Received-Date: Tue, 02 Sep 2014 21:46:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If you can resend using --find-copies-harder it will make it a lot easier t=
o review. You might also need to play with the -M option to make sure your =
only sending as little deltas as possible.

Also it would be nice in each of the patches if you add [for dora] to the p=
atch subject. I know you indicated that in the cover letter but it just mak=
es things easier and a good habit in case you don't always send cover lette=
rs.

I always use git send-email --annotate and manually add things like that to=
 each patch before I send it. A bit of a hassle for the sender but makes th=
e reviewer's life easier :)

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Tuesday, September 02, 2014 5:55 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 00/12] Enabling WL8 R8.4 on dora
>=20
> This patch set contains the set of patches that are required to get the l=
atest
> Wilink firmware on the dora branch.
> Most of the patches here are cherry picked from the master branch. A few =
of
> them needed minor rework.
>=20
> Note that this has been tested on the GLSDK 6.10 release line for dra7xx-=
evm
> as the target.
>=20
> Denys Dmytriyenko (4):
>   wl18xx-firmware: specify the branch being used for this version
>   hostap-daemon: specify the branch being used for this version
>   wpa-supplicant: specify the branch being used for this version
>   recipes-connectivity: remove remaining unnecessary exec permissions
>=20
> Yaniv Machani (8):
>   wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
>   hostap-daemon-wl18xx: Update recipe to ol_r8.a9.14 version
>   wl18xx : update to ol_r8.a9.14
>   Wl18xx : recipes update - tag changed to ol_r8.a9.14
>   wl18xx-target-scripts : Add new WiFi related scripts
>   wl18xx-compat: version update
>   wl18xx-wlconf: version update
>   wpa-supplicant-wl18xx: configuration files update
>=20
>  ...synchronization-between-bluetoothd-and-dr.patch |   0
>  .../0001-obexd-make-OPP-push-timeout-longer.patch  |   0
>  .../packagegroup-arago-tisdk-connectivity.bb       |   4 +-
>  .../ti-compat-wireless-wl18xx_r8.a8.10.bb          |  61 ---
>  .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |  51 ++
>  .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    |  30 --
>  .../wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb    |  31 ++
>  .../hostap/hostap-daemon-wl18xx_r8.a8.10.bb        |  23 -
>  .../hostap/hostap-daemon-wl18xx_r8.a9.14.bb        |  24 +
>  .../hostap/hostap-daemon/defconfig                 |   2 +-
>  .../recipes-connectivity/hostap/hostap.inc         |   7 +-
>  .../wl18xx-target-scripts_r8.a9.14.bb              |  25 +
>  .../recipes-connectivity/wlconf/wlconf_r8.a8.10.bb |  41 --  .../recipes=
-
> connectivity/wlconf/wlconf_r8.a9.14.bb |  42 ++  .../wpa-supplicant/wpa-
> supplicant-wl18xx/defconfig | 506 -------------------
>  .../wpa-supplicant-wl18xx_r8.a8.10.bb              |  24 -
>  .../wpa-supplicant-wl18xx_r8.a9.14.bb              |  25 +
>  .../wpa-supplicant/wpa-supplicant.inc              |  91 ++--
>  .../wpa-supplicant/wpa-supplicant/defaults-sane    |   8 -
>  .../wpa-supplicant/wpa-supplicant/defconfig        | 543
> +++++++++++++++++++++
>  .../fi.epitest.hostap.WPASupplicant.service        |   4 -
>  .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |   4 -
>  .../wpa-supplicant/p2p_supplicant.conf             |   3 +-
>  .../wpa-supplicant/wpa_supplicant.conf             |   3 +-
>  .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb |  31 --  .../ti-wifi=
-utils/ti-wifi-
> utils-wl18xx_r8.a9.14.bb |  31 ++
>  26 files changed, 814 insertions(+), 800 deletions(-)  mode change 10075=
5 =3D>
> 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-
> synchronization-between-bluetoothd-and-dr.patch
>  mode change 100755 =3D> 100644 meta-arago-distro/recipes-
> connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-
> longer.patch
>  mode change 100644 =3D> 100755 meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>  delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx_r8.a9.14.bb
>  delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a9.14.bb
>  delete mode 100644 meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
>  create mode 100644 meta-arago-extras/recipes-connectivity/wl18xx-
> target-scripts/wl18xx-target-scripts_r8.a9.14.bb
>  delete mode 100644 meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a9.14.bb
>  delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx/defconfig
>  delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
>  delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/defaults-sane
>  create mode 100755 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/defconfig
>  delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
>  delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
>  delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils-wl18xx_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils-wl18xx_r8.a9.14.bb
>=20
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

