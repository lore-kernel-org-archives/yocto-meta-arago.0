Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9189.1645504922752260789
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 375D540A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:42:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaVuRfdHUnbX for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:42:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C808B40C90
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B5083174771
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 13/23] meta-arago: update ambiguous "BSD" license with "BSD-3-Clause"
Date: Tue, 22 Feb 2022 04:41:41 +0000
Message-Id: <20220222044151.2844138-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core recently removed ambiguous "BSD" license[1] in order for recipes =
to
be more specific and use the exact variants of BSD. Update meta-arago rec=
ipes
with "BSD-3-Clause" as that was the previous default.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D14d4c007c=
49652d836d325a12bdbcd3bfa42e6d5

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb            | 2 +-
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
 .../recipes-apps/image-gallery/image-gallery_git.bb             | 2 +-
 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb  | 2 +-
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb      | 2 +-
 .../recipes-connectivity/openntpd/openntpd_3.9p1.bb             | 2 +-
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb                     | 2 +-
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc      | 2 +-
 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb     | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb         | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb | 2 +-
 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb     | 2 +-
 .../recipes-core/oprofile-example/oprofile-example_git.bb       | 2 +-
 .../recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb   | 2 +-
 .../ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb        | 2 +-
 .../ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb    | 2 +-
 .../ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb            | 2 +-
 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb | 2 +-
 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 2 +-
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb   | 2 +-
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb     | 2 +-
 .../pinmux-utility/pinmux-utility_1.0.1076.3.bb                 | 2 +-
 .../recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb   | 2 +-
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb   | 2 +-
 meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb       | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb         | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb          | 2 +-
 .../recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb             | 2 +-
 .../recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb              | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb        | 2 +-
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb                   | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb         | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb          | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                  | 2 +-
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc            | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb           | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb        | 2 +-
 40 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-=
arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index 85cf2554..4e3f9443 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Script to parse ip address during boot and make it avai=
lable to the host system using shared partitions"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://init;beginline=3D3;endline=3D31;md5=3Df82dd=
b19a87f97193d08feacfd0e4903"
=20
 COMPATIBLE_MACHINE =3D "ti33x|ti43x"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index a8b524ed..5524ffcb 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Package containing scripts to setup the development hos=
t and target board"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://setup.sh;beginline=3D3;endline=3D31;md5=3Df=
c4b04a33df6d892c9f4d4a9d92b945e"
=20
 PR =3D "r46"
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_g=
it.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 537cec01..9625084b 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Image Gallery"
 HOMEPAGE =3D "https://gitorious.org/image-gallery"
 SECTION =3D "multimedia"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c57cc1cdee589f97cbba69e95a89=
a15"
=20
 require recipes-core/matrix/matrix-gui-paths.inc
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index c4eb10ee..84ef96ea 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Qt Thermostat Demo"
 HOMEPAGE =3D "https://gitorious.org/thermostat-demo"
=20
-LICENSE =3D "BSD & CC-BY-SA-2.0 & CC-BY-SA-3.0 & MIT"
+LICENSE =3D "BSD-3-Clause & CC-BY-SA-2.0 & CC-BY-SA-3.0 & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D93a105adb99011afa5baee932b560=
714 \
                     file://IMAGE-LICENSE;md5=3Dfce98146123de13a189c234a5=
e4cfa0d \
                     file://API-LICENSE;md5=3D5e32280d79a1eab76729c50d79e=
cfe72 \
diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-bench=
marks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-ben=
chmarks_1.3.bb
index 5f6279ad..e0f826e9 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "ARM Benchmarks"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f957=
922"
 SECTION =3D "system"
=20
diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9=
p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
index 3ee63054..008d4d33 100644
--- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implemen=
tation of the \
 Network Time Protocol."
 HOMEPAGE =3D "http://www.openntpd.org/"
 SECTION =3D "console/network"
-LICENSE =3D "BSD & ISC"
+LICENSE =3D "BSD-3-Clause & ISC"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4b4f5158007cc97e6b0e2325bb998=
54a"
=20
 PR =3D "r0"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplican=
t/wpa-supplicant-wl18xx.bb
index 59e64df2..04ae405e 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
@@ -3,7 +3,7 @@
=20
 require wpa-supplicant.inc
=20
-LICENSE =3D "GPLv2 | BSD"
+LICENSE =3D "GPLv2 | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed846=
4018a3 \
                     file://../README;md5=3D3f01d778be8f953962388307ee38e=
d2b \
                     file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3D35e6d71fea6b15f61a9fac935bcf410f"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-=
supplicant.inc
index 4ed2d353..dad2b824 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
@@ -5,7 +5,7 @@ SUMMARY =3D "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
 SECTION =3D "network"
-LICENSE =3D "GPLv2 | BSD"
+LICENSE =3D "GPLv2 | BSD-3-Clause"
=20
 inherit pkgconfig
=20
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb =
b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 0cd24690..6f38b750 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "AM SysInfo"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_sysinfo/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://mem_util/mem_util.c;beginline=3D1;endline=3D=
37;md5=3D8aa8e714ab729cfe8177298af8a5a25d"
=20
 SECTION =3D "system"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index c9440628..578cff50 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Simple Qt web display using webengine"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D7=
5a9adc782a6df0d3a5419743e9a9f18"
 SECTION =3D "multimedia"
=20
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 7cd5c82e..c09e8d35 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Matrix GUI Application launcher"
=20
-LICENSE =3D "BSD & MIT"
+LICENSE =3D "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512=
e5d"
=20
 SECTION =3D "multimedia"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index 95f75b52..16d08d1e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Lighttpd config for Matrix"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a=
579"
=20
 inherit allarch
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb =
b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 10dfada9..4cc9859a 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Simple Application to force a screen refresh"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D7=
5a9adc782a6df0d3a5419743e9a9f18"
 SECTION =3D "multimedia"
=20
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-exa=
mple_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-ex=
ample_git.bb
index dd013c87..ff0347d6 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_gi=
t.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_gi=
t.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "OProfile Example"
 HOMEPAGE =3D "https://gitorious.org/oprofile-example"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://signal_parent.c;beginline=3D1;endline=3D37;=
md5=3D3c72149bb458105db5d2e6fbcb2da66e"
=20
 SECTION =3D "system"
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-=
examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-cr=
ypto-examples_git.bb
index 97ed0225..943a1b2b 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI Cryptography Example Applications"
 HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dcrypto-example-=
apps.git;a=3Dsummary"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://AES/aes_256.c;beginline=3D9;endline=3D35;md=
5=3D8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION =3D "console"
 DEPENDS +=3D "openssl"
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-s=
w-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-lo=
ader/ti-pru-sw-app-loader_1.00.00.bb
index 8cbfc7a4..5eaad599 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "PRU sw application loader"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://interface/prussdrv.c;beginline=3D1;endline=3D=
47;md5=3D6012fea45c1fbced663277bc90d2163a"
=20
 RRECOMMENDS:${PN} =3D "kernel-module-uio-pru"
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru=
-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-ed=
ma-library/ti-pru-sw-edma-library_1.00.00.bb
index d41f4a66..88b86d63 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "eDMA library for use by PRU sw example applications"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://edma.c;beginline=3D1;endline=3D46;md5=3Df6b=
de95a8e2277050e36b257ca9214a6"
=20
 DEPENDS +=3D "virtual/kernel"
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-=
examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/t=
i-pru-sw-examples_1.00.00.bb
index 6e602bf0..60bc3d5a 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "PRU sw example applications"
 HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dc4fd8ee7443c1b2b6238b4b5d=
f796481"
 DEPENDS =3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
 RDEPENDS:${PN} =3D "ti-pru-sw-edma-driver"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules=
.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index da661a91..b783a22b 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -1,5 +1,5 @@
 UMMARY =3D "Extra modules and scripts for CMake"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING-CMAKE-SCRIPTS;md5=3D54c7042be62e169=
199200bc6477f04d1"
=20
 PV =3D "1.5.0+gitr${SRCPV}"
diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git=
.bb b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 9f61ee5f..37842ea0 100644
--- a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Utility to generate specified CPU Load"
 HOMEPAGE =3D "https://github.com/ptitiano/cpuloadgen"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc6c2eb46c569d0cd7884089fea6b4=
f31"
=20
 PV =3D "0.93"
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.b=
b b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index 3cd0b8e3..d52d5eaf 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Utility for parsing system events"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://eventdump.c;beginline=3D1;endline=3D34;md5=3D=
23b59be24a88ddc407b553035f3fd3e9"
=20
 PR =3D "r3"
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb =
b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 7f63db39..768d5505 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Diagnostic tool for TI OMAP processors"
 HOMEPAGE =3D "https://github.com/omapconf/omapconf"
=20
-LICENSE =3D "GPLv2 | BSD"
+LICENSE =3D "GPLv2 | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e=
914"
=20
 PV =3D "1.75+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-uti=
lity_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pi=
nmux-utility_1.0.1076.3.bb
index 2dfb731d..0a326a95 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.=
0.1076.3.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.=
0.1076.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Texas Instruments Pinmux Utility"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b328fcf0477d688d8b85f7310f9e=
6b9"
 COMPATIBLE_MACHINE =3D "omapl138"
=20
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-uti=
lity_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmu=
x-utility_2.5.2.0.bb
index c924e8de..75b5b360 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Texas Instruments Pinmux Utility"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd69a4aafe4f7b66d5f9c60d6875eb=
d52"
 COMPATIBLE_MACHINE =3D "am335x-evm"
=20
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-=
example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/g=
lsdk-example-apps.bb
index a11d8192..6e3ec7b3 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "GLSDK example applications"
 HOMEPAGE =3D "http://git.ti.com/glsdk"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10a9abb9c5bb19edd83a8cf66eef7=
148"
=20
 DEPENDS =3D "gstreamer1.0 libdrm libdce ti-ipc wayland weston"
diff --git a/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb b/=
meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb
index 03b77852..a9fb1098 100644
--- a/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Library of simple functions optimized for va=
rious CPUs"
 HOMEPAGE =3D "http://liboil.freedesktop.org/"
 BUGTRACKER =3D "https://bugs.freedesktop.org/"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dad80780d9c5205d63481a0184e199=
a15 \
                     file://liboil/liboil.h;endline=3D28;md5=3D95c794a66b=
88800d949fed17e437d9fb \
                     file://liboil/liboilcpu.c;endline=3D28;md5=3D89da69a=
61d88eedcba066f42353fb75a \
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/me=
ta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
index 086497ec..d31f06c9 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL-C compiler for C66x (Linux hosted)"
 HOMEPAGE =3D "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/met=
a-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
index 18d304b7..d1fffae2 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL-C compiler for C66x (Windows hosted)"
 HOMEPAGE =3D "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_g=
it.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 2aa130ba..883be797 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL example applications"
 HOMEPAGE =3D "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_gi=
t.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 81ab0fa4..2c53f684 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL compute device firmware for C66x (RTOS)"
 HOMEPAGE =3D "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/m=
eta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index aa30b52a..bed29bc1 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL host runtime (RTOS)"
 HOMEPAGE =3D "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-e=
xtras/recipes-ti/ocl/clocl_git.bb
index 5638ef4d..9b2a3aa9 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI OpenCL offline C compiler for compute devices"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include ocl.inc
=20
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 7e5aaeb8..98b6b64d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenCL example applications"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b=
/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 44000977..4ec9a547 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI OpenCL M4/IPU device firmware for AM57x"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 930d270b..c5bfe36a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI OpenCL compute device firmware"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-=
extras/recipes-ti/ocl/opencl_git.bb
index 4ee67332..eb708f69 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "TI OpenCL host runtime and development packages"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/opencl/index.htm=
l"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include ocl.inc
=20
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-=
arago-extras/recipes-ti/openmpacc/openmpacc.inc
index 7bcccb13..f8774810 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI OpenMP Accelerator Model"
 HOMEPAGE =3D "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 inherit features_check
=20
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 27760ebc..7f37b63b 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TIDL API"
 DESCRIPTION =3D "TIDL API header and library. Refer TIDL API User's Guid=
e for details."
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b=
/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index 96c9d860..c9756d40 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TIDL API examples"
 DESCRIPTION =3D "Examples of TIDL API. Refer TIDL API User's Guide for d=
etails."
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/m=
eta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
index aa143a7c..644b8626 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TIDL Network Viewer"
 DESCRIPTION =3D "TIDL Network viewer using dot and graphviz"
 HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.h=
tml"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 include tidl-api.inc
=20
--=20
2.25.1

