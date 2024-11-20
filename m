Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24842D711CF
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:29:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19805.1732123784481193037
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 09:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DWqHHouk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-shenai@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AKHThRf011093;
	Wed, 20 Nov 2024 11:29:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732123783;
	bh=sBQzW1cmcjDO5gQiru4pFOB2/DcTmXdtymHOMHktLcc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DWqHHoukJox9ILyBY5mwjLLgSD1ffcphucB8vDdRk4p7km/yWnjikb40c2Oz+i6Q/
	 tN/5vBfJ+tuewMdPmbCJTXbtoFckwhgHG8IQs3ktG2eoZnopsct1fCwUJII91EvQFh
	 bs4ejchToPa7xZS5RKovvXSR1UZpEn0JIj6xlqOE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKHThD2023264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 11:29:43 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 11:29:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 11:29:43 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKHTV58061708;
	Wed, 20 Nov 2024 11:29:41 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2 1/1] meta-arago: Enable SELinux package
Date: Wed, 20 Nov 2024 22:59:21 +0530
Message-ID: <20241120172921.1881462-2-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120172921.1881462-1-a-shenai@ti.com>
References: <20241120172921.1881462-1-a-shenai@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Nov 2024 17:29:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15621

- This patch allows the building of selinux packages conditional on the
  layer being present via dynamic layers. Only if the meta-selinux layer
  is present, tisdk-default-image recipe will build the packagegroup.

- meta-selinux maintains a list of kernel configs that are needed for
  the kernel to include SELinux. Append these configs from the
  meta-selinux layer into our meta-ti Linux build

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---
 meta-arago-distro/conf/layer.conf                   |  2 ++
 .../images/tisdk-default-image.bbappend             |  3 +++
 .../linux/linux-ti-staging_%.bbappend               | 13 +++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
 create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 00afb5b2..824c5773 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -26,10 +26,12 @@ LAYERDEPENDS_meta-arago-distro = " \
 
 LAYERRECOMMENDS_meta-arago-distro = " \
     chromium-browser-layer \
+    selinux \
 "
 
 BBFILES_DYNAMIC += " \
     chromium-browser-layer:${LAYERDIR}/dynamic-layers/chromium-browser-layer/recipes*/*/*.bbappend \
+    selinux:${LAYERDIR}/dynamic-layers/selinux/recipes*/*/*.bbappend \
 "
 
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
new file mode 100644
index 00000000..9c84bd83
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
@@ -0,0 +1,3 @@
+PR:append = ".selinux0"
+
+IMAGE_INSTALL:append = " packagegroup-core-selinux"
diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..058db4f4
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,13 @@
+# The meta-selinux layer includes an selinux.cfg file containing
+# configs necessary for the Linux kernel to enable SELinux
+
+# In order to reduce maintainability issues, the file will 
+# be retained in meta-selinux layer
+
+require ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'recipes-kernel/linux/linux-yocto_selinux.inc', '', d)} 
+
+do_configure:append() {
+    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
+        cat ${WORKDIR}/selinux.cfg >> ${B}/.config
+    fi
+}
\ No newline at end of file
-- 
2.34.1


