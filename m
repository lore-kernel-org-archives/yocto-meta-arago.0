Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 97E3E52972
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 19:48:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77Jm8hT007827
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:48:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77Jm7iF010582
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:48:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 7 Aug 2014 14:48:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Machani, Yaniv" <yanivma@ti.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] wl18xx-compat: version update
Thread-Index: AQHPsl2RKPwN24LD70WPO8XszbBFMZvF2DeA//+0CRA=
Date: Thu, 7 Aug 2014 19:48:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F6D73@DFLE08.ent.ti.com>
References: <1407428995-23585-1-git-send-email-yanivma@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D1B0468@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D1B0468@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wl18xx-compat: version update
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
X-List-Received-Date: Thu, 07 Aug 2014 19:48:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, August 07, 2014 2:20 PM
> To: Machani, Yaniv; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] wl18xx-compat: version update
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Machani, Yaniv
> >Sent: Thursday, August 07, 2014 11:30 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 1/2] wl18xx-compat: version update
> >
> >- Update to latest version tag - ol_r8.a9.14
> >- move to git.ti.com and use backports module.
> >- clean some unused commands.
> >
> >Signed-off-by: Yaniv Machani <yanivma@ti.com>
> >---
> > .../packagegroup-arago-tisdk-connectivity.bb       |    3 +-
> > .../ti-compat-wireless-wl18xx_r8.a8.10.bb          |   61 -------
> >-------------
> > .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |   51
> >++++++++++++++++
> > 3 files changed, 53 insertions(+), 62 deletions(-)  delete mode 100644
> >meta-arago-extras/recipes-bsp/ti-compat-
> >wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> >wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> >
> >diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >tisdk-connectivity.bb
> >index fa82e7e..7dadca2 100755
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-connectivity.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-connectivity.bb
> >@@ -1,6 +1,6 @@
> > DESCRIPTION =3D "Task to install wireless packages into the target FS"
> > LICENSE =3D "MIT"
> >-PR =3D "r25"
> >+PR =3D "r26"
> >
> > inherit packagegroup
> >
> >@@ -31,6 +31,7 @@ WLAN_COMMON =3D "\
> > #    netperf
> >
> > FIRMWARE_AND_DRIVERS =3D "\
> >+    ti-compat-wireless-wl18xx \
> >     wl18xx-firmware \
> > "
> >
> >diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> >compat-wireless-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> >bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
> >deleted file mode 100644
> >index 0e7281a..0000000
> >--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> >wireless-wl18xx_r8.a8.10.bb
> >+++ /dev/null
> >@@ -1,61 +0,0 @@
> >-# This is a TI specific version of the compat-wireless recipe using a
> >-# compat-wireless package created from the TI Systems Tested
> >mac80211 releases.
> >-
> >-DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> >-HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> >-SECTION =3D "kernel/modules"
> >-LICENSE =3D "GPLv2"
> >-LIC_FILES_CHKSUM =3D
> >"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >-
> >-RDEPENDS_${PN} =3D "wireless-tools"
> >-
> >-PROVIDES +=3D "ti-compat-wireless-wl12xx"
> >-RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
> >-RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
> >-RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
> >-
> >-COMPATIBLE_MACHINE =3D "(omap-a15)"
> >-
> >-PV =3D "r8.a8.08"
> >-inherit module
> >-
> >-PR =3D "${MACHINE_KERNEL_PR}"
> >-PR_append =3D "b"
> >-
> >-# Tags: ol_r8.a8.10
> >-SRCREV_wl18xx =3D "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
> >-SRCREV_compat =3D "5d80865281795f962e1400a95202bbd07dd763c0"
> >-SRCREV_compat-wireless =3D
> >"23a0d62ea1a57327709a77f08d6265ec807a909f"
> >-
> >-SRCREV_FORMAT =3D "compat-wireless"
> >-
> >-S =3D "${WORKDIR}/compat-wireless"
> >-
> >-SRC_URI =3D "git://github.com/TI-OpenLink/compat-
> >wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
> >-           git://github.com/TI-
> >OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
> >-           git://github.com/TI-
> >OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \ -"
> >-
> >-EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> >-
> >-do_configure() {
> >-    cd ${S}
> >-    GIT_TREE=3D"${WORKDIR}/wl18xx"
> >GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
> network
> >-    ./scripts/driver-select wl18xx
> >-
> >-    # Now generate the sourceipk with the properly configured
> >sources
> >-    sourceipk_do_create_srcipk
> >-}
> >-
> >-do_configure_append() {
> >-    sed -i "s#@./scripts/update-initramfs## " Makefile
> >-}
> >-
> >-do_install() {
> >-    # Remove hardcoded references to host depmod
> >-    sed -i "s#@/sbin/depmod -a## " Makefile
> >-    sed -i "s#@/sbin/depmod -ae## " Makefile
> >-
> >-    # Install modules
> >-    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
> INSTALL_MOD_PATH=3D"${D}"
> >LDFLAGS=3D"" install-modules
> >-}
> >diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> >compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-
> >bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> >new file mode 100644
> >index 0000000..dca2edb
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> >wireless-wl18xx_r8.a9.14.bb
> >@@ -0,0 +1,51 @@
> >+# This is a TI specific version of the compat-wireless recipe
> >using a
> >+# compat-wireless package created from the TI Systems Tested
> >mac80211 releases.
> >+
> >+DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> >+HOMEPAGE =3D "https://git.ti.com/wilink8-wlan/wl18xx"
> >+SECTION =3D "kernel/modules"
> >+LICENSE =3D "GPLv2"
> >+LIC_FILES_CHKSUM =3D
> >"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >+
> >+RDEPENDS_${PN} =3D "wireless-tools"
> >+
> >+PV =3D "r8.a9.14"
> >+inherit module
> >+
> >+PR =3D "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
> >+
> >+# Tags: ol_r8.a9.14
> >+SRCREV_wl18xx =3D "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
> >+BRANCH_wl18xx =3D "ap_p2p"
> >+SRCREV_backports =3D "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
> >+BRANCH_backports =3D "ap_dfs_mbss_all"
> >+
> >+SRCREV_FORMAT =3D "wl18xx"
> >+
> >+S =3D "${WORKDIR}/compat-wireless"
> >+
> >+SRC_URI =3D "git://git.ti.com/wilink8-
> >wlan/wl18xx.git;branch=3D${BRANCH_wl18xx};destsuffix=3Dwl18xx;name=3Dwl1
> >8xx \
> >+           git://git.ti.com/wilink8-
> >wlan/backports.git;branch=3D${BRANCH_backports};destsuffix=3Dbackports
> >;name=3Dbackports \
> >+ "
> >+
> >+export KLIB_BUILD=3D"${STAGING_KERNEL_DIR}"
> >+export KLIB=3D"${D}"
> >+
> >+do_configure() {
> >+    cd "${WORKDIR}/backports"
> >+    unset CC
> >+    #Generate compat-wireless
> >+    python ./gentree.py --clean  "${WORKDIR}/wl18xx"
> >"${WORKDIR}/compat-wireless"
> >+
> >+    cd ${S}
> >+    make defconfig-wl18xx
> >+
> >+    # Now generate the sourceipk with the properly configured
> >sources
> >+	sourceipk_do_create_srcipk
> >+}
> >+
> >+do_install() {
> >+    # Install modules
> >+    oe_runmake modules_install
> >+}
> >+
> >--
> >1.7.9
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

