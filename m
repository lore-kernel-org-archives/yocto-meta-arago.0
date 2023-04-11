Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51246C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 18:00:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21598.1681236018919124506
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 11:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MzZcA6VO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BI0H27069810;
	Tue, 11 Apr 2023 13:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681236017;
	bh=2HEJp3FG1R0N59bvaoctSPHKr4loE/t0TRkgqukj0vE=;
	h=From:To:CC:Subject:Date;
	b=MzZcA6VOOfQNn5wVd37y+lDIsDASoMiyqj7u0TblvmdE3ofYAIohx3BgnIbAUm49q
	 HecxjLUy5pBV3XEwW/Aca/soDaR7Jcb/cvl2kx37pRyWwwWNpb6ZRVuAZ9khlI9z02
	 DB7I9s5V783o/BEnfPzMHM7/CV/0fL/ryZo75Qks=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BI0HnT118396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 13:00:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 13:00:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 13:00:16 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BI0G4h099198;
	Tue, 11 Apr 2023 13:00:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] branding: Remove old AM/GL/MC SDKs
Date: Tue, 11 Apr 2023 13:00:16 -0500
Message-ID: <20230411180016.14341-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Apr 2023 18:00:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14305

These have not been used nor updated in a long time. They point
to old and/or non-existent versions of packages. Drop them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/branding-amsdk.inc    | 31 -------------------
 .../conf/distro/include/branding-glsdk.inc    | 11 -------
 .../conf/distro/include/branding-mcsdk.inc    | 18 -----------
 3 files changed, 60 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/branding-amsdk.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/branding-glsdk.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/branding-mcsdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
deleted file mode 100644
index 96df5660..00000000
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-ARAGO_TISDK_IMAGE = "arago-amsdk-image"
-
-PREFERRED_PROVIDER_virtual/kernel:am335x-evm = "sitara-linux-ti-staging"
-PREFERRED_PROVIDER_virtual/kernel:am437x-evm = "sitara-linux-ti-staging"
-PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
-
-# To create newlines in the message \n is used and the slash must be escaped
-# to function properly
-
-SRCIPK_GIT_COMMIT_MESSAGE = "\
-Create local branch\\n\
-\\n\
-The below commit is used for this local branch and is the one used by\\n\
-this sdk:\\n\
-${SRCREV}."
-
-SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
-To reduce the size of the SDK installer only a portion of the git commit\\n\
-history has been preserved. Also links to remote branches and tags do\\n\
-not exist in this copy of the repository.\\n\
-To fix this please run the unshallow-repositories.sh\\n\
-script located in the sdk\'s bin directory\\n\
-\\n\
-The script may take several minutes but you will then have a full copy of\\n\
-the git repository including its entire git history.\\n"
-
-SRCIPK_CUSTOM_GIT_BRANCH:pn-sitara-linux-ti-staging = "amsdk-8.0"
-SRCIPK_CUSTOM_GIT_MESSAGE:pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
-
-SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging = "amsdk-8.0"
-SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
deleted file mode 100644
index 0abd73cc..00000000
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-# GLSDK branding configuration
-
-# Use the SDK supported kernel and kernel version
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
-
-PREFERRED_PROVIDER_virtual/bootloader:omap-a15 = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot:omap-a15 = "u-boot-ti-staging"
-
-# Set the PREFERRED_VERSION of libdrm to the glsdk version for the 
-# glsdk branded builds
-PREFERRED_VERSION_libdrm = "2.4.41"
diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
deleted file mode 100644
index 7dbffd3a..00000000
--- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-# MCSDK branding configuration
-
-# Use the MCSDK supported versions
-PREFERRED_VERSION_libnl = "3.2.24"
-
-DISTRO_FEATURES += "x11"
-
-# Java preferences.
-PREFERRED_VERSION_icedtea7-native = "2.1.3"
-PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
-
-PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
-
-PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
-PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
-
-PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
-PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "glibc-locale"
-- 
2.39.2


