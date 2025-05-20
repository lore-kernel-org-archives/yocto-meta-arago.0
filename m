Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CEBC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 12:52:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.18561.1747741071385899866
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 May 2025 04:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JLHDtKHd;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: s-sinha@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54KBboIx1210570
	for <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 06:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747741070;
	bh=vjSqMUZ4jUyqtgZkowrx8ZWHwwroEYCbeZU+SpDUwxY=;
	h=From:To:CC:Subject:Date;
	b=JLHDtKHd+Ze2KtCU5MbHsxXRGRT6fwrxujrJJYga0CH0dCsplqxSJOe6qTIMoQTV4
	 0Q/qT3Me6OGx7GPT76D5VgNHFXkbSpqEp+3W4PvGpSaoO0TvHWUFGtfnqM6Csi6g3g
	 DGrfuLGUzJDLUNj3RB+dQ45v1ywLrL7HVgGizfOU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54KBborj2009159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 06:37:50 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 06:37:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 06:37:50 -0500
Received: from localhost (robotics.dhcp.ti.com [10.24.69.145])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54KBbnra072604;
	Tue, 20 May 2025 06:37:49 -0500
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.0 release config
Date: Tue, 20 May 2025 17:07:36 +0530
Message-ID: <20250520113736.1324020-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 12:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16229

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 ...rocessor-sdk-analytics-11.00.00-config.txt | 17 +++++
 ...rocessor-sdk-analytics-11.00.00-config.xml | 70 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.txt
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.txt
new file mode 100644
index 0000000..976047c
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,c04e85dd207dd24387edac10526b9ec971df9496,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,fce7cf8c3aa54b3650a30a79dce705838c32f3c3,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,9e040ee8dd6025558ea60ac9db60c41bfeddf221,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,e92d0173a80ea7592c866618ef5293203c50544c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a98a2e1029870b25e117d4c9410e75bfd955f35a,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,8e0f8af90fefb03f08cd2228cde7a89902a6b37c,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,eaa08939eaec9f620b14742ff3ac568553683034,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,b214cc84a922f7a3fb7ebbc501189ce25e8bd2bd,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,1f96dccc01f10c73295e0bac6a15a97d3d4562fd,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,81d1b80b2a314814c6d900e82ea2da93eee3f57d,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml
new file mode 100644
index 0000000..23b1a1e
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.xml
@@ -0,0 +1,70 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.00.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='696c2c1ef095f8b11c7d2eff36fae50f58c62e5e'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='c04e85dd207dd24387edac10526b9ec971df9496'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='fce7cf8c3aa54b3650a30a79dce705838c32f3c3'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='9e040ee8dd6025558ea60ac9db60c41bfeddf221'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='e92d0173a80ea7592c866618ef5293203c50544c'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='a98a2e1029870b25e117d4c9410e75bfd955f35a'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='8e0f8af90fefb03f08cd2228cde7a89902a6b37c'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='eaa08939eaec9f620b14742ff3ac568553683034'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='b214cc84a922f7a3fb7ebbc501189ce25e8bd2bd'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='1f96dccc01f10c73295e0bac6a15a97d3d4562fd'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='81d1b80b2a314814c6d900e82ea2da93eee3f57d'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


