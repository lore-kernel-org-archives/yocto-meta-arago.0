Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364F3C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:36:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.38828.1741790192313271974
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J8WrtT5i;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEaUov1605202
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790190;
	bh=e/iWmSgWUMQVO3flqnE7tthzAP1yFPl7O7dCQcuUPVs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J8WrtT5i/0S8FiqB5NXYQRGwMt6XwQl5F5ioq0iAGL/xCrIuaydbaV5fogd1xvCMQ
	 R+5nbVA1Oke5PQYDXQKfycKucOiTX7XlxsmZEsvGW9LVGJertz+39tJpA6hIZu0GAR
	 mbpbNxGSlLQNZh9rvTn8DYHqFLZsaG8yUgjfiaJw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEaUsO000433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:36:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:36:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:36:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEaU95125889;
	Wed, 12 Mar 2025 09:36:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNCA-0004D5-7l; Wed, 12 Mar 2025 09:36:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 2/2] wpa-supplicant-wl18xx: Remove old recipe
Date: Wed, 12 Mar 2025 09:36:30 -0500
Message-ID: <20250312143630.16096-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312143630.16096-1-reatmon@ti.com>
References: <20250312143630.16096-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:36:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15989

This recipe was effectively disabled in 2019 and we have heard zero
complaints about it ever since.  We have been using the main
wpa-supplicant without issue apparently.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb   |  25 -
 .../wpa-supplicant/wpa-supplicant.inc         |  89 ---
 .../wpa-supplicant/99_wpa_supplicant          |   1 -
 .../wpa-supplicant/crypto_openssl.patch       | 130 -----
 .../wpa-supplicant/wpa-supplicant/defconfig   | 548 ------------------
 .../wpa-supplicant/p2p_supplicant.conf        |  13 -
 .../wpa-supplicant/wpa-supplicant.sh          |  85 ---
 .../wpa-supplicant/wpa_supplicant.conf        |  65 ---
 .../wpa-supplicant/wpa_supplicant.conf-sane   |   7 -
 9 files changed, 963 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
deleted file mode 100644
index 516465b8..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl18xx wlan module.
-
-require wpa-supplicant.inc
-
-LICENSE = "GPL-2.0-only | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=292eece3f2ebbaa25608eed8464018a3 \
-                    file://../README;md5=3f01d778be8f953962388307ee38ed2b \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=35e6d71fea6b15f61a9fac935bcf410f"
-
-FILESEXTRAPATHS:append := ":${THISDIR}/wpa-supplicant"
-
-# Tag: R8.7_SP3
-SRCREV = "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
-BRANCH = "upstream_25_rebase"
-PR:append = "b"
-
-# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "R8.7_SP3-devel-ti+git"
-
-PROVIDES += "wpa-supplicant"
-RPROVIDES:${PN}  += "wpa-supplicant"
-RREPLACES:${PN}  += "wpa-supplicant"
-RCONFLICTS:${PN}  += "wpa-supplicant"
-RDEPENDS:${PN} += "wpa-supplicant-cli wpa-supplicant-passphrase"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
deleted file mode 100644
index 9767e9ad..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl18xx wlan.
-
-SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
-HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-BUGTRACKER = "http://hostap.epitest.fi/bugz/"
-SECTION = "network"
-LICENSE = "GPL-2.0-only | BSD-3-Clause"
-
-inherit pkgconfig
-
-DEPENDS = "gnutls dbus libnl openssl libgcrypt"
-RRECOMMENDS:${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
-
-# To prevent users from accidently picking up this customized version of
-# wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r9"
-
-SRC_URI = "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=https;branch=${BRANCH} \
-           file://defconfig \
-           file://wpa-supplicant.sh \
-           file://wpa_supplicant.conf \
-           file://p2p_supplicant.conf \
-           file://99_wpa_supplicant \
-          "
-SRC_URI += "file://crypto_openssl.patch;patchdir=.."
-
-S = "${WORKDIR}/git/wpa_supplicant"
-
-PACKAGES:prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-FILES:wpa-supplicant-passphrase = "${sbindir}/wpa_passphrase"
-FILES:wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES:${PN} += "${datadir}/dbus-1/system-services/*"
-
-do_configure () {
-	install -m 0755 ${WORKDIR}/defconfig .config
-	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> .config
-}
-
-export EXTRA_CFLAGS = "${CFLAGS}"
-export BINDIR = "${sbindir}"
-do_compile () {
-	unset CFLAGS CPPFLAGS CXXFLAGS
-	sed -e "s:CFLAGS\ =.*:& \$(EXTRA_CFLAGS):g" -i ${S}/../src/lib.rules
-	oe_runmake
-}
-
-do_install () {
-	install -d ${D}${sbindir}
-	install -m 755 wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_passphrase ${D}${sbindir}
-	install -m 755 wpa_cli        ${D}${sbindir}
-
-	install -d ${D}${docdir}/wpa_supplicant
-	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
-
-	install -d ${D}${sysconfdir}/default
-	install -m 600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant.conf
-	install -m 600 ${WORKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf
-
-	install -d ${D}${sysconfdir}/network/if-pre-up.d/
-	install -d ${D}${sysconfdir}/network/if-post-down.d/
-	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
-	cd ${D}${sysconfdir}/network/ && \
-	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
-
-	install -d ${D}/${sysconfdir}/dbus-1/system.d
-	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
-	install -d ${D}/${datadir}/dbus-1/system-services
-	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -d ${D}/${systemd_unitdir}/system
-		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
-	fi
-
-	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-}
-
-pkg_postinst:wpa-supplicant () {
-	# If we're offline, we don't need to do this.
-	if [ "x$D" = "x" ]; then
-		killall -q -HUP dbus-daemon || true
-	fi
-}
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
deleted file mode 100644
index 6ff4dd88..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
+++ /dev/null
@@ -1 +0,0 @@
-d root root 0700 /var/run/wpa_supplicant none
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch
deleted file mode 100644
index c958f403..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
---- a/src/crypto/crypto_openssl.c	2019-11-09 06:46:42.112779317 -0600
-+++ b/src/crypto/crypto_openssl.c.new	2019-11-09 13:16:57.560629882 -0600
-@@ -602,11 +602,15 @@
- 
- void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
- {
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && \
-+	 LIBRESSL_VERSION_NUMBER < 0x20700000L)
- 	DH *dh;
- 	struct wpabuf *pubkey = NULL, *privkey = NULL;
- 	size_t publen, privlen;
- 
- 	*priv = NULL;
-+	wpabuf_free(*publ);
- 	*publ = NULL;
- 
- 	dh = DH_new();
-@@ -645,11 +649,65 @@
- 	wpabuf_clear_free(privkey);
- 	DH_free(dh);
- 	return NULL;
-+#else
-+	DH *dh;
-+	struct wpabuf *pubkey = NULL, *privkey = NULL;
-+	size_t publen, privlen;
-+	BIGNUM *p = NULL, *g;
-+	const BIGNUM *priv_key = NULL, *pub_key = NULL;
-+
-+	*priv = NULL;
-+	wpabuf_free(*publ);
-+	*publ = NULL;
-+
-+	dh = DH_new();
-+	if (dh == NULL)
-+		return NULL;
-+
-+	g = BN_new();
-+	p = get_group5_prime();
-+	if (!g || BN_set_word(g, 2) != 1 || !p ||
-+	    DH_set0_pqg(dh, p, NULL, g) != 1)
-+		goto err;
-+	p = NULL;
-+	g = NULL;
-+
-+	if (DH_generate_key(dh) != 1)
-+		goto err;
-+
-+	DH_get0_key(dh, &pub_key, &priv_key);
-+	publen = BN_num_bytes(pub_key);
-+	pubkey = wpabuf_alloc(publen);
-+	if (!pubkey)
-+		goto err;
-+	privlen = BN_num_bytes(priv_key);
-+	privkey = wpabuf_alloc(privlen);
-+	if (!privkey)
-+		goto err;
-+
-+	BN_bn2bin(pub_key, wpabuf_put(pubkey, publen));
-+	BN_bn2bin(priv_key, wpabuf_put(privkey, privlen));
-+
-+	*priv = privkey;
-+	*publ = pubkey;
-+	return dh;
-+
-+err:
-+	BN_free(p);
-+	BN_free(g);
-+	wpabuf_clear_free(pubkey);
-+	wpabuf_clear_free(privkey);
-+	DH_free(dh);
-+	return NULL;
-+#endif
- }
- 
- 
- void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
- {
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && \
-+	 LIBRESSL_VERSION_NUMBER < 0x20700000L)
- 	DH *dh;
- 
- 	dh = DH_new();
-@@ -680,6 +738,42 @@
- err:
- 	DH_free(dh);
- 	return NULL;
-+#else
-+	DH *dh;
-+	BIGNUM *p = NULL, *g, *priv_key = NULL, *pub_key = NULL;
-+
-+	dh = DH_new();
-+	if (dh == NULL)
-+		return NULL;
-+
-+	g = BN_new();
-+	p = get_group5_prime();
-+	if (!g || BN_set_word(g, 2) != 1 || !p ||
-+	    DH_set0_pqg(dh, p, NULL, g) != 1)
-+		goto err;
-+	p = NULL;
-+	g = NULL;
-+
-+	priv_key = BN_bin2bn(wpabuf_head(priv), wpabuf_len(priv), NULL);
-+	pub_key = BN_bin2bn(wpabuf_head(publ), wpabuf_len(publ), NULL);
-+	if (!priv_key || !pub_key || DH_set0_key(dh, pub_key, priv_key) != 1)
-+		goto err;
-+	pub_key = NULL;
-+	priv_key = NULL;
-+
-+	if (DH_generate_key(dh) != 1)
-+		goto err;
-+
-+	return dh;
-+
-+err:
-+	BN_free(p);
-+	BN_free(g);
-+	BN_free(pub_key);
-+	BN_clear_free(priv_key);
-+	DH_free(dh);
-+	return NULL;
-+#endif
- }
- 
- 
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
deleted file mode 100755
index 2f25cd39..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ /dev/null
@@ -1,548 +0,0 @@
-# Example wpa_supplicant build time configuration
-#
-# This file lists the configuration options that are used when building the
-# hostapd binary. All lines starting with # are ignored. Configuration option
-# lines must be commented out complete, if they are not to be included, i.e.,
-# just setting VARIABLE=n is not disabling that variable.
-#
-# This file is included in Makefile, so variables like CFLAGS and LIBS can also
-# be modified from here. In most cases, these lines should use += in order not
-# to override previous values of the variables.
-
-
-# Uncomment following two lines and fix the paths if you have installed OpenSSL
-# or GnuTLS in non-default location
-#CFLAGS += -I/usr/local/openssl/include
-#LIBS += -L/usr/local/openssl/lib
-
-# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
-# the kerberos files are not in the default include path. Following line can be
-# used to fix build issues on such systems (krb5.h not found).
-#CFLAGS += -I/usr/include/kerberos
-
-# Example configuration for various cross-compilation platforms
-
-#### sveasoft (e.g., for Linksys WRT54G) ######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
-#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
-###############################################################################
-
-#### openwrt (e.g., for Linksys WRT54G) #######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
-#	-I../WRT54GS/release/src/include
-#LIBS = -lssl
-###############################################################################
-
-
-# Driver interface for Host AP driver
-#CONFIG_DRIVER_HOSTAP=y
-
-# Driver interface for Agere driver
-#CONFIG_DRIVER_HERMES=y
-# Change include directories to match with the local setup
-#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
-#CFLAGS += -I../../include/wireless
-
-# Driver interface for madwifi driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_MADWIFI=y
-# Set include directory to the madwifi source tree
-#CFLAGS += -I../../madwifi
-
-# Driver interface for ndiswrapper
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_NDISWRAPPER=y
-
-# Driver interface for Atmel driver
-#CONFIG_DRIVER_ATMEL=y
-
-# Driver interface for old Broadcom driver
-# Please note that the newer Broadcom driver ("hybrid Linux driver") supports
-# Linux wireless extensions and does not need (or even work) with the old
-# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
-#CONFIG_DRIVER_BROADCOM=y
-# Example path for wlioctl.h; change to match your configuration
-#CFLAGS += -I/opt/WRT54GS/release/src/include
-
-# Driver interface for Intel ipw2100/2200 driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_IPW=y
-
-# Driver interface for Ralink driver
-#CONFIG_DRIVER_RALINK=y
-
-# Driver interface for generic Linux wireless extensions
-# Note: WEXT is deprecated in the current Linux kernel version and no new
-# functionality is added to it. nl80211-based interface is the new
-# replacement for WEXT and its use allows wpa_supplicant to properly control
-# the driver to improve existing functionality like roaming and to support new
-# functionality.
-#CONFIG_DRIVER_WEXT=y
-
-# Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_DRIVER_NL80211=y
-CONFIG_LIBNL32=y
-
-# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
-#CONFIG_DRIVER_BSD=y
-#CFLAGS += -I/usr/local/include
-#LIBS += -L/usr/local/lib
-#LIBS_p += -L/usr/local/lib
-#LIBS_c += -L/usr/local/lib
-
-# Driver interface for Windows NDIS
-#CONFIG_DRIVER_NDIS=y
-#CFLAGS += -I/usr/include/w32api/ddk
-#LIBS += -L/usr/local/lib
-# For native build using mingw
-#CONFIG_NATIVE_WINDOWS=y
-# Additional directories for cross-compilation on Linux host for mingw target
-#CFLAGS += -I/opt/mingw/mingw32/include/ddk
-#LIBS += -L/opt/mingw/mingw32/lib
-#CC=mingw32-gcc
-# By default, driver_ndis uses WinPcap for low-level operations. This can be
-# replaced with the following option which replaces WinPcap calls with NDISUIO.
-# However, this requires that WZC is disabled (net stop wzcsvc) before starting
-# wpa_supplicant.
-# CONFIG_USE_NDISUIO=y
-
-# Driver interface for development testing
-#CONFIG_DRIVER_TEST=y
-
-# Driver interface for wired Ethernet drivers
-#CONFIG_DRIVER_WIRED=y
-
-# Driver interface for the Broadcom RoboSwitch family
-#CONFIG_DRIVER_ROBOSWITCH=y
-
-# Driver interface for no driver (e.g., WPS ER only)
-#CONFIG_DRIVER_NONE=y
-
-# Solaris libraries
-#LIBS += -lsocket -ldlpi -lnsl
-#LIBS_c += -lsocket
-
-# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
-# included)
-CONFIG_IEEE8021X_EAPOL=y
-
-# EAP-MD5
-CONFIG_EAP_MD5=y
-
-# EAP-MSCHAPv2
-CONFIG_EAP_MSCHAPV2=y
-
-# EAP-TLS
-CONFIG_EAP_TLS=y
-
-# EAL-PEAP
-CONFIG_EAP_PEAP=y
-
-# EAP-TTLS
-CONFIG_EAP_TTLS=y
-
-# EAP-FAST
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
-# to add the needed functions.
-CONFIG_EAP_FAST=y
-
-# EAP-GTC
-CONFIG_EAP_GTC=y
-
-# EAP-OTP
-CONFIG_EAP_OTP=y
-
-# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-CONFIG_EAP_SIM=y
-
-# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
-
-# EAP-pwd (secure authentication using only a password)
-CONFIG_EAP_PWD=y
-
-# EAP-PAX
-#CONFIG_EAP_PAX=y
-
-# LEAP
-CONFIG_EAP_LEAP=y
-
-# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-CONFIG_EAP_AKA=y
-
-# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
-# This requires CONFIG_EAP_AKA to be enabled, too.
-#CONFIG_EAP_AKA_PRIME=y
-
-# Enable USIM simulator (Milenage) for EAP-AKA
-#CONFIG_USIM_SIMULATOR=y
-
-# EAP-SAKE
-#CONFIG_EAP_SAKE=y
-
-# EAP-GPSK
-#CONFIG_EAP_GPSK=y
-# Include support for optional SHA256 cipher suite in EAP-GPSK
-#CONFIG_EAP_GPSK_SHA256=y
-
-# EAP-TNC and related Trusted Network Connect support (experimental)
-#CONFIG_EAP_TNC=y
-
-# Wi-Fi Protected Setup (WPS)
-CONFIG_WPS=y
-# Enable WSC 2.0 support
-CONFIG_WPS2=y
-# Enable WPS external registrar functionality
-CONFIG_WPS_ER=y
-# Disable credentials for an open network by default when acting as a WPS
-# registrar.
-#CONFIG_WPS_REG_DISABLE_OPEN=y
-# Enable WPS support with NFC config method
-#CONFIG_WPS_NFC=y
-
-# EAP-IKEv2
-#CONFIG_EAP_IKEV2=y
-
-# PKCS#12 (PFX) support (used to read private key and certificate file from
-# a file that usually has extension .p12 or .pfx)
-CONFIG_PKCS12=y
-
-# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
-# engine.
-CONFIG_SMARTCARD=y
-
-# PC/SC interface for smartcards (USIM, GSM SIM)
-# Enable this if EAP-SIM or EAP-AKA is included
-#CONFIG_PCSC=y
-
-# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
-#CONFIG_HT_OVERRIDES=y
-
-# Support VHT overrides (disable VHT, mask MCS rates, etc.)
-#CONFIG_VHT_OVERRIDES=y
-
-# Development testing
-#CONFIG_EAPOL_TEST=y
-
-# Select control interface backend for external programs, e.g, wpa_cli:
-# unix = UNIX domain sockets (default for Linux/*BSD)
-# udp = UDP sockets using localhost (127.0.0.1)
-# named_pipe = Windows Named Pipe (default for Windows)
-# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
-# y = use default (backwards compatibility)
-# If this option is commented out, control interface is not included in the
-# build.
-CONFIG_CTRL_IFACE=y
-
-# Include support for GNU Readline and History Libraries in wpa_cli.
-# When building a wpa_cli binary for distribution, please note that these
-# libraries are licensed under GPL and as such, BSD license may not apply for
-# the resulting binary.
-#CONFIG_READLINE=y
-
-# Include internal line edit mode in wpa_cli. This can be used as a replacement
-# for GNU Readline to provide limited command line editing and history support.
-CONFIG_WPA_CLI_EDIT=y
-
-# Remove debugging code that is printing out debug message to stdout.
-# This can be used to reduce the size of the wpa_supplicant considerably
-# if debugging code is not needed. The size reduction can be around 35%
-# (e.g., 90 kB).
-#CONFIG_NO_STDOUT_DEBUG=y
-
-# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
-# 35-50 kB in code size.
-#CONFIG_NO_WPA=y
-
-# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
-# This option can be used to reduce code size by removing support for
-# converting ASCII passphrases into PSK. If this functionality is removed, the
-# PSK can only be configured as the 64-octet hexstring (e.g., from
-# wpa_passphrase). This saves about 0.5 kB in code size.
-#CONFIG_NO_WPA_PASSPHRASE=y
-
-# Disable scan result processing (ap_mode=1) to save code size by about 1 kB.
-# This can be used if ap_scan=1 mode is never enabled.
-#CONFIG_NO_SCAN_PROCESSING=y
-
-# Select configuration backend:
-# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
-#	path is given on command line, not here; this option is just used to
-#	select the backend that allows configuration files to be used)
-# winreg = Windows registry (see win_example.reg for an example)
-CONFIG_BACKEND=file
-
-# Remove configuration write functionality (i.e., to allow the configuration
-# file to be updated based on runtime configuration changes). The runtime
-# configuration can still be changed, the changes are just not going to be
-# persistent over restarts. This option can be used to reduce code size by
-# about 3.5 kB.
-#CONFIG_NO_CONFIG_WRITE=y
-
-# Remove support for configuration blobs to reduce code size by about 1.5 kB.
-#CONFIG_NO_CONFIG_BLOBS=y
-
-# Select program entry point implementation:
-# main = UNIX/POSIX like main() function (default)
-# main_winsvc = Windows service (read parameters from registry)
-# main_none = Very basic example (development use only)
-#CONFIG_MAIN=main
-
-# Select wrapper for operatins system and C library specific functions
-# unix = UNIX/POSIX like systems (default)
-# win32 = Windows systems
-# none = Empty template
-CONFIG_OS=unix
-
-# Select event loop implementation
-# eloop = select() loop (default)
-# eloop_win = Windows events and WaitForMultipleObject() loop
-CONFIG_ELOOP=eloop
-
-# Should we use poll instead of select? Select is used by default.
-#CONFIG_ELOOP_POLL=y
-
-# Select layer 2 packet implementation
-# linux = Linux packet socket (default)
-# pcap = libpcap/libdnet/WinPcap
-# freebsd = FreeBSD libpcap
-# winpcap = WinPcap with receive thread
-# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
-# none = Empty template
-CONFIG_L2_PACKET=linux
-
-# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
-CONFIG_PEERKEY=y
-
-# IEEE 802.11w (management frame protection), also known as PMF
-# Driver support is also needed for IEEE 802.11w.
-CONFIG_IEEE80211W=y
-
-# Select TLS implementation
-# openssl = OpenSSL (default)
-# gnutls = GnuTLS
-# internal = Internal TLSv1 implementation (experimental)
-# none = Empty template
-#CONFIG_TLS=openssl
-
-# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
-# can be enabled to get a stronger construction of messages when block ciphers
-# are used. It should be noted that some existing TLS v1.0 -based
-# implementation may not be compatible with TLS v1.1 message (ClientHello is
-# sent prior to negotiating which version will be used)
-#CONFIG_TLSV11=y
-
-# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
-# can be enabled to enable use of stronger crypto algorithms. It should be
-# noted that some existing TLS v1.0 -based implementation may not be compatible
-# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
-# will be used)
-#CONFIG_TLSV12=y
-
-# If CONFIG_TLS=internal is used, additional library and include paths are
-# needed for LibTomMath. Alternatively, an integrated, minimal version of
-# LibTomMath can be used. See beginning of libtommath.c for details on benefits
-# and drawbacks of this option.
-#CONFIG_INTERNAL_LIBTOMMATH=y
-#ifndef CONFIG_INTERNAL_LIBTOMMATH
-#LTM_PATH=/usr/src/libtommath-0.39
-#CFLAGS += -I$(LTM_PATH)
-#LIBS += -L$(LTM_PATH)
-#LIBS_p += -L$(LTM_PATH)
-#endif
-# At the cost of about 4 kB of additional binary size, the internal LibTomMath
-# can be configured to include faster routines for exptmod, sqr, and div to
-# speed up DH and RSA calculation considerably
-#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
-
-# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
-# This is only for Windows builds and requires WMI-related header files and
-# WbemUuid.Lib from Platform SDK even when building with MinGW.
-#CONFIG_NDIS_EVENTS_INTEGRATED=y
-#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
-
-# Add support for old DBus control interface
-# (fi.epitest.hostap.WPASupplicant)
-#CONFIG_CTRL_IFACE_DBUS=y
-
-# Add support for new DBus control interface
-# (fi.w1.hostap.wpa_supplicant1)
-#CONFIG_CTRL_IFACE_DBUS_NEW=y
-
-# Add introspection support for new DBus control interface
-#CONFIG_CTRL_IFACE_DBUS_INTRO=y
-
-# Add support for loading EAP methods dynamically as shared libraries.
-# When this option is enabled, each EAP method can be either included
-# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
-# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
-# be loaded in the beginning of the wpa_supplicant configuration file
-# (see load_dynamic_eap parameter in the example file) before being used in
-# the network blocks.
-#
-# Note that some shared parts of EAP methods are included in the main program
-# and in order to be able to use dynamic EAP methods using these parts, the
-# main program must have been build with the EAP method enabled (=y or =dyn).
-# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
-# unless at least one of them was included in the main build to force inclusion
-# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
-# in the main build to be able to load these methods dynamically.
-#
-# Please also note that using dynamic libraries will increase the total binary
-# size. Thus, it may not be the best option for targets that have limited
-# amount of memory/flash.
-#CONFIG_DYNAMIC_EAP_METHODS=y
-
-# IEEE Std 802.11r-2008 (Fast BSS Transition)
-CONFIG_IEEE80211R=y
-
-# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
-#CONFIG_DEBUG_FILE=y
-
-# Send debug messages to syslog instead of stdout
-#CONFIG_DEBUG_SYSLOG=y
-# Set syslog facility for debug messages
-#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
-
-# Add support for sending all debug messages (regardless of debug verbosity)
-# to the Linux kernel tracing facility. This helps debug the entire stack by
-# making it easy to record everything happening from the driver up into the
-# same file, e.g., using trace-cmd.
-#CONFIG_DEBUG_LINUX_TRACING=y
-
-# Add support for writing debug log to Android logcat instead of standard
-# output
-CONFIG_ANDROID_LOG=y
-
-# Enable privilege separation (see README 'Privilege separation' for details)
-#CONFIG_PRIVSEP=y
-
-# Enable mitigation against certain attacks against TKIP by delaying Michael
-# MIC error reports by a random amount of time between 0 and 60 seconds
-#CONFIG_DELAYED_MIC_ERROR_REPORT=y
-
-# Enable tracing code for developer debugging
-# This tracks use of memory allocations and other registrations and reports
-# incorrect use with a backtrace of call (or allocation) location.
-#CONFIG_WPA_TRACE=y
-# For BSD, uncomment these.
-#LIBS += -lexecinfo
-#LIBS_p += -lexecinfo
-#LIBS_c += -lexecinfo
-
-# Use libbfd to get more details for developer debugging
-# This enables use of libbfd to get more detailed symbols for the backtraces
-# generated by CONFIG_WPA_TRACE=y.
-#CONFIG_WPA_TRACE_BFD=y
-# For BSD, uncomment these.
-#LIBS += -lbfd -liberty -lz
-#LIBS_p += -lbfd -liberty -lz
-#LIBS_c += -lbfd -liberty -lz
-
-# wpa_supplicant depends on strong random number generation being available
-# from the operating system. os_get_random() function is used to fetch random
-# data when needed, e.g., for key generation. On Linux and BSD systems, this
-# works by reading /dev/urandom. It should be noted that the OS entropy pool
-# needs to be properly initialized before wpa_supplicant is started. This is
-# important especially on embedded devices that do not have a hardware random
-# number generator and may by default start up with minimal entropy available
-# for random number generation.
-#
-# As a safety net, wpa_supplicant is by default trying to internally collect
-# additional entropy for generating random data to mix in with the data fetched
-# from the OS. This by itself is not considered to be very strong, but it may
-# help in cases where the system pool is not initialized properly. However, it
-# is very strongly recommended that the system pool is initialized with enough
-# entropy either by using hardware assisted random number generator or by
-# storing state over device reboots.
-#
-# wpa_supplicant can be configured to maintain its own entropy store over
-# restarts to enhance random number generation. This is not perfect, but it is
-# much more secure than using the same sequence of random numbers after every
-# reboot. This can be enabled with -e<entropy file> command line option. The
-# specified file needs to be readable and writable by wpa_supplicant.
-#
-# If the os_get_random() is known to provide strong random data (e.g., on
-# Linux/BSD, the board in question is known to have reliable source of random
-# data from /dev/urandom), the internal wpa_supplicant random pool can be
-# disabled. This will save some in binary size and CPU use. However, this
-# should only be considered for builds that are known to be used on devices
-# that meet the requirements described above.
-#CONFIG_NO_RANDOM_POOL=y
-
-# IEEE 802.11n (High Throughput) support (mainly for AP mode)
-CONFIG_IEEE80211N=y
-
-# Wireless Network Management (IEEE Std 802.11v-2011)
-# Note: This is experimental and not complete implementation.
-CONFIG_WNM=y
-
-# Interworking (IEEE 802.11u)
-# This can be used to enable functionality to improve interworking with
-# external networks (GAS/ANQP to learn more about the networks and network
-# selection based on available credentials).
-CONFIG_INTERWORKING=y
-
-# Hotspot 2.0
-CONFIG_HS20=y
-
-# Disable roaming in wpa_supplicant
-#CONFIG_NO_ROAMING=y
-
-# AP mode operations with wpa_supplicant
-# This can be used for controlling AP mode operations with wpa_supplicant. It
-# should be noted that this is mainly aimed at simple cases like
-# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
-# external RADIUS server can be supported with hostapd.
-CONFIG_AP=y
-
-# P2P (Wi-Fi Direct)
-# This can be used to enable P2P support in wpa_supplicant. See README-P2P for
-# more information on P2P operations.
-CONFIG_P2P=y
-
-# Enable TDLS support
-CONFIG_TDLS=y
-
-# Wi-Fi Direct
-# This can be used to enable Wi-Fi Direct extensions for P2P using an external
-# program to control the additional information exchanges in the messages.
-CONFIG_WIFI_DISPLAY=y
-
-# Autoscan
-# This can be used to enable automatic scan support in wpa_supplicant.
-# See wpa_supplicant.conf for more information on autoscan usage.
-#
-# Enabling directly a module will enable autoscan support.
-# For exponential module:
-#CONFIG_AUTOSCAN_EXPONENTIAL=y
-# For periodic module:
-#CONFIG_AUTOSCAN_PERIODIC=y
-
-# Password (and passphrase, etc.) backend for external storage
-# These optional mechanisms can be used to add support for storing passwords
-# and other secrets in external (to wpa_supplicant) location. This allows, for
-# example, operating system specific key storage to be used
-#
-# External password backend for testing purposes (developer use)
-#CONFIG_EXT_PASSWORD_TEST=y
-
-include $(wildcard $(LOCAL_PATH)/android_config_*.inc)
-
-# bgscan
-NEED_BGSCAN=y
-CONFIG_BGSCAN_LEARN=y
-CONFIG_BGSCAN_SIMPLE=y
-
-CONFIG_DRIVER_NL80211_QCA=y
-CONFIG_EAP_AKA_PRIME=y
-CONFIG_MESH=y
-CONFIG_SAE=y
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
deleted file mode 100755
index 3bdc3069..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-ctrl_interface=/var/run/wpa_supplicant
-update_config=0
-device_name=TI-SITARA-P2P
-device_type=1-0050F204-1
-config_methods=virtual_push_button physical_display keypad
-#p2p_go_intent=0
-country=US
-##p2p_pref_chan=115:36 115:40
-driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
-p2p_go_max_inactivity=60
-p2p_go_ht40=1
-disassoc_low_ack=1
-concurrent_sched_scan=1
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
deleted file mode 100644
index 4f1001e6..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
+++ /dev/null
@@ -1,85 +0,0 @@
-#!/bin/sh
-
-
-WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
-WPA_SUP_PNAME="wpa_supplicant"
-WPA_SUP_PIDFILE="/var/run/wpa_supplicant.$IFACE.pid"
-WPA_SUP_OPTIONS="-B -P $WPA_SUP_PIDFILE -i $IFACE"
-
-VERBOSITY=0
-
-
-if [ -s "$IF_WPA_CONF" ]; then
-	WPA_SUP_CONF="-c $IF_WPA_CONF"
-else
-	exit 0
-fi
-
-if [ ! -x "$WPA_SUP_BIN" ]; then
-
-	if [ "$VERBOSITY" = "1" ]; then
-		echo "$WPA_SUP_PNAME: binaries not executable or missing from $WPA_SUP_BIN"
-	fi
-
-	exit 1
-fi
-
-if [ "$MODE" = "start" ] ; then
-	# driver type of interface, defaults to wext when undefined
-	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
-		IF_WPA_DRIVER=$(cat "/etc/wpa_supplicant/driver.$IFACE")
-	elif [ -z "$IF_WPA_DRIVER" ]; then
-
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: wpa-driver not provided, using \"wext\""
-		fi
-
-		IF_WPA_DRIVER="wext"
-	fi
-
-	# if we have passed the criteria, start wpa_supplicant
-	if [ -n "$WPA_SUP_CONF" ]; then
-
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
-		fi
-
-		start-stop-daemon --start --quiet \
-			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --pidfile $WPA_SUP_PIDFILE \
-			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER
-	fi
-
-	# if the interface socket exists, then wpa_supplicant was invoked successfully
-	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
-
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: ctrl_interface socket located at $WPA_COMMON_CTRL_IFACE/$IFACE"
-		fi
-
-		exit 0
-
-	fi
-
-elif [ "$MODE" = "stop" ]; then
-
-	if [ -f "$WPA_SUP_PIDFILE" ]; then
-
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME daemon"
-		fi
-
-		start-stop-daemon --stop --quiet \
-			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
-
-		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
-			rm -f $WPA_COMMON_CTRL_IFACE/$IFACE
-		fi
-
-		if [ -f "$WPA_SUP_PIDFILE" ]; then
-			rm -f $WPA_SUP_PIDFILE
-		fi
-	fi
-
-fi
-
-exit 0
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
deleted file mode 100644
index 4233eb24..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
+++ /dev/null
@@ -1,65 +0,0 @@
-##### wpa_supplicant configuration file template #####
-#
-# This option can be used to allow wpa_supplicant to overwrite configuration
-# file whenever configuration is changed (e.g., new network block is added with
-# wpa_cli or wpa_gui, or a password is changed). This is required for
-# wpa_cli/wpa_gui to be able to store the configuration changes permanently.
-# Please note that overwriting configuration file will remove the comments from
-# it.
-update_config=1
-ctrl_interface=/var/run/wpa_supplicant
-# IEEE 802.1X/EAPOL version
-# wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defines
-# EAPOL version 2. However, there are many APs that do not handle the new
-# version number correctly (they seem to drop the frames completely). In order
-# to make wpa_supplicant interoperate with these APs, the version number is set
-# to 1 by default. This configuration value can be used to set it to the new
-# version (2).
-eapol_version=1
-# AP scanning/selection
-# By default, wpa_supplicant requests driver to perform AP scanning and then
-# uses the scan results to select a suitable AP. Another alternative is to
-# allow the driver to take care of AP scanning and selection and use
-# wpa_supplicant just to process EAPOL frames based on IEEE 802.11 association
-# information from the driver.
-# 1: wpa_supplicant initiates scanning and AP selection; if no APs matching to
-#    the currently enabled networks are found, a new network (IBSS or AP mode
-#    operation) may be initialized (if configured) (default)
-# 0: driver takes care of scanning, AP selection, and IEEE 802.11 association
-#    parameters (e.g., WPA IE generation); this mode can also be used with
-#    non-WPA drivers when using IEEE 802.1X mode; do not try to associate with
-#    APs (i.e., external program needs to control association). This mode must
-#    also be used when using wired Ethernet drivers.
-# 2: like 0, but associate with APs using security policy and SSID (but not
-#    BSSID); this can be used, e.g., with ndiswrapper and NDIS drivers to
-#    enable operation with hidden SSIDs and optimized roaming; in this mode,
-#    the network blocks in the configuration file are tried one by one until
-#    the driver reports successful association; each network block should have
-#    explicit security policy (i.e., only one option in the lists) for
-#    key_mgmt, pairwise, group, proto variables
-# When using IBSS or AP mode, ap_scan=2 mode can force the new network to be
-# created immediately regardless of scan results. ap_scan=1 mode will first try
-# to scan for existing networks and only if no matches with the enabled
-# networks are found, a new IBSS or AP mode network is created.
-ap_scan=1
-# EAP fast re-authentication
-# By default, fast re-authentication is enabled for all EAP methods that
-# support it. This variable can be used to disable fast re-authentication.
-# Normally, there is no need to disable this.
-fast_reauth=1
-device_name=Blaze
-manufacturer=TI
-model_name=Wilink
-model_number=wl18xx
-serial_number=12345
-driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
-# Timeout in seconds to detect STA inactivity (default: 300 seconds)
-#
-# This timeout value is used in P2P GO mode to clean up
-# inactive stations.
-p2p_go_max_inactivity=60
-p2p_go_ht40=1
-disassoc_low_ack=1
-concurrent_sched_scan=1
-p2p_disabled=1
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
deleted file mode 100644
index c91ffe0c..00000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
+++ /dev/null
@@ -1,7 +0,0 @@
-ctrl_interface=/var/run/wpa_supplicant
-ctrl_interface_group=0
-update_config=1
-
-network={
-        key_mgmt=NONE
-}
-- 
2.17.1


