Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E49E8520DF
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 03:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AB8540BF9;
	Fri, 13 Sep 2019 03:11:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XtgRCLz86MN3; Fri, 13 Sep 2019 03:11:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6ABD40C04;
	Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A6D9217422D;
	Thu, 12 Sep 2019 23:11:29 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 23:11:26 -0400
Message-Id: <1568344286-30548-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568344286-30548-1-git-send-email-denys@ti.com>
References: <1568344286-30548-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 6/6] HACK: recipes: skip wl18xx and crypto examples due to OpenSSL 1.0 deprecation
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
X-List-Received-Date: Fri, 13 Sep 2019 03:12:40 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc  |  6 +++---
 ...packagegroup-arago-tisdk-connectivity-sdk-target.bb |  4 ++--
 .../packagegroup-arago-tisdk-connectivity.bb           |  4 ++--
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb        |  6 +++---
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb   | 11 +++++------
 .../recipes-connectivity/hostap/hostap.inc             |  2 +-
 .../recipes-connectivity/vtun/vtun_3.0.3.bb            |  2 +-
 .../wpa-supplicant/wpa-supplicant.inc                  |  2 +-
 .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb | 18 ++++++------------
 .../ti-crypto-examples/ti-crypto-examples_git.bb       |  6 +++++-
 10 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 3d2ad74..f34fc65 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -49,6 +49,6 @@ PREFERRED_VERSION_obex = "0.34"
 PREFERRED_PROVIDER_libnl-xfrm = "libnl"
 
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
-PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
-PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
-PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index 3380913..cdf6a62 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -13,12 +13,12 @@ BLUETOOTH_STACK = "\
 CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x  = "\
-    wpa-supplicant-wl18xx-dev \
+    wpa-supplicant-dev \
     ${BLUETOOTH_STACK} \
 "
 
 CONNECTIVITY_RDEPENDS_ti43x  = "\
-    wpa-supplicant-wl18xx-dev \
+    wpa-supplicant-dev \
     ${BLUETOOTH_STACK} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index cc7da73..f3938ac 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -19,8 +19,8 @@ WLAN_COMMON = "\
 "
 
 WLAN_TI = "\
-    wpa-supplicant-wl18xx \
-    hostap-daemon-wl18xx \
+    wpa-supplicant \
+    hostapd \
     wl18xx-calibrator \
     wl18xx-target-scripts \
     wl18xx-fw \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index e87d8c2..14c06e9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -8,9 +8,9 @@ inherit packagegroup
 
 CRYPTO_RDEPENDS = ""
 
-CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
-CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
-CRYPTO_RDEPENDS_append_keystone = " ti-crypto-examples-src"
+#CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
+#CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
+#CRYPTO_RDEPENDS_append_keystone = " ti-crypto-examples-src"
 
 CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 4fe7057..50b7e8e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -11,14 +11,13 @@ CRYPTO_SUPPORT = "\
     openssl-bin \
     openssl-conf \
     openssl-engines \
-    openssl10 \
-    openssl10-engines \
 "
 
-CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_keystone = " ti-crypto-examples cryptodev-module cryptodev-tests"
+#ti-crypto-examples
+CRYPTO_SUPPORT_append_ti33x = " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_ti43x = " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_dra7xx = " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_keystone = " cryptodev-module cryptodev-tests"
 
 RDEPENDS_${PN} = "\
     ${CRYPTO_SUPPORT} \
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index f58a3dc..324de0b 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://hostap.epitest.fi"
 DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
 SECTION = "kernel/userland"
 
-DEPENDS = "libnl openssl10"
+DEPENDS = "libnl openssl"
 
 # Since this is a TI customized version of hostap-daemon do not make this the
 # default
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index 50e4d23..4450cc1 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400239e0de40cde8"
 
-DEPENDS = "zlib lzo openssl10 bison-native flex-native"
+DEPENDS = "zlib lzo openssl bison-native flex-native"
 
 SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
 
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 5fc3e58..6aac06d 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 | BSD"
 
 inherit pkgconfig
 
-DEPENDS = "gnutls dbus libnl openssl10 libgcrypt"
+DEPENDS = "gnutls dbus libnl openssl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 # To prevent users from accidently picking up this customized version of
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 99cf9c9..5ed3705 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -13,18 +13,12 @@ S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
 S_keystone = "${WORKDIR}/git/cryptos_apps_program"
 
-# These scripts HW offloading, so use openssl 1.0
-OPENSSL_BIN = "/usr/bin/openssl10"
-do_configure() {
-    sed -i -e "s|^OPENSSL=.*|OPENSSL=${OPENSSL_BIN}|" ${S}/openssl_perf_scripts/openssl_perf.sh
-}
-
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
-# Make sure crypto submenu and app images has been installed. Also make sure openssl10 is available
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl10 matrix-gui-helper-scripts"
+# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
 
-RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
-RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
-RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
+#RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
+#RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
+#RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
+#RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 3df6275..3cfa332 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=s
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
-DEPENDS += "openssl10"
+DEPENDS += "openssl"
 
 PR = "r7"
 
@@ -24,3 +24,7 @@ do_compile() {
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
+
+python () {
+    raise bb.parse.SkipRecipe("skipping ti-crypto-examples")
+}
-- 
2.7.4


