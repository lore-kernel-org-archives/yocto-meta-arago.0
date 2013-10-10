Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EADEF52090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 14:52:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AEqq6Y003053
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:52:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AEqqPa025151
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:52:52 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 09:52:52 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Monk, Roger" <r-monk@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH	01/11]
	ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8	r8.a7.02
Thread-Index: AQHOxcZ3UuhbfoU8/0Sk+sMKgH4DpJnuBF3Q
Date: Thu, 10 Oct 2013 14:52:51 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C57192B@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-2-git-send-email-r-monk@ti.com>
	<7D46E86EC0A8354091174257B2FED1015979B2CD@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015979B2CD@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH	01/11]	ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8	r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 14:52:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I would suggest taking take the current ti-compat-wireless-wl18xx recipe pu=
t the bulk of the content in a ti-compat-wireless-wl18xx.inc and then have =
the current (one patch) and new recipes (another patch) override/set what t=
hey need.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, October 10, 2013 9:39 AM
> To: Monk, Roger; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 01/11] ti-connectivity/ti-compat-wireles=
s-
> wl18xx: Add Wilink8 r8.a7.02
>=20
> Can you use --find-copies-harder when making these patches?  It will make=
 this
> easier to review as an update to the existing recipe.
>=20
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Monk, Roger
> >Sent: Wednesday, October 09, 2013 7:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 01/11] ti-connectivity/ti-compat-
> >wireless-wl18xx: Add Wilink8 r8.a7.02
> >
> >   * Add v r8.a7.02 engineering release
> >   * This release supports the omap-a15 devices (omap5-evm/dra7-
> >evm) with ES 2.1 WL8
> >   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK
> >18xx module
> >      * OMAP5432x-xx-x1-xx
> >
> >Signed-off-by: Roger Monk <r-monk@ti.com>
> >---
> > .../ti-compat-wireless-wl18xx_r8.a7.02.bb          |   71
> >++++++++++++++++++++
> > 1 file changed, 71 insertions(+)
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> >wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
> >
> >diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> >compat-wireless-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-
> >bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
> >new file mode 100644
> >index 0000000..295dd9c
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> >wireless-wl18xx_r8.a7.02.bb
> >@@ -0,0 +1,71 @@
> >+# This is a TI specific version of the compat-wireless recipe
> >using a
> >+# compat-wireless package created from the TI Systems Tested
> >mac80211 releases.
> >+
> >+DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> >+HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> >+SECTION =3D "kernel/modules"
> >+LICENSE =3D "GPLv2"
> >+LIC_FILES_CHKSUM =3D
> >"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >+
> >+RDEPENDS_${PN} =3D "wireless-tools"
> >+
> >+PROVIDES +=3D "ti-compat-wireless-wl12xx"
> >+RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
> >+RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
> >+RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
> >+
> >+COMPATIBLE_MACHINE =3D "(omap-a15)"
> >+
> >+PV =3D "r8.a7.02"
> >+inherit module
> >+
> >+PR =3D "${MACHINE_KERNEL_PR}"
> >+PR_append =3D "a"
> >+
> >+# Tags: ol_r8.a7.02
> >+SRCREV_wl18xx =3D "e611d18893fbd66f6c303e111955d8a732fd0c34"
> >+SRCREV_compat =3D "595b13b80f9b922d9e3a1c6e7b75c38b471b2b44"
> >+SRCREV_compat-wireless =3D
> >"40d5abd0fe6c89a2afd993f633924e716453a09e"
> >+
> >+SRCREV_FORMAT =3D "compat-wireless"
> >+
> >+S =3D "${WORKDIR}/compat-wireless"
> >+
> >+SRC_URI =3D "git://github.com/TI-OpenLink/compat-
> >wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
> >+           git://github.com/TI-
> >OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
> >+           git://github.com/TI-
> >OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \
> >+"
> >+
> >+EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> >+
> >+# Prevent sourceipk adjust_git function from running.
> >+# This preserves the git repo until driver-select is ran.
> >+
> >+adjust_git() {
> >+    :
> >+}
> >+
> >+do_configure() {
> >+    cd ${S}
> >+    GIT_TREE=3D"${WORKDIR}/wl18xx"
> >GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
> network
> >+    ./scripts/driver-select wl18xx
> >+
> >+    # Delete the .git repository since it should no longer be
> >needed.
> >+    #rm -rf ${S}/.git ${S}/.gitignore
> >+
> >+    # Now generate the sourceipk with the properly configured
> >sources
> >+    sourceipk_do_create_srcipk
> >+}
> >+
> >+do_configure_append() {
> >+    sed -i "s#@./scripts/update-initramfs## " Makefile }
> >+
> >+do_install() {
> >+    # Remove hardcoded references to host depmod
> >+    sed -i "s#@/sbin/depmod -a## " Makefile
> >+    sed -i "s#@/sbin/depmod -ae## " Makefile
> >+
> >+    # Install modules
> >+    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
> INSTALL_MOD_PATH=3D"${D}"
> >LDFLAGS=3D"" install-modules
> >+}
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

