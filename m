Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE58CC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 12:43:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.93687.1701089000057267017
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 04:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LzuZEMya;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARChE8L034298;
	Mon, 27 Nov 2023 06:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701088994;
	bh=v4VL1lEYvkzNFa+hucARZTkiL20Nx2uio8g3kWwKtLw=;
	h=From:To:CC:Subject:Date;
	b=LzuZEMyamiih1IbBFHIqEmEEXizLnq/tXa6e6cjaTK7RW2ETjfKrkEddBbQEZHHLu
	 4BD6s77pFUtahcKIP/Ep2Jcgm6nfFi7AzNhiktBXZ4P2BIJgvCL3fGuRKUL1lQPawu
	 0s7PphJQRfwzSB206HDnh13hu6RvTrDwej6ij/mU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARChE17023585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 06:43:14 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 06:43:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 06:43:14 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARChDhf077069;
	Mon, 27 Nov 2023 06:43:14 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layertool-setup.sh: Add DISPLAY_CLUSTER_ENABLE variable to $confdir/setenv
Date: Mon, 27 Nov 2023 18:13:10 +0530
Message-ID: <20231127124310.3191974-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Nov 2023 12:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15021

- Add DISPLAY_CLUSTER_ENABLE variable to $confdir/setenv which can be used to
optinally build the tisdk-display-cluster-image for AM62P[1].

- Users can set this variable to build tisdk-display-cluster-image for AM62P.

- DISPLAY_CLUSTER_ENABLE is mainly used to pick a different DM Firmware which
is needed for Display Cluster OOB demo[2].

Reference
---------
[1] https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?h=kirkstone&id=9db593ee237d9eda91046b21f1e4456e465fdea0

[2] https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?h=kirkstone&id=09d8b3bea7ca39d8baf412f46b4265ce75a91686

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 oe-layertool-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index c711e78..5f512ef 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -934,9 +934,9 @@ export BUILDDIR="${builddir}"
 EOM
 
     if [ "$BITBAKE_INCLUSIVE_VARS" = "no" ]; then
-        printf 'export %s="%s"\n' 'BB_ENV_EXTRAWHITE' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
+        printf 'export %s="%s"\n' 'BB_ENV_EXTRAWHITE' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE DISPLAY_CLUSTER_ENABLE' >> "$confdir/setenv"
     else
-        printf 'export %s="%s"\n' 'BB_ENV_PASSTHROUGH_ADDITIONS' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
+        printf 'export %s="%s"\n' 'BB_ENV_PASSTHROUGH_ADDITIONS' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE DISPLAY_CLUSTER_ENABLE' >> "$confdir/setenv"
     fi
 }
 
-- 
2.34.1


