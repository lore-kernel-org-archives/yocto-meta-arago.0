Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590F1C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 12:35:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.5719.1658406941161460841
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 05:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MBVQEjRw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26LCZd5k067316;
	Thu, 21 Jul 2022 07:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658406939;
	bh=Y2j66PuFIiYtQtl/XGEq0B2+esq4tSPiPqqEL5paKPE=;
	h=From:To:Subject:Date;
	b=MBVQEjRwdb6BelpfO+OgpvwegoIUD6KGwYfsLokBB/9KyBefTaCTYSAn0EpRac4S2
	 4k+jipE0JiHEhQmtOJOUnDzrdvRJqzqJBSqoKGg1Ds1/eI2llcvqZlwvTokB9563FE
	 6xofV9SqJyid5WTwWXS3nPnLzkYccqfsHpdsmQHs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26LCZdKv118076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Jul 2022 07:35:39 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 07:35:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 07:35:39 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26LCZd9M030764;
	Thu, 21 Jul 2022 07:35:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oEVP1-0006HN-8o; Thu, 21 Jul 2022 07:35:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v2] all: Remove reference to
 arago-project.org
Date: Thu, 21 Jul 2022 07:35:39 -0500
Message-ID: <20220721123539.24097-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Jul 2022 12:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13960

arago-project.org is being shut down in August.  This
commit changes the last recipes that point to that
old site to point to git.ti.com, or just rmeove the
reference entirely.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Changed dir name for k2-fw-initrd files and removed uneeded line per
feedback.

 meta-arago-distro/README                        |   2 +-
 meta-arago-distro/classes/tisdk-bundle.bbclass  |   2 +-
 meta-arago-distro/conf/distro/arago.conf        |   2 --
 .../k2-fw-initrd/k2-initramfs-0.0.7.tar.gz      | Bin 0 -> 49660 bytes
 .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb          |   2 +-
 .../recipes-core/base-files/base-files/issue    |   2 +-
 .../base-files/base-files/issue.net             |   2 +-
 .../feed-config/arago-feed-config_1.0.bb        |   2 +-
 .../oe-layersetup/oe-layersetup.bb              |   2 +-
 .../ti-crypto-examples_git.bb                   |   4 ++--
 .../ltp-ddt/ltp-ddt_20210524.bb                 |   2 +-
 .../recipes-support/ipsecmgr/ipsecmgr.inc       |   2 +-
 .../libnl-xfrm/libnl-xfrm_git.bb                |   2 +-
 13 files changed, 12 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd/k2-initramfs-0.0.7.tar.gz

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index eba955f4..a40e142e 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -26,7 +26,7 @@ URI: https://github.com/meta-qt5/meta-qt5
 branch: dunfell
 revision: HEAD
 
-URI: git://arago-project.org/git/meta-arago
+URI: git://git.yoctoproject.org/meta-arago
 branch: dunfell
 revision: HEAD
 layers: meta-arago-extras
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 9e961e1b..efdb96fc 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -641,7 +641,7 @@ EOF
 
         if [ "$extra_files" == "1" ]
         then
-            source="$source"" <br>Files from:<br><a href=git://arago-project.org/git/meta-arago.git>git://arago-project.org/git/meta-arago.git</a><br><a href=git://arago-project.org/git/meta-ti.git>git://arago-project.org/git/meta-ti.git</a>"
+            source="$source"" <br>Files from:<br><a href=https://git.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><br><a href=https://git.yoctoproject.org/meta-ti>https://git.yoctoproject.org/meta-ti</a>"
         fi
 
         case "$package" in
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 61ae3c83..5fca73ba 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -10,8 +10,6 @@ OPKG_ARGS_remove = "--prefer-arch-to-version"
 
 TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
 MIRRORS += " \
-ftp://.*/.*       http://arago-project.org/files/sources/ \n \
-https?$://.*/.*   http://arago-project.org/files/sources/ \n \
 bzr://.*/.*      ${TI_MIRROR} \n \
 cvs://.*/.*      ${TI_MIRROR} \n \
 git://.*/.*      ${TI_MIRROR} \n \
diff --git a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd/k2-initramfs-0.0.7.tar.gz b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd/k2-initramfs-0.0.7.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..e5a019980925e525ecb58aba385a887460886003
GIT binary patch
literal 49660
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
KNmr}@@Bjb@fTnQ(

literal 0
KcmV+b0RR6000031

diff --git a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
index b9eb57fe..d1794698 100644
--- a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
+++ b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://arago-project.org/files/releases/k2-fw/k2-initramfs-${PV}.tar.gz"
+SRC_URI = "file://k2-initramfs-0.0.7.tar.gz"
 
 SRC_URI[md5sum] = "27fb248cbfe08ed8344bdc4451067c8f"
 SRC_URI[sha256sum] = "beb19d685ee0d20281266726e4c2ba4b245af9450c1bd5155ff06d8c1656dd26"
diff --git a/meta-arago-distro/recipes-core/base-files/base-files/issue b/meta-arago-distro/recipes-core/base-files/base-files/issue
index 4f22fd99..53d4b7d4 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/issue
+++ b/meta-arago-distro/recipes-core/base-files/base-files/issue
@@ -4,5 +4,5 @@
 |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
               |___|                    |___|            
 
-Arago Project http://arago-project.org \n \l
+Arago Project \n \l
 
diff --git a/meta-arago-distro/recipes-core/base-files/base-files/issue.net b/meta-arago-distro/recipes-core/base-files/base-files/issue.net
index 8ce72070..7ff60fd5 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files/issue.net
+++ b/meta-arago-distro/recipes-core/base-files/base-files/issue.net
@@ -4,5 +4,5 @@
 |__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
               |___|                    |___|            
 
-Arago Project http://arago-project.org %h
+Arago Project %h
 
diff --git a/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
index 7bf169b2..1e9fe35b 100644
--- a/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
@@ -7,7 +7,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 FEEDNAMEPREFIX ?= ""
 FEEDURIPREFIX ?= "feeds/"
-DISTRO_FEED_URI ?= "http://arago-project.org"
+DISTRO_FEED_URI ?= ""
 
 do_compile() {
 	mkdir -p ${S}/${sysconfdir}/opkg/
diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index bb1ae139..8472e424 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -8,6 +8,6 @@ inherit allarch
 
 BRANCH ?= "master"
 SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI = "git://arago-project.org/git/projects/oe-layersetup.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project/oe-layersetup.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 3cfa3320..0d4cb7ba 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Cryptography Example Applications"
-HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=summary"
+HOMEPAGE = "https://git.ti.com/cgit/arago-project-org/crypto-example-apps/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
@@ -10,7 +10,7 @@ PR = "r7"
 BRANCH ?= "master"
 SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
 
-SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project-org/crypto-example-apps.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 8a6f6c98..4aa39e06 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -4,7 +4,7 @@ FILESEXTRAPATHS_prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/
 require recipes-extended/ltp/ltp_${PV}.bb
 
 SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
+HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
 
 PROVIDES += "ltp"
 
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index 331f19c2..a3ac5029 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 BRANCH="master"
-SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project-org/ipsecmgr.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "d3ebaa8c80346c8037b5e81c636ab26785ccefaf"
 PV     = "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
index 526ad0ab..cd0fa288 100644
--- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
+++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libnl"
 BRANCH="hawking_dev"
 # The following commit correspond to DEV.LIBNL-XFRM.03.01.00.00A
 SRCREV = "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
-SRC_URI = "git://arago-project.org/git/projects/libnl-xfrm.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project-org/libnl-xfrm.git;protocol=https;branch=${BRANCH}"
 
 PR = "r1"
 
-- 
2.17.1


