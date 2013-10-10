Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9660C52090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:07:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF79VO012157
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF79ul014112
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:09 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:07:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 01/11]
	ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8 r8.a7.02
Thread-Index: AQHOxcnto7MDCk9oG06rw+pUIOPYXZnuCQnQ
Date: Thu, 10 Oct 2013 15:07:08 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979B880@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-2-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-2-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 01/11]	ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:07:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 01/11] ti-connectivity/ti-compat-
>wireless-wl18xx: Add Wilink8 r8.a7.02
>
>   * Add v r8.a7.02 engineering release
>   * This release supports the omap-a15 devices (omap5-evm/dra7-
>evm) with ES 2.1 WL8
>   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8
>TDK 18xx module
>      * OMAP5432x-xx-x1-xx
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> ...01.bb =3D> ti-compat-wireless-wl18xx_r8.a7.02.bb} |   30
>+++++++++++---------
> 1 file changed, 17 insertions(+), 13 deletions(-)
> copy meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-
>wireless-wl18xx_r8.a6.01.bb =3D> ti-compat-wireless-
>wl18xx_r8.a7.02.bb} (73%)
>
>diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-
>bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
>similarity index 73%
>copy from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a6.01.bb
>copy to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a7.02.bb
>index a69b7d6..295dd9c 100644
>--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
>wireless-wl18xx_r8.a6.01.bb
>+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
>wireless-wl18xx_r8.a7.02.bb
>@@ -5,7 +5,7 @@ DESCRIPTION =3D "ti compat-wireless drivers for
>wl18xx"
> HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> SECTION =3D "kernel/modules"
> LICENSE =3D "GPLv2"
>-LIC_FILES_CHKSUM =3D
>"file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>
> RDEPENDS_${PN} =3D "wireless-tools"
>
>@@ -14,16 +14,18 @@ RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
> RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
> RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
>
>-PV =3D "r8.a6.01"
>+COMPATIBLE_MACHINE =3D "(omap-a15)"
>+
>+PV =3D "r8.a7.02"
> inherit module
>
> PR =3D "${MACHINE_KERNEL_PR}"
>-PR_append =3D "c"
>+PR_append =3D "a"
>
>-# Tags: ol_r8.a6.01
>-SRCREV_wl18xx =3D "f076cdad1988daf207ad560db2fe96caaa7c596e"
>-SRCREV_compat =3D "c37c46c4ab5085ba50f650d15854404983b8d09b"
>-SRCREV_compat-wireless =3D
>"3ec9ecca2cb07584e115ba53117f0084fc8faa25"
>+# Tags: ol_r8.a7.02
>+SRCREV_wl18xx =3D "e611d18893fbd66f6c303e111955d8a732fd0c34"
>+SRCREV_compat =3D "595b13b80f9b922d9e3a1c6e7b75c38b471b2b44"
>+SRCREV_compat-wireless =3D
>"40d5abd0fe6c89a2afd993f633924e716453a09e"
>
> SRCREV_FORMAT =3D "compat-wireless"
>
>@@ -32,10 +34,7 @@ S =3D "${WORKDIR}/compat-wireless"
> SRC_URI =3D "git://github.com/TI-OpenLink/compat-
>wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
>            git://github.com/TI-
>OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
>            git://github.com/TI-
>OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \
>-           file://0001-git-version-wl18xx-use-compat-base-
>tree.patch;patchdir=3D../wl18xx \
>-           file://0001-wl12xx-additional-two-members-for-
>wl12xx_platform_da.patch;patchdir=3D../wl18xx \
>-          "
>-
>+"
>
> EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
>
>@@ -48,11 +47,11 @@ adjust_git() {
>
> do_configure() {
>     cd ${S}
>-    GIT_TREE=3D"${WORKDIR}/wl18xx"
>GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
>+    GIT_TREE=3D"${WORKDIR}/wl18xx"
>GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
>network
>     ./scripts/driver-select wl18xx
>
>     # Delete the .git repository since it should no longer be
>needed.
>-    rm -rf ${S}/.git ${S}/.gitignore
>+    #rm -rf ${S}/.git ${S}/.gitignore

Why leave this comment?

>
>     # Now generate the sourceipk with the properly configured
>sources
>     sourceipk_do_create_srcipk
>@@ -63,5 +62,10 @@ do_configure_append() {
> }
>
> do_install() {
>+    # Remove hardcoded references to host depmod
>+    sed -i "s#@/sbin/depmod -a## " Makefile
>+    sed -i "s#@/sbin/depmod -ae## " Makefile
>+
>+    # Install modules
>     oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}" INSTALL_MOD_PATH=3D"${D}"
>LDFLAGS=3D"" install-modules
> }
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

