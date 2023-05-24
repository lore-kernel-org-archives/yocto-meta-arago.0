Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876E1C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 10:01:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4992.1684922500285212227
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 03:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sZGvvA7m;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OA1aT8038388;
	Wed, 24 May 2023 05:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684922496;
	bh=o+ZlYSUttndoJRS4ylFVhz0T/lOp2I2BhWPjquEbE+I=;
	h=From:To:CC:Subject:Date;
	b=sZGvvA7mSoLkrF+V2xt7ALy1+DobhadXrOpNtFk4mJ3OgV61PiYYYcEqxcylsMZdH
	 8eRviRe89fWDDbokbgXDfQKN7o7cpMc9XEbAQ+z+iEQ7SnviGGdj9nGxY22/RMjH83
	 Xs3kXt+8dyvoyBbxhCIgD20I6rpSIJE1wgKAJakY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OA1aTP085548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 05:01:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 05:01:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 05:01:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OA1Z2a025224;
	Wed, 24 May 2023 05:01:35 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Randolph Sapp <rs@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][kirkstone][PATCH] ti-tisdk-setup: Remove ti-tisdk-setup from meta-arago
Date: Wed, 24 May 2023 15:31:32 +0530
Message-ID: <20230524100132.15149-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 10:01:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14458

- meta-arago is everthing related to Arago filesystem and ti-tisdk-setup is
used to package all the scripts inside the SDK installer. Hence, remove
it from meta-arago and continue maintaining it in meta-processor-sdk for
SDK deliverables.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  1 -
 .../ti-tisdk-setup/ti-tisdk-setup.bb          | 59 -------------------
 2 files changed, 60 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 1a43d0ef..684af088 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -12,7 +12,6 @@ EXTRA_FILES:omap-a15 = "tisdk-readme tisdk-uenv"
 EXTRA_FILES:k3 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS:${PN} = "\
-    ti-tisdk-setup \
     ${EXTRA_FILES} \
     tisdk-install \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
deleted file mode 100644
index e000e8c7..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-DESCRIPTION = "Package containing scripts to setup the development host and target board"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
-
-PR = "r47"
-
-BRANCH ?= "master"
-SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
-SRC_URI = "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SDCARD_SCRIPT = " create-sdcard.sh"
-
-SETUP_SCRIPTS = " common.sh \
-                  setup-host-check.sh \
-                  setup-minicom.sh \
-                  setup-package-install.sh \
-                  setup-targetfs-nfs.sh \
-                  setup-tftp.sh \
-                  add-to-group.sh \
-                  create-ubifs.sh \
-                  ${SDCARD_SCRIPT} \
-"
-
-UBOOT_ENV:omapl138 = "setup-uboot-env-am18x.sh"
-UBOOT_ENV:ti33x = "setup-uboot-env-am335x.sh"
-UBOOT_ENV:ti43x = "setup-uboot-env-am43x.sh"
-UBOOT_ENV:omap5-evm = "setup-uboot-env-omap5.sh"
-UBOOT_ENV:am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
-UBOOT_ENV:k3 = "setup-uboot-env-am65x.sh"
-UBOOT_ENV = "setup-uboot-unknown.sh"
-
-do_install () {
-    install -m 0755 ${S}/setup.sh ${D}/
-
-    install -d ${D}/bin
-    for script in ${SETUP_SCRIPTS}
-    do
-        install -m 0755 ${S}/${script} ${D}/bin
-    done
-
-    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
-
-    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
-    then
-        # UBIFS not supported
-        rm "${D}/bin/create-ubifs.sh"
-    else
-        sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
-               -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
-                  "${D}/bin/create-ubifs.sh"
-    fi
-}
-
-FILES:${PN} += "setup.sh"
-RDEPENDS:${PN} += "bash"
-- 
2.17.1


