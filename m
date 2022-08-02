Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75674C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 16:40:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8659.1659458401128593818
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 09:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 799A540C4E;
	Tue,  2 Aug 2022 16:40:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY6aypNWCbHn; Tue,  2 Aug 2022 16:40:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47DC740C46;
	Tue,  2 Aug 2022 16:39:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 611B91749C3; Tue,  2 Aug 2022 12:39:56 -0400 (EDT)
Date: Tue, 2 Aug 2022 12:39:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH 1/3] ti-crypto-examples:
 Remove ti-crypto-examples
Message-ID: <20220802163956.GC18692@denix.org>
References: <20220711164933.21445-1-afd@ti.com>
 <651d556e-b1ac-0de9-415b-6667b4583415@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651d556e-b1ac-0de9-415b-6667b4583415@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Aug 2022 16:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13973

I'm guessing Ryan is waiting on me to pick it up to my kirkstone/master update 
queue - sorry, it's been a bit delayed, I'm working on it now.


On Tue, Aug 02, 2022 at 08:02:47AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> ping?
> 
> On 7/11/22 11:49 AM, Andrew Davis wrote:
> >These examples have not been updated in a long time and are arguably not
> >correct anymore. Remove this.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../conf/distro/include/arago-source-ipk.inc  |  3 --
> >  .../packagegroup-arago-tisdk-crypto.bb        |  1 -
> >  .../Makefile_ti-crypto-examples               | 24 ---------------
> >  .../ti-tisdk-makefile_1.0.bb                  |  3 --
> >  .../ti-crypto-examples_git.bb                 | 30 -------------------
> >  5 files changed, 61 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> >  delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> >
> >diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >index c03d5383..75355710 100644
> >--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >@@ -46,9 +46,6 @@ SRCIPK_INSTALL_DIR:pn-ti-tisdk-licenses ?= "docs/licenses"
> >  CREATE_SRCIPK:pn-matrix-gui ?= "1"
> >  SRCIPK_INSTALL_DIR:pn-matrix-gui ?= "example-applications/${PN}-${PV}"
> >-CREATE_SRCIPK:pn-ti-crypto-examples ?= "1"
> >-SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?= "example-applications/${PN}-${PV}"
> >-
> >  CREATE_SRCIPK:pn-qml-carinfo ?= "1"
> >  SRCIPK_INSTALL_DIR:pn-qml-carinfo ?= "example-applications/${PN}-${PV}"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> >index f217f7d8..d2189a50 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> >@@ -13,7 +13,6 @@ CRYPTO_SUPPORT = "\
> >      openssl-engines \
> >  "
> >-#ti-crypto-examples
> >  CRYPTO_SUPPORT:append:ti33x = " cryptodev-module cryptodev-tests"
> >  CRYPTO_SUPPORT:append:ti43x = " cryptodev-module cryptodev-tests"
> >  CRYPTO_SUPPORT:append:dra7xx = " cryptodev-module cryptodev-tests"
> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> >deleted file mode 100644
> >index 6ad07e9a..00000000
> >--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
> >+++ /dev/null
> >@@ -1,24 +0,0 @@
> >-# ti-crypto-examples build targets
> >-ti-crypto-examples:
> >-	@echo =================================
> >-	@echo    Building TI Crypto Examples
> >-	@echo =================================
> >-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make release
> >-
> >-ti-crypto-examples_clean:
> >-	@echo =================================
> >-	@echo    Cleaning TI Crypto Examples
> >-	@echo =================================
> >-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make clean
> >-
> >-ti-crypto-examples_install:
> >-	@echo ===================================================
> >-	@echo   Installing TI Crypto Examples - Release version
> >-	@echo ===================================================
> >-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install
> >-
> >-ti-crypto-examples_install_debug:
> >-	@echo =================================================
> >-	@echo   Installing TI Crypto Examples - Debug Version
> >-	@echo =================================================
> >-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install_debug
> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> >index 85b99bf2..6737d7fd 100644
> >--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> >@@ -18,7 +18,6 @@ SRC_URI = "\
> >      file://Makefile_u-boot-legacy \
> >      file://Makefile_matrix-gui \
> >      file://Makefile_arm-benchmarks \
> >-    file://Makefile_ti-crypto-examples \
> >      file://Makefile_am-sysinfo \
> >      file://Makefile_av-examples \
> >      file://Makefile_u-boot-spl \
> >@@ -76,7 +75,6 @@ MAKEFILES = ""
> >  # Add device specific make targets
> >  MAKEFILES:append:ti33x = " u-boot-spl \
> >-                           ti-crypto-examples \
> >                             linux-dtbs \
> >                             cryptodev \
> >                             ti-sgx-ddk-km \
> >@@ -86,7 +84,6 @@ MAKEFILES:append:ti33x = " u-boot-spl \
> >                             pdm-anomaly-detection \
> >  "
> >  MAKEFILES:append:ti43x = " u-boot-spl \
> >-                           ti-crypto-examples \
> >                             linux-dtbs \
> >                             cryptodev \
> >                             dual-camera-demo \
> >diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> >deleted file mode 100644
> >index 943a1b2b..00000000
> >--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
> >+++ /dev/null
> >@@ -1,30 +0,0 @@
> >-DESCRIPTION = "TI Cryptography Example Applications"
> >-HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
> >-LICENSE = "BSD-3-Clause"
> >-LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
> >-SECTION = "console"
> >-DEPENDS += "openssl"
> >-
> >-PR = "r7"
> >-
> >-BRANCH ?= "master"
> >-SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
> >-
> >-SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
> >-
> >-S = "${WORKDIR}/git"
> >-
> >-do_compile() {
> >-    export CROSS_COMPILE=${TARGET_PREFIX}
> >-    export CFLAGS='${TARGET_CC_ARCH}'
> >-    # build the release version
> >-    oe_runmake release
> >-}
> >-
> >-do_install() {
> >-    oe_runmake DESTDIR=${D} install
> >-}
> >-
> >-python () {
> >-    raise bb.parse.SkipRecipe("skipping ti-crypto-examples")
> >-}

