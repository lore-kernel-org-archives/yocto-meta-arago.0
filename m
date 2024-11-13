Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86547D637CB
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 21:06:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22741.1731531970516180887
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 13:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oXl+kNfj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL69TB039408;
	Wed, 13 Nov 2024 15:06:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731531969;
	bh=RLz5lzgHb6EpbqE3ta9AJ/SHxPRjI73c83HjGe45vP8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oXl+kNfjSbz1uqEg14Mk0U0A9aZYqWLc2ZTpJ482ff4uGy4v85GBRaQDt/CR7Ef06
	 7g5zeCrT8rr3tjcDmpdGX6yYLhjhrPOmiQ6D/7V5b+i2TKH2Tiz4+6U/TGEaVDk53h
	 oGWV+VyBeNLPXCnuhCHpueH4Bt4q4Hw9JW3FXtFs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL6972105153;
	Wed, 13 Nov 2024 15:06:09 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 15:06:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 15:06:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADL68kq115971;
	Wed, 13 Nov 2024 15:06:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tBKYy-0000lo-Pf; Wed, 13 Nov 2024 15:06:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 3/5] src: Initial conversion from oe-layersetup configs to XML
Date: Wed, 13 Nov 2024 15:06:06 -0600
Message-ID: <20241113210608.2907-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241113210608.2907-1-reatmon@ti.com>
References: <20241113210608.2907-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 21:06:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15605

This is an initial conversion of the current oe-layersetup configs and
templates into the new XML format.  The conversion was limited to
kirkstone, scarthgap and master config files.  Anything older than that
will still be available as oe-layersetup configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-kirkstone-chromium-config.xml       |  67 +++++++
 src/configs/arago-kirkstone-config.xml        |  67 +++++++
 src/configs/arago-kirkstone-next-config.xml   |  77 ++++++++
 src/configs/arago-kirkstone-wip-config.xml    |  67 +++++++
 src/configs/arago-master-chromium-config.xml  |  68 +++++++
 src/configs/arago-master-config.xml           |  68 +++++++
 src/configs/arago-master-next-config.xml      |  73 ++++++++
 src/configs/arago-master-wip-config.xml       |  68 +++++++
 .../arago-scarthgap-chromium-config.xml       |  68 +++++++
 src/configs/arago-scarthgap-config.xml        |  68 +++++++
 src/configs/arago-scarthgap-next-config.xml   |  90 +++++++++
 src/configs/arago-scarthgap-wip-config.xml    |  68 +++++++
 .../coresdk/coresdk-09.00.00.006-config.xml   |  61 ++++++
 .../coresdk/coresdk-09.00.00.007-config.xml   |  61 ++++++
 .../coresdk/coresdk-09.00.00.011-config.xml   |  64 +++++++
 .../coresdk/coresdk-09.01.00.001-config.xml   |  65 +++++++
 .../coresdk/coresdk-09.01.00.003-config.xml   |  65 +++++++
 .../coresdk/coresdk-09.01.00.007-config.xml   |  65 +++++++
 .../coresdk/coresdk-09.01.00.008-config.xml   |  65 +++++++
 .../coresdk/coresdk-09.02.00.008-config.xml   |  67 +++++++
 .../coresdk/coresdk-09.02.00.009-config.xml   |  67 +++++++
 .../coresdk/coresdk-09.02.00.010-config.xml   |  67 +++++++
 .../coresdk/coresdk-10.00.07-config.xml       |  68 +++++++
 src/configs/distroless-kirkstone-config.xml   |  35 ++++
 src/configs/distroless-master-config.xml      |  35 ++++
 src/configs/distroless-scarthgap-config.xml   |  35 ++++
 src/configs/poky-kirkstone-config.xml         |  51 +++++
 src/configs/poky-master-config.xml            |  51 +++++
 src/configs/poky-master-wip-config.xml        |  51 +++++
 src/configs/poky-scarthgap-config.xml         |  51 +++++
 ...rocessor-sdk-analytics-09.00.00-config.xml |  64 +++++++
 ...rocessor-sdk-analytics-09.00.01-config.xml |  64 +++++++
 ...rocessor-sdk-analytics-09.01.00-config.xml |  65 +++++++
 ...rocessor-sdk-analytics-09.02.00-config.xml |  65 +++++++
 ...rocessor-sdk-analytics-10.00.00-config.xml |  66 +++++++
 .../processor-sdk-gateway-10_00.xml           |  75 ++++++++
 .../processor-sdk-linux-09_00_00_06.xml       |  72 +++++++
 .../processor-sdk-linux-09_00_00_07.xml       |  71 +++++++
 .../processor-sdk-linux-09_01_00_06.xml       |  73 ++++++++
 .../processor-sdk-linux-09_01_00_07.xml       |  72 +++++++
 .../processor-sdk-linux-09_02_00_04.xml       |  75 ++++++++
 .../processor-sdk-linux-09_02_00_05.xml       |  75 ++++++++
 .../processor-sdk-linux-10_00_07_06.xml       |  76 ++++++++
 .../processor-sdk-linux-10_00_08_06.xml       |  76 ++++++++
 ...rocessor-sdk-09.00.00-am62xxsip-config.xml |  71 +++++++
 .../processor-sdk-09.00.00-config.xml         |  65 +++++++
 .../processor-sdk-09.01.00-am65xx-config.xml  |  63 +++++++
 .../processor-sdk-09.01.00-config.xml         |  72 +++++++
 .../processor-sdk-09.01.00-legacy-config.xml  |  63 +++++++
 ...processor-sdk-09.02.00.08-am64x-config.xml |  66 +++++++
 ...essor-sdk-kirkstone-09.02.01.09-config.xml |  68 +++++++
 ...essor-sdk-kirkstone-09.02.01.10-config.xml |  68 +++++++
 ...-kirkstone-chromium-09.02.01.09-config.xml |  73 ++++++++
 ...-kirkstone-chromium-09.02.01.10-config.xml |  73 ++++++++
 ...essor-sdk-scarthgap-10.00.07.04-config.xml |  66 +++++++
 ...-scarthgap-chromium-10.00.07.04-config.xml |  74 ++++++++
 src/templates/bblayers.conf.xml               |  11 ++
 src/templates/local-arago64-v2.conf.xml       | 177 ++++++++++++++++++
 src/templates/local-poky-v2.conf.xml          | 174 +++++++++++++++++
 src/templates/local-v2.conf.xml               | 167 +++++++++++++++++
 60 files changed, 4213 insertions(+)
 create mode 100644 src/configs/arago-kirkstone-chromium-config.xml
 create mode 100644 src/configs/arago-kirkstone-config.xml
 create mode 100644 src/configs/arago-kirkstone-next-config.xml
 create mode 100644 src/configs/arago-kirkstone-wip-config.xml
 create mode 100644 src/configs/arago-master-chromium-config.xml
 create mode 100644 src/configs/arago-master-config.xml
 create mode 100644 src/configs/arago-master-next-config.xml
 create mode 100644 src/configs/arago-master-wip-config.xml
 create mode 100644 src/configs/arago-scarthgap-chromium-config.xml
 create mode 100644 src/configs/arago-scarthgap-config.xml
 create mode 100644 src/configs/arago-scarthgap-next-config.xml
 create mode 100644 src/configs/arago-scarthgap-wip-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.00.00.006-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.00.00.007-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.00.00.011-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.01.00.001-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.01.00.003-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.01.00.007-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.01.00.008-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.02.00.008-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.02.00.009-config.xml
 create mode 100644 src/configs/coresdk/coresdk-09.02.00.010-config.xml
 create mode 100644 src/configs/coresdk/coresdk-10.00.07-config.xml
 create mode 100644 src/configs/distroless-kirkstone-config.xml
 create mode 100644 src/configs/distroless-master-config.xml
 create mode 100644 src/configs/distroless-scarthgap-config.xml
 create mode 100644 src/configs/poky-kirkstone-config.xml
 create mode 100644 src/configs/poky-master-config.xml
 create mode 100644 src/configs/poky-master-wip-config.xml
 create mode 100644 src/configs/poky-scarthgap-config.xml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
 create mode 100644 src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
 create mode 100644 src/templates/bblayers.conf.xml
 create mode 100644 src/templates/local-arago64-v2.conf.xml
 create mode 100644 src/templates/local-poky-v2.conf.xml
 create mode 100644 src/templates/local-v2.conf.xml

diff --git a/src/configs/arago-kirkstone-chromium-config.xml b/src/configs/arago-kirkstone-chromium-config.xml
new file mode 100644
index 0000000..4ab973c
--- /dev/null
+++ b/src/configs/arago-kirkstone-chromium-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for kirkstone-chromium</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-kirkstone-config.xml b/src/configs/arago-kirkstone-config.xml
new file mode 100644
index 0000000..d568956
--- /dev/null
+++ b/src/configs/arago-kirkstone-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for kirkstone</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-kirkstone-next-config.xml b/src/configs/arago-kirkstone-next-config.xml
new file mode 100644
index 0000000..7d6ffde
--- /dev/null
+++ b/src/configs/arago-kirkstone-next-config.xml
@@ -0,0 +1,77 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for kirkstone-next (CICD)</description>
+
+    <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone-next' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone-next' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"</line>
+        <line>BRANCH:recipe-linux-ti-staging_6.1.bb = "ti-linux-6.1.y-cicd"</line>
+        <line>BRANCH:recipe-linux-ti-staging-rt_6.1.bb = "ti-rt-linux-6.1.y-cicd"</line>
+        <line>BRANCH:recipe-linux-ti-staging-systest_6.1.bb = "ti-linux-6.1.y-cicd"</line>
+        <line>GIT_BRANCH:recipe-ti-k3-secdev_git.bb = "master-next"</line>
+        <line>BRANCH:recipe-u-boot-ti-staging_2023.04.bb = "ti-u-boot-2023.04-next"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-kirkstone-wip-config.xml b/src/configs/arago-kirkstone-wip-config.xml
new file mode 100644
index 0000000..5d672f1
--- /dev/null
+++ b/src/configs/arago-kirkstone-wip-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for kirkstone-wip</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
new file mode 100644
index 0000000..30b33f8
--- /dev/null
+++ b/src/configs/arago-master-chromium-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for master-chromium</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
new file mode 100644
index 0000000..5fb0386
--- /dev/null
+++ b/src/configs/arago-master-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for master</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
new file mode 100644
index 0000000..7b5bb52
--- /dev/null
+++ b/src/configs/arago-master-next-config.xml
@@ -0,0 +1,73 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for master-next (CICD)</description>
+
+    <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master-next' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-next' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-master-wip-config.xml
new file mode 100644
index 0000000..8b92ec3
--- /dev/null
+++ b/src/configs/arago-master-wip-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for master-wip</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
new file mode 100644
index 0000000..13d83c1
--- /dev/null
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for scarthgap-chromium</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
new file mode 100644
index 0000000..abb69aa
--- /dev/null
+++ b/src/configs/arago-scarthgap-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for scarthgap</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
new file mode 100644
index 0000000..e4313a1
--- /dev/null
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -0,0 +1,90 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for scarthgap-next (CICD)</description>
+
+    <xi:include href='../common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap-next' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"</line>
+        <line>BRANCH:recipe-ltp-ddt_20240129.bb = "cicd"</line>
+        <line>BRANCH:recipe-cadence-mhdp-fw_git.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-cnm-wave-fw_git.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-goodix-fw_git.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-linux-ti-staging_6.6.bb = "ti-linux-6.6.y-cicd"</line>
+        <line>BRANCH:recipe-linux-ti-staging-rt_6.6.bb = "ti-rt-linux-6.6.y-cicd"</line>
+        <line>BRANCH:recipe-linux-ti-staging-systest_6.6.bb = "ti-linux-6.6.y-cicd"</line>
+        <line>BRANCH:recipe-prueth-fw_5.6.15.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-pruhsr-fw_2.17.25.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-pruprp-fw_2.17.25.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-prusw-fw_3.2.9.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-ti-dm-fw.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-ti-eth-fw.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-ti-rtos-firmware.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-ti-sci-fw_git.bb = "ti-linux-firmware-next"</line>
+        <line>BRANCH:recipe-u-boot-ti-staging_2024.04.bb = "ti-u-boot-2024.04-next"</line>
+        <line>BRANCH:recipe-vxd-dec-fw_git.bb = "ti-linux-firmware-next"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
new file mode 100644
index 0000000..afea4e9
--- /dev/null
+++ b/src/configs/arago-scarthgap-wip-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>Arago reference distribution for scarthgap-wip</description>
+
+    <xi:include href='../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.00.00.006-config.xml b/src/configs/coresdk/coresdk-09.00.00.006-config.xml
new file mode 100644
index 0000000..fcd933d
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.00.00.006-config.xml
@@ -0,0 +1,61 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.00.00.006</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.006'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.006'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='f20a12ead2d5890e88e7f4ce149a777de47edc48'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.00.00.007-config.xml b/src/configs/coresdk/coresdk-09.00.00.007-config.xml
new file mode 100644
index 0000000..9cf9601
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.00.00.007-config.xml
@@ -0,0 +1,61 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.00.00.007</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='c39bb4ce3b60b73d35c5fb06af012432e70d6b38'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='200c2783b3f8546f561382fff6bd5268680d403a'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.00.00.011-config.xml b/src/configs/coresdk/coresdk-09.00.00.011-config.xml
new file mode 100644
index 0000000..3906414
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.00.00.011-config.xml
@@ -0,0 +1,64 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.00.00.011</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='41b6684489d0261753344956042be2cc4adb0159'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.011'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='31930afca79b74e0c788452d71356c1f045e7979'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.011'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='15e5c625ecf2adfdb8d05a7dae606953420d6db2' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.01.00.001-config.xml b/src/configs/coresdk/coresdk-09.01.00.001-config.xml
new file mode 100644
index 0000000..67ad2fd
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.01.00.001-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.01.00.001</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.001'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.001'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2572b32e729831762790ebfbf930a1140657faea'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.01.00.003-config.xml b/src/configs/coresdk/coresdk-09.01.00.003-config.xml
new file mode 100644
index 0000000..006ed07
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.01.00.003-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.01.00.003</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='6c1ffa9091d0c53a100e8c8c15122d28642034bd'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.003'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='79a6f60dabad9e5b0e041efa91379447ef030482'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.003'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='56503e3e80603de3b69acef2f6d32836bc9e5e5d'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.01.00.007-config.xml b/src/configs/coresdk/coresdk-09.01.00.007-config.xml
new file mode 100644
index 0000000..a0f0872
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.01.00.007-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.01.00.007</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='a7f6c3e67bd9170e93b2b94676e84018faf0df91'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.007'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.007'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='8726ae02d760270f9e7fe7ef5715d8f7553371ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.01.00.008-config.xml b/src/configs/coresdk/coresdk-09.01.00.008-config.xml
new file mode 100644
index 0000000..4278823
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.01.00.008-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.01.00.008</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='a7f6c3e67bd9170e93b2b94676e84018faf0df91'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.008'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.008'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='11da43b58e19583a9bc16044309610cfb2e86469'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.02.00.008-config.xml b/src/configs/coresdk/coresdk-09.02.00.008-config.xml
new file mode 100644
index 0000000..17da7f2
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.02.00.008-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.02.00.008</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.008'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='7902664f89678164b7fc90d421cee74cbec51cdf'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.008'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.02.00.009-config.xml b/src/configs/coresdk/coresdk-09.02.00.009-config.xml
new file mode 100644
index 0000000..2320051
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.02.00.009-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.02.00.009</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='cb2bc17e96552cdfc141d27bd9f4dbd95a872846'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-09.02.00.010-config.xml b/src/configs/coresdk/coresdk-09.02.00.010-config.xml
new file mode 100644
index 0000000..1182413
--- /dev/null
+++ b/src/configs/coresdk/coresdk-09.02.00.010-config.xml
@@ -0,0 +1,67 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v09.02.00.010</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='644ebf220245bdc06e7696ccc90acc97a0dd2566'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='8f0eb65edaf6d280294c33446a9bb073a50b8c14'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='5a6f7925bd2b885955c942573f70a5594f231563'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='260e3adc2bf322f52d81c0642c825088a88bb051'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='8a502301209ef144932ef5071c1a9b738db23270'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/coresdk/coresdk-10.00.07-config.xml b/src/configs/coresdk/coresdk-10.00.07-config.xml
new file mode 100644
index 0000000..f244fd4
--- /dev/null
+++ b/src/configs/coresdk/coresdk-10.00.07-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI CoreSDK v10.00.07</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='6a80f140e387621f62964209a2e07d3bcfb125ce'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='18f939a5fb37528a5415b05077ece383c346a119'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='1b85bbb4cab9658da3cd926c62038b8559c5c64e'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='df21b1563910c80d7e2964971b7c5b79b5186922'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c00a9a8f25b0042b0723a5d20b88e92d473d22bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/distroless-kirkstone-config.xml b/src/configs/distroless-kirkstone-config.xml
new file mode 100644
index 0000000..844571c
--- /dev/null
+++ b/src/configs/distroless-kirkstone-config.xml
@@ -0,0 +1,35 @@
+<?xml version='1.0'?>
+<config>
+    <description>Distroless reference for kirkstone</description>
+
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/distroless-master-config.xml b/src/configs/distroless-master-config.xml
new file mode 100644
index 0000000..11b09c4
--- /dev/null
+++ b/src/configs/distroless-master-config.xml
@@ -0,0 +1,35 @@
+<?xml version='1.0'?>
+<config>
+    <description>Distroless reference for master</description>
+
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/distroless-scarthgap-config.xml b/src/configs/distroless-scarthgap-config.xml
new file mode 100644
index 0000000..5bb6433
--- /dev/null
+++ b/src/configs/distroless-scarthgap-config.xml
@@ -0,0 +1,35 @@
+<?xml version='1.0'?>
+<config>
+    <description>Distroless reference for scarthgap</description>
+
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/poky-kirkstone-config.xml b/src/configs/poky-kirkstone-config.xml
new file mode 100644
index 0000000..6826d19
--- /dev/null
+++ b/src/configs/poky-kirkstone-config.xml
@@ -0,0 +1,51 @@
+<?xml version='1.0'?>
+<config>
+    <description>Poky reference distribution for kirkstone</description>
+
+    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-yocto' url='https://git.yoctoproject.org/meta-yocto' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-poky</layer>
+                <layer>meta-yocto-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-config.xml
new file mode 100644
index 0000000..3baf414
--- /dev/null
+++ b/src/configs/poky-master-config.xml
@@ -0,0 +1,51 @@
+<?xml version='1.0'?>
+<config>
+    <description>Poky reference distribution for master</description>
+
+    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-yocto' url='https://git.yoctoproject.org/meta-yocto' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-poky</layer>
+                <layer>meta-yocto-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-master-wip-config.xml
new file mode 100644
index 0000000..11c0e6a
--- /dev/null
+++ b/src/configs/poky-master-wip-config.xml
@@ -0,0 +1,51 @@
+<?xml version='1.0'?>
+<config>
+    <description>Poky reference distribution for master-wip</description>
+
+    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-yocto' url='https://git.yoctoproject.org/meta-yocto' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-poky</layer>
+                <layer>meta-yocto-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master-wip' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/poky-scarthgap-config.xml b/src/configs/poky-scarthgap-config.xml
new file mode 100644
index 0000000..8f0043d
--- /dev/null
+++ b/src/configs/poky-scarthgap-config.xml
@@ -0,0 +1,51 @@
+<?xml version='1.0'?>
+<config>
+    <description>Poky reference distribution for scarthgap</description>
+
+    <xi:include href='../common/targets_poky.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../templates/local-poky-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='HEAD'/>
+
+    <repos>
+        <repo name='meta-yocto' url='https://git.yoctoproject.org/meta-yocto' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-poky</layer>
+                <layer>meta-yocto-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='HEAD'>
+            <layers>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
new file mode 100644
index 0000000..e1a089e
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.xml
@@ -0,0 +1,64 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v09.00.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='4d7741adb72c626d05b845867c72f157b64d5944'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='474af844b0e808f5401ab0b89e59d1ade39f3d16'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='c39bb4ce3b60b73d35c5fb06af012432e70d6b38'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='cef730284b8616ba07c1b062c992c36af730580e'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-psdkla' url='https://git.ti.com/git/jacinto-linux/meta-psdkla.git' branch='kirkstone' commit='9c754ecda6f1019d0126dd4dc163e0ae01772eb0'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='c0acda7c6920b9f9f3ebccd5c9ce19f52934a51f'>
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
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
new file mode 100644
index 0000000..24f199c
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.xml
@@ -0,0 +1,64 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v09.00.01</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='9c11eab21e7abe564f4c9f0821e830dd7298b365'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='c39bb4ce3b60b73d35c5fb06af012432e70d6b38'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='cef730284b8616ba07c1b062c992c36af730580e'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-psdkla' url='https://git.ti.com/git/jacinto-linux/meta-psdkla.git' branch='kirkstone' commit='9c754ecda6f1019d0126dd4dc163e0ae01772eb0'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='5ad5799ae51dfd335b6dc4a87200fb96e8b86d7e'>
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
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
new file mode 100644
index 0000000..9e77c7b
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v09.01.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='42a1c9fe698a03feb34c5bba223c6e6e0350925b'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='190e2b58fb6c1e3c658fe2f7afc40a2863007bbc'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='402affcc073db39f782c1ebfd718edd5f11eed4c'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='6ad91a192fa1ab33775a22894a413aefd0b67106'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='b77cd331199fa62e3b162f37efca3b927c68d8e5'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='d0a92bc0a53276a3faad16ed52084451f4d1b3bf'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='fa42c52098a72461921dd3fb848ff1271bdb7425'>
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
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
new file mode 100644
index 0000000..de57928
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v09.02.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='98f178314931635c8641d1394dfd4341b86b6be2'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='cb2bc17e96552cdfc141d27bd9f4dbd95a872846'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='8bb16533532b6abc2eded7d9961ab2a108fd7a5b'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='376a2143533c6497b4e79304eccca2a630784436'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='d7b7b6fb6c7c5545e718e44f38853d1718ce5446'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='1b5405955c7c2579ed1f52522e2e177d0281fa33'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='b127f5f2a16fdc092a339939cf04c2fc92f15a34'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='0de8484d01ea85a7c366e6b56b1119613321dddb'>
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
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
new file mode 100644
index 0000000..76674d7
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.xml
@@ -0,0 +1,66 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v10.00.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='54b806b1985f3989722ee308e1073530fe3328c1'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='80e01188fa822d87d301ee71973c462d7a865493'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='ecece16871afe6b674d2aafd27e0f18bbaef1966'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='bf3fe8c01c5cc00ada22049f4f0abb485e2a626f'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='af81e0d81c5efd005bfc0ef749f690f9748c70f6'>
+            <layers/>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='a3b8006957fbc31f8375a5989be7c42b2ba2959b'>
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
diff --git a/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml b/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
new file mode 100644
index 0000000..5b7f9c8
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-gateway-10_00.xml
@@ -0,0 +1,75 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v10_00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='82833bae8835e06301c23c8833642ae4c02d303a'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='6a80f140e387621f62964209a2e07d3bcfb125ce'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='18f939a5fb37528a5415b05077ece383c346a119'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='138077349667614f83637c98798c06249615a23e'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='1b85bbb4cab9658da3cd926c62038b8559c5c64e'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='df21b1563910c80d7e2964971b7c5b79b5186922'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c00a9a8f25b0042b0723a5d20b88e92d473d22bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk' branch='scarthgap' commit='af81e0d81c5efd005bfc0ef749f690f9748c70f6'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
new file mode 100644
index 0000000..4f3091b
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.xml
@@ -0,0 +1,72 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_00_00_06</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='c39bb4ce3b60b73d35c5fb06af012432e70d6b38'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='200c2783b3f8546f561382fff6bd5268680d403a'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-aws' url='https://github.com/aws/meta-aws.git' branch='kirkstone' commit='b72cb364f79aa055242e703e284900b23e61facd'>
+            <layers/>
+        </repo>
+        <repo name='meta-psdkla' url='https://git.ti.com/git/jacinto-linux/meta-psdkla.git' branch='kirkstone' commit='09.00.00.06'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>ARAGO_BRAND = "foundational_sdk"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
new file mode 100644
index 0000000..6692925
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.xml
@@ -0,0 +1,71 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_00_00_07</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='907416ee1062f87f5844ab0638b54616abfc1a22'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.007'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='c39bb4ce3b60b73d35c5fb06af012432e70d6b38'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='200c2783b3f8546f561382fff6bd5268680d403a'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-aws' url='https://github.com/aws/meta-aws.git' branch='kirkstone' commit='b72cb364f79aa055242e703e284900b23e61facd'>
+            <layers/>
+        </repo>
+        <repo name='meta-psdkla' url='https://git.ti.com/git/jacinto-linux/meta-psdkla.git' branch='kirkstone' commit='09.00.00.07'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
new file mode 100644
index 0000000..f8ebadd
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.xml
@@ -0,0 +1,73 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_01_00_06</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='6c1ffa9091d0c53a100e8c8c15122d28642034bd'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.003'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='79a6f60dabad9e5b0e041efa91379447ef030482'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.003'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='56503e3e80603de3b69acef2f6d32836bc9e5e5d'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk' branch='kirkstone' commit='09.01.00.06'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>ARAGO_BRAND = "foundational_sdk"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
new file mode 100644
index 0000000..09700a4
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.xml
@@ -0,0 +1,72 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_01_00_07</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='a7f6c3e67bd9170e93b2b94676e84018faf0df91'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.006'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.006'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='4bb6373e5f4a1330a063d1afe855d6c24d5461e7'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk' branch='kirkstone' commit='09.01.00.07'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
new file mode 100644
index 0000000..8e78543
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.xml
@@ -0,0 +1,75 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_02_00_04</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='d38c98d22ad3f3b29f9cce402202cd95214c58cc'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='7902664f89678164b7fc90d421cee74cbec51cdf'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='2f3de17c1e623d276811d13d3eb11e5734566acd'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk' branch='kirkstone' commit='REL.J7.09.02.00.04'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>ARAGO_BRAND = "foundational_sdk"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
new file mode 100644
index 0000000..7953cb0
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.xml
@@ -0,0 +1,75 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v09_02_00_05</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='98f178314931635c8641d1394dfd4341b86b6be2'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='cb2bc17e96552cdfc141d27bd9f4dbd95a872846'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='376a2143533c6497b4e79304eccca2a630784436'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk' branch='kirkstone' commit='REL.J7.09.02.00.05'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>ARAGO_BRAND = "foundational_sdk"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
new file mode 100644
index 0000000..15e4786
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.xml
@@ -0,0 +1,76 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v10_00_07_06</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='82833bae8835e06301c23c8833642ae4c02d303a'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='6a80f140e387621f62964209a2e07d3bcfb125ce'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='18f939a5fb37528a5415b05077ece383c346a119'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='138077349667614f83637c98798c06249615a23e'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='1b85bbb4cab9658da3cd926c62038b8559c5c64e'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='df21b1563910c80d7e2964971b7c5b79b5186922'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c00a9a8f25b0042b0723a5d20b88e92d473d22bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='af81e0d81c5efd005bfc0ef749f690f9748c70f6'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>DISTROOVERRIDES:append = ":foundational"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
new file mode 100644
index 0000000..03f23ec
--- /dev/null
+++ b/src/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.xml
@@ -0,0 +1,76 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Linux v10_00_08_06</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='54b806b1985f3989722ee308e1073530fe3328c1'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='80e01188fa822d87d301ee71973c462d7a865493'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='ecece16871afe6b674d2aafd27e0f18bbaef1966'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='fe561f41aef0cff9e6f96730ab59f28dca2eb682'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='af81e0d81c5efd005bfc0ef749f690f9748c70f6'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " virtualization"</line>
+        <line>DISTROOVERRIDES:append = ":foundational"</line>
+    </local-conf>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml b/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
new file mode 100644
index 0000000..c3a0a82
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.xml
@@ -0,0 +1,71 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.00.00-am62xxsip</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='41b6684489d0261753344956042be2cc4adb0159'/>
+
+    <repos>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='617ddf642233e7e83a86bb66c5b0edd268b93709'>
+            <layers/>
+        </repo>
+        <repo name='meta-processor-sdk' url='https://git.ti.com/git/processor-sdk/meta-processor-sdk.git' branch='kirkstone' commit='09.00.00.003-AM62SIP'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.011'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='31930afca79b74e0c788452d71356c1f045e7979'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.011'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='15e5c625ecf2adfdb8d05a7dae606953420d6db2' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml b/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
new file mode 100644
index 0000000..7fc7e25
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.00.00-config.xml
@@ -0,0 +1,65 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.00.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='0c6f86b60cfba67c20733516957c0a654eb2b44c'/>
+
+    <repos>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='a1d9091cd914ce0bc69958891628a4cf86ed3e96'>
+            <layers/>
+        </repo>
+        <repo name='meta-processor-sdk' url='https://git.ti.com/git/processor-sdk/meta-processor-sdk.git' branch='kirkstone' commit='9dad5765d33783f940ba3c32f4fc431e2b308621'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.00.00.006'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='bff5bd937f0776166e81a63f3dd39ede348ef758'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='346753705e49a2486867dc150181a1c7f4d69377'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.00.00.006'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='f20a12ead2d5890e88e7f4ce149a777de47edc48'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
new file mode 100644
index 0000000..6286162
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.xml
@@ -0,0 +1,63 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.01.00-am65xx</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='a7f6c3e67bd9170e93b2b94676e84018faf0df91'/>
+
+    <repos>
+        <repo name='meta-processor-sdk' url='https://git.ti.com/git/processor-sdk/meta-processor-sdk.git' branch='kirkstone' commit='09.01.00.007-AM65X'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.007'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.007'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='8726ae02d760270f9e7fe7ef5715d8f7553371ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
new file mode 100644
index 0000000..c57afe8
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-config.xml
@@ -0,0 +1,72 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.01.00</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='a7f6c3e67bd9170e93b2b94676e84018faf0df91'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.01.00.08'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.008'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='5f365ef0f842ba4651efe88787cf9c63bc8b6cb3' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='67b0ef4256a484851f3556d281ca4caa88374388'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.008'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone' commit='59408ccade8843ea051319b6dfb356cc01368063' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='11da43b58e19583a9bc16044309610cfb2e86469'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='87d730d9c1778c7f892b096878f338f36d6877f4'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml b/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
new file mode 100644
index 0000000..ebd448c
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.xml
@@ -0,0 +1,63 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.01.00-legacy</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111'/>
+
+    <repos>
+        <repo name='meta-processor-sdk' url='https://git.ti.com/git/processor-sdk/meta-processor-sdk.git' branch='kirkstone' commit='09.01.00.001'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.01.00.001'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.01.00.001'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2572b32e729831762790ebfbf930a1140657faea'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml b/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
new file mode 100644
index 0000000..6ec86aa
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.xml
@@ -0,0 +1,66 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.02.00.08-am64x</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='2c6183594279e2e9d03f11155ad969448869c863'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.02.00.08'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.001'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='ae8a97f79364bed1abc297636f7933d0e35f22be'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='88327090d26955a678c6f8bd2585aad4d802f6c4'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='402affcc073db39f782c1ebfd718edd5f11eed4c'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.001'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='227b3d4edad31b0d0045f41133271693265240b0'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='02ce7e60b449c72def00f26afc549034cbd82ba9'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
new file mode 100644
index 0000000..4b7d298
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.02.01.09</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.02.01.09'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='cb2bc17e96552cdfc141d27bd9f4dbd95a872846'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='09.02.00.03'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
new file mode 100644
index 0000000..4443130
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.xml
@@ -0,0 +1,68 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v09.02.01.10</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.02.01.10'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='644ebf220245bdc06e7696ccc90acc97a0dd2566'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='8f0eb65edaf6d280294c33446a9bb073a50b8c14'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='5a6f7925bd2b885955c942573f70a5594f231563'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='260e3adc2bf322f52d81c0642c825088a88bb051'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='8a502301209ef144932ef5071c1a9b738db23270'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='fdb683aa69d4d70aca17c2d53be3f900ae9d5e72'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
new file mode 100644
index 0000000..314a511
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.xml
@@ -0,0 +1,73 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vchromium-09.02.01.09</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.02.01.09'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='cb2bc17e96552cdfc141d27bd9f4dbd95a872846'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='fda737ec0cc1d2a5217548a560074a8e4d5ec580'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.009'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='b187fb9232ca0a6b5f8f90b4715958546fc41d73'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='2501534c9581c6c3439f525d630be11554a57d24'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='09.02.00.03'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
new file mode 100644
index 0000000..039ddb1
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.xml
@@ -0,0 +1,73 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vchromium-09.02.01.10</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.0' commit='40fd5f4eef7460ca67f32cfce8e229e67e1ff607'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='kirkstone' commit='09.02.01.10'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='d3d16b47e17dc899e5298cff698dc32e5e639ab4'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='kirkstone' commit='644ebf220245bdc06e7696ccc90acc97a0dd2566'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='kirkstone' commit='8f0eb65edaf6d280294c33446a9bb073a50b8c14'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='kirkstone' commit='5a6f7925bd2b885955c942573f70a5594f231563'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='kirkstone' commit='09.02.00.010'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='kirkstone' commit='260e3adc2bf322f52d81c0642c825088a88bb051'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='kirkstone-clang12' commit='c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='kirkstone' commit='8a502301209ef144932ef5071c1a9b738db23270'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='kirkstone' commit='fdb683aa69d4d70aca17c2d53be3f900ae9d5e72'>
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
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
new file mode 100644
index 0000000..24938c3
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.xml
@@ -0,0 +1,66 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK v10.00.07.04</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='scarthgap' commit='10.00.07.04'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='6a80f140e387621f62964209a2e07d3bcfb125ce'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='18f939a5fb37528a5415b05077ece383c346a119'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='1b85bbb4cab9658da3cd926c62038b8559c5c64e'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='df21b1563910c80d7e2964971b7c5b79b5186922'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c00a9a8f25b0042b0723a5d20b88e92d473d22bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
new file mode 100644
index 0000000..53ecc11
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.xml
@@ -0,0 +1,74 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vchromium-10.00.07.04</description>
+
+    <xi:include href='../../common/targets_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='11d83170922a2c6b9db1f6e8c23e533526984b2c'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='scarthgap' commit='10.00.07.04'>
+            <layers/>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-demos</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt5' url='https://github.com/meta-qt5/meta-qt5.git' branch='scarthgap' commit='eb828418264a49b8d00035cb3d7b12fcea3be801'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='6a80f140e387621f62964209a2e07d3bcfb125ce'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='18f939a5fb37528a5415b05077ece383c346a119'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='10.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='1b85bbb4cab9658da3cd926c62038b8559c5c64e'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='df21b1563910c80d7e2964971b7c5b79b5186922'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c00a9a8f25b0042b0723a5d20b88e92d473d22bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='10.00.00.04'>
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
diff --git a/src/templates/bblayers.conf.xml b/src/templates/bblayers.conf.xml
new file mode 100644
index 0000000..3bf22a0
--- /dev/null
+++ b/src/templates/bblayers.conf.xml
@@ -0,0 +1,11 @@
+<bblayers-conf-template name='bblayers.conf'>
+    <line># This template file was created by taking the oe-core/meta/conf/bblayers.conf</line>
+    <line># file and removing the BBLAYERS section at the end.</line>
+    <line></line>
+    <line># LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf</line>
+    <line># changes incompatibly</line>
+    <line>LCONF_VERSION = "5"</line>
+    <line></line>
+    <line>BBPATH = "${TOPDIR}"</line>
+    <line>BBFILES ?= ""</line>
+</bblayers-conf-template>
diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-arago64-v2.conf.xml
new file mode 100644
index 0000000..70148ff
--- /dev/null
+++ b/src/templates/local-arago64-v2.conf.xml
@@ -0,0 +1,177 @@
+<local-conf-template name='local-arago64-v2.conf'>
+    <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
+    <line>CONF_VERSION = "2"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place downloads</line>
+    <line>#</line>
+    <line># During a first build the system will download many different source code</line>
+    <line># tarballs from various upstream projects. This can take a while, particularly</line>
+    <line># if your network connection is slow. These are all stored in DL_DIR. When</line>
+    <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
+    <line># of subsequent builds. This directory is safe to share between multiple builds</line>
+    <line># on the same machine too.</line>
+    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place shared-state files</line>
+    <line>#</line>
+    <line># BitBake has the capability to accelerate builds based on previously built</line>
+    <line># output. This is done using "shared state" files which can be thought of as</line>
+    <line># cache objects and this option determines where those files are placed.</line>
+    <line>#</line>
+    <line># You can wipe out TMPDIR leaving this directory intact and the build would</line>
+    <line># regenerate from these files if no changes were made to the configuration.</line>
+    <line># If changes were made to the configuration, only shared state files where the</line>
+    <line># state was still valid would be used (done using checksums).</line>
+    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line></line>
+    <line>#</line>
+    <line># Shared-state files from other locations</line>
+    <line>#</line>
+    <line># As mentioned above, shared state files are prebuilt cache data objects which</line>
+    <line># can be used to accelerate build time. This variable can be used to configure</line>
+    <line># the system to search other mirror locations for these objects before it</line>
+    <line># builds the data itself.</line>
+    <line>#</line>
+    <line># This can be a filesystem directory, or a remote url such as http or ftp.</line>
+    <line># These would contain the sstate-cache results from previous builds (possibly</line>
+    <line># from other machines). This variable works like fetcher MIRRORS/PREMIRRORS</line>
+    <line># and points to the cache locations to check for the shared objects.</line>
+    <line>#SSTATE_MIRRORS ?= "\</line>
+    <line>#file://.* http://someserver.tld/share/sstate/ \n \</line>
+    <line>#file://.* file:///some/local/dir/sstate/"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place the build output</line>
+    <line>#</line>
+    <line># This option specifies where the bulk of the building work should be done and</line>
+    <line># where BitBake should place its temporary files and output. Keep in mind that</line>
+    <line># this includes the extraction and compilation of many applications and the toolchain</line>
+    <line># which can use Gigabytes of hard disk space.</line>
+    <line>TMPDIR = "${TOPDIR}/arago-tmp"</line>
+    <line></line>
+    <line># By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be outside</line>
+    <line>#DEPLOY_DIR = "${TOPDIR}/deploy"</line>
+    <line></line>
+    <line>#</line>
+    <line># Machine Selection</line>
+    <line>#</line>
+    <line># You need to select a specific machine to target the build with. There are a selection</line>
+    <line># of emulated machines available which can boot and run in the QEMU emulator:</line>
+    <line>#</line>
+    <line>#MACHINE ?= "arago"</line>
+    <line></line>
+    <line>#</line>
+    <line># Package Management configuration</line>
+    <line>#</line>
+    <line># This variable lists which packaging formats to enable. Multiple package backends </line>
+    <line># can be enabled at once and the first item listed in the variable will be used </line>
+    <line># to generate the root filesystems.</line>
+    <line># Options are:</line>
+    <line>#  - 'package_deb' for debian style deb files</line>
+    <line>#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)</line>
+    <line>#  - 'package_rpm' for rpm style packages</line>
+    <line># E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"</line>
+    <line># We default to ipk:</line>
+    <line>PACKAGE_CLASSES ?= "package_ipk"</line>
+    <line></line>
+    <line>#</line>
+    <line># SDK/ADT target architecture</line>
+    <line>#</line>
+    <line># This variable specified the architecture to build SDK/ADT items for and means</line>
+    <line># you can build the SDK packages for architectures other than the machine you are </line>
+    <line># running the build on (i.e. building i686 packages on an x86_64 host._</line>
+    <line># Supported values are i686 and x86_64</line>
+    <line>SDKMACHINE ?= "x86_64"</line>
+    <line></line>
+    <line>#</line>
+    <line># Extra image configuration defaults</line>
+    <line>#</line>
+    <line># The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated </line>
+    <line># images. Some of these options are added to certain image types automatically. The</line>
+    <line># variable can contain the following options:</line>
+    <line>#  "dbg-pkgs"       - add -dbg packages for all installed packages</line>
+    <line>#                     (adds symbol information for debugging/profiling)</line>
+    <line>#  "dev-pkgs"       - add -dev packages for all installed packages</line>
+    <line>#                     (useful if you want to develop against libs in the image)</line>
+    <line>#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)</line>
+    <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
+    <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
+    <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
+    <line>#  "debug-tweaks"   - make an image suitable for development</line>
+    <line>#                     e.g. ssh root access has a blank password</line>
+    <line># There are other application targets that can be used here too, see</line>
+    <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
+    <line># We default to enabling the debugging tweaks.</line>
+    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line></line>
+    <line>#</line>
+    <line># Additional image features</line>
+    <line>#</line>
+    <line># The following is a list of additional classes to use when building images which</line>
+    <line># enable extra features. Some available options which can be included in this variable </line>
+    <line># are:</line>
+    <line>#   - 'buildstats' collect build statistics</line>
+    <line>#   - 'image-swab' to perform host system intrusion detection</line>
+    <line># NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended</line>
+    <line>USER_CLASSES ?= "buildstats"</line>
+    <line></line>
+    <line># By default disable interactive patch resolution (tasks will just fail instead):</line>
+    <line>PATCHRESOLVE = "noop"</line>
+    <line></line>
+    <line># By default the machine configuration file sets the IMAGE_FSTYPES.  But if you</line>
+    <line># would like to add additional file system types you can uncomment the</line>
+    <line># following line and add the additional IMAGE_FSTYPES you want created</line>
+    <line># as part of the build flow.  Some common types are listed below and you</line>
+    <line># can remove the ones you do not want.</line>
+    <line># IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"</line>
+    <line></line>
+    <line>#</line>
+    <line># Parallelism Options</line>
+    <line>#</line>
+    <line># These two options control how much parallelism BitBake should use. The first </line>
+    <line># option determines how many tasks bitbake should run in parallel:</line>
+    <line>#</line>
+    <line># BB_NUMBER_THREADS ?= "1"</line>
+    <line># </line>
+    <line># The second option controls how many processes make should run in parallel when</line>
+    <line># running compile tasks:</line>
+    <line>#</line>
+    <line># PARALLEL_MAKE ?= "-j 1"</line>
+    <line>#</line>
+    <line># For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would</line>
+    <line># be appropriate for example</line>
+    <line>#</line>
+    <line># NOTE: By default, bitbake will choose the number of processeors on your host</line>
+    <line># so you should not need to set this unless you are wanting to lower the number</line>
+    <line># allowed.</line>
+    <line>#</line>
+    <line></line>
+    <line>DISTRO   = "arago"</line>
+    <line></line>
+    <line># Set terminal types by default it expects gnome-terminal</line>
+    <line># but we chose xterm</line>
+    <line>TERMCMD = "${XTERM_TERMCMD}"</line>
+    <line>TERMCMDRUN = "${XTERM_TERMCMDRUN}"</line>
+    <line></line>
+    <line># Don't generate the mirror tarball for SCM repos, the snapshot is enough</line>
+    <line>BB_GENERATE_MIRROR_TARBALLS = "0"</line>
+    <line></line>
+    <line># Uncomment this to remove work directory after packaging to save disk space</line>
+    <line>#INHERIT += "rm_work"</line>
+    <line></line>
+    <line># Keep one set of images by default</line>
+    <line>RM_OLD_IMAGE = "1"</line>
+    <line></line>
+    <line># Enable local PR service for binary feeds</line>
+    <line>PRSERV_HOST = "localhost:0"</line>
+    <line></line>
+    <line># Enable hash equiv server</line>
+    <line>BB_SIGNATURE_HANDLER = "OEEquivHash"</line>
+    <line>BB_HASHSERVE = "auto"</line>
+    <line></line>
+    <line># It is recommended to activate "buildhistory" for testing the PR service</line>
+    <line>INHERIT += "buildhistory"</line>
+    <line>BUILDHISTORY_COMMIT = "1"</line>
+</local-conf-template>
diff --git a/src/templates/local-poky-v2.conf.xml b/src/templates/local-poky-v2.conf.xml
new file mode 100644
index 0000000..8a7fde1
--- /dev/null
+++ b/src/templates/local-poky-v2.conf.xml
@@ -0,0 +1,174 @@
+<local-conf-template name='local-poky-v2.conf'>
+    <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
+    <line>CONF_VERSION = "2"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place downloads</line>
+    <line>#</line>
+    <line># During a first build the system will download many different source code</line>
+    <line># tarballs from various upstream projects. This can take a while, particularly</line>
+    <line># if your network connection is slow. These are all stored in DL_DIR. When</line>
+    <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
+    <line># of subsequent builds. This directory is safe to share between multiple builds</line>
+    <line># on the same machine too.</line>
+    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place shared-state files</line>
+    <line>#</line>
+    <line># BitBake has the capability to accelerate builds based on previously built</line>
+    <line># output. This is done using "shared state" files which can be thought of as</line>
+    <line># cache objects and this option determines where those files are placed.</line>
+    <line>#</line>
+    <line># You can wipe out TMPDIR leaving this directory intact and the build would</line>
+    <line># regenerate from these files if no changes were made to the configuration.</line>
+    <line># If changes were made to the configuration, only shared state files where the</line>
+    <line># state was still valid would be used (done using checksums).</line>
+    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line></line>
+    <line>#</line>
+    <line># Shared-state files from other locations</line>
+    <line>#</line>
+    <line># As mentioned above, shared state files are prebuilt cache data objects which</line>
+    <line># can be used to accelerate build time. This variable can be used to configure</line>
+    <line># the system to search other mirror locations for these objects before it</line>
+    <line># builds the data itself.</line>
+    <line>#</line>
+    <line># This can be a filesystem directory, or a remote url such as http or ftp.</line>
+    <line># These would contain the sstate-cache results from previous builds (possibly</line>
+    <line># from other machines). This variable works like fetcher MIRRORS/PREMIRRORS</line>
+    <line># and points to the cache locations to check for the shared objects.</line>
+    <line>#SSTATE_MIRRORS ?= "\</line>
+    <line>#file://.* http://someserver.tld/share/sstate/ \n \</line>
+    <line>#file://.* file:///some/local/dir/sstate/"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place the build output</line>
+    <line>#</line>
+    <line># This option specifies where the bulk of the building work should be done and</line>
+    <line># where BitBake should place its temporary files and output. Keep in mind that</line>
+    <line># this includes the extraction and compilation of many applications and the toolchain</line>
+    <line># which can use Gigabytes of hard disk space.</line>
+    <line>TMPDIR = "${TOPDIR}/build/poky-tmp"</line>
+    <line></line>
+    <line>#</line>
+    <line># Machine Selection</line>
+    <line>#</line>
+    <line># You need to select a specific machine to target the build with. There are a selection</line>
+    <line># of emulated machines available which can boot and run in the QEMU emulator:</line>
+    <line>#</line>
+    <line>#MACHINE ?= "arago"</line>
+    <line></line>
+    <line>#</line>
+    <line># Package Management configuration</line>
+    <line>#</line>
+    <line># This variable lists which packaging formats to enable. Multiple package backends </line>
+    <line># can be enabled at once and the first item listed in the variable will be used </line>
+    <line># to generate the root filesystems.</line>
+    <line># Options are:</line>
+    <line>#  - 'package_deb' for debian style deb files</line>
+    <line>#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)</line>
+    <line>#  - 'package_rpm' for rpm style packages</line>
+    <line># E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"</line>
+    <line># We default to ipk:</line>
+    <line>PACKAGE_CLASSES ?= "package_ipk"</line>
+    <line></line>
+    <line>#</line>
+    <line># SDK/ADT target architecture</line>
+    <line>#</line>
+    <line># This variable specified the architecture to build SDK/ADT items for and means</line>
+    <line># you can build the SDK packages for architectures other than the machine you are </line>
+    <line># running the build on (i.e. building i686 packages on an x86_64 host._</line>
+    <line># Supported values are i686 and x86_64</line>
+    <line>SDKMACHINE ?= "x86_64"</line>
+    <line></line>
+    <line>#</line>
+    <line># Extra image configuration defaults</line>
+    <line>#</line>
+    <line># The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated </line>
+    <line># images. Some of these options are added to certain image types automatically. The</line>
+    <line># variable can contain the following options:</line>
+    <line>#  "dbg-pkgs"       - add -dbg packages for all installed packages</line>
+    <line>#                     (adds symbol information for debugging/profiling)</line>
+    <line>#  "dev-pkgs"       - add -dev packages for all installed packages</line>
+    <line>#                     (useful if you want to develop against libs in the image)</line>
+    <line>#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)</line>
+    <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
+    <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
+    <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
+    <line>#  "debug-tweaks"   - make an image suitable for development</line>
+    <line>#                     e.g. ssh root access has a blank password</line>
+    <line># There are other application targets that can be used here too, see</line>
+    <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
+    <line># We default to enabling the debugging tweaks.</line>
+    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line></line>
+    <line>#</line>
+    <line># Additional image features</line>
+    <line>#</line>
+    <line># The following is a list of additional classes to use when building images which</line>
+    <line># enable extra features. Some available options which can be included in this variable </line>
+    <line># are:</line>
+    <line>#   - 'buildstats' collect build statistics</line>
+    <line>#   - 'image-swab' to perform host system intrusion detection</line>
+    <line># NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended</line>
+    <line>USER_CLASSES ?= "buildstats"</line>
+    <line></line>
+    <line># By default disable interactive patch resolution (tasks will just fail instead):</line>
+    <line>PATCHRESOLVE = "noop"</line>
+    <line></line>
+    <line># By default the machine configuration file sets the IMAGE_FSTYPES.  But if you</line>
+    <line># would like to add additional file system types you can uncomment the</line>
+    <line># following line and add the additional IMAGE_FSTYPES you want created</line>
+    <line># as part of the build flow.  Some common types are listed below and you</line>
+    <line># can remove the ones you do not want.</line>
+    <line># IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"</line>
+    <line></line>
+    <line>#</line>
+    <line># Parallelism Options</line>
+    <line>#</line>
+    <line># These two options control how much parallelism BitBake should use. The first </line>
+    <line># option determines how many tasks bitbake should run in parallel:</line>
+    <line>#</line>
+    <line># BB_NUMBER_THREADS ?= "1"</line>
+    <line># </line>
+    <line># The second option controls how many processes make should run in parallel when</line>
+    <line># running compile tasks:</line>
+    <line>#</line>
+    <line># PARALLEL_MAKE ?= "-j 1"</line>
+    <line>#</line>
+    <line># For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would</line>
+    <line># be appropriate for example</line>
+    <line>#</line>
+    <line># NOTE: By default, bitbake will choose the number of processeors on your host</line>
+    <line># so you should not need to set this unless you are wanting to lower the number</line>
+    <line># allowed.</line>
+    <line>#</line>
+    <line></line>
+    <line>DISTRO   = "poky"</line>
+    <line></line>
+    <line># Set terminal types by default it expects gnome-terminal</line>
+    <line># but we chose xterm</line>
+    <line>TERMCMD = "${XTERM_TERMCMD}"</line>
+    <line>TERMCMDRUN = "${XTERM_TERMCMDRUN}"</line>
+    <line></line>
+    <line># Don't generate the mirror tarball for SCM repos, the snapshot is enough</line>
+    <line>BB_GENERATE_MIRROR_TARBALLS = "0"</line>
+    <line></line>
+    <line># Uncomment this to remove work directory after packaging to save disk space</line>
+    <line>#INHERIT += "rm_work"</line>
+    <line></line>
+    <line># Keep one set of images by default</line>
+    <line>RM_OLD_IMAGE = "1"</line>
+    <line></line>
+    <line># Enable local PR service for binary feeds</line>
+    <line>PRSERV_HOST = "localhost:0"</line>
+    <line></line>
+    <line># Enable hash equiv server</line>
+    <line>BB_SIGNATURE_HANDLER = "OEEquivHash"</line>
+    <line>BB_HASHSERVE = "auto"</line>
+    <line></line>
+    <line># It is recommended to activate "buildhistory" for testing the PR service</line>
+    <line>INHERIT += "buildhistory"</line>
+    <line>BUILDHISTORY_COMMIT = "1"</line>
+</local-conf-template>
diff --git a/src/templates/local-v2.conf.xml b/src/templates/local-v2.conf.xml
new file mode 100644
index 0000000..ef3027b
--- /dev/null
+++ b/src/templates/local-v2.conf.xml
@@ -0,0 +1,167 @@
+<local-conf-template name='local-v2.conf'>
+    <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
+    <line>CONF_VERSION = "2"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place downloads</line>
+    <line>#</line>
+    <line># During a first build the system will download many different source code</line>
+    <line># tarballs from various upstream projects. This can take a while, particularly</line>
+    <line># if your network connection is slow. These are all stored in DL_DIR. When</line>
+    <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
+    <line># of subsequent builds. This directory is safe to share between multiple builds</line>
+    <line># on the same machine too.</line>
+    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place shared-state files</line>
+    <line>#</line>
+    <line># BitBake has the capability to accelerate builds based on previously built</line>
+    <line># output. This is done using "shared state" files which can be thought of as</line>
+    <line># cache objects and this option determines where those files are placed.</line>
+    <line>#</line>
+    <line># You can wipe out TMPDIR leaving this directory intact and the build would</line>
+    <line># regenerate from these files if no changes were made to the configuration.</line>
+    <line># If changes were made to the configuration, only shared state files where the</line>
+    <line># state was still valid would be used (done using checksums).</line>
+    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line></line>
+    <line>#</line>
+    <line># Shared-state files from other locations</line>
+    <line>#</line>
+    <line># As mentioned above, shared state files are prebuilt cache data objects which</line>
+    <line># can be used to accelerate build time. This variable can be used to configure</line>
+    <line># the system to search other mirror locations for these objects before it</line>
+    <line># builds the data itself.</line>
+    <line>#</line>
+    <line># This can be a filesystem directory, or a remote url such as http or ftp.</line>
+    <line># These would contain the sstate-cache results from previous builds (possibly</line>
+    <line># from other machines). This variable works like fetcher MIRRORS/PREMIRRORS</line>
+    <line># and points to the cache locations to check for the shared objects.</line>
+    <line>#SSTATE_MIRRORS ?= "\</line>
+    <line>#file://.* http://someserver.tld/share/sstate/ \n \</line>
+    <line>#file://.* file:///some/local/dir/sstate/"</line>
+    <line></line>
+    <line>#</line>
+    <line># Where to place the build output</line>
+    <line>#</line>
+    <line># This option specifies where the bulk of the building work should be done and</line>
+    <line># where BitBake should place its temporary files and output. Keep in mind that</line>
+    <line># this includes the extraction and compilation of many applications and the toolchain</line>
+    <line># which can use Gigabytes of hard disk space.</line>
+    <line>TMPDIR = "${TOPDIR}/build/arago-tmp"</line>
+    <line></line>
+    <line>#</line>
+    <line># Machine Selection</line>
+    <line>#</line>
+    <line># You need to select a specific machine to target the build with. There are a selection</line>
+    <line># of emulated machines available which can boot and run in the QEMU emulator:</line>
+    <line>#</line>
+    <line>#MACHINE ?= "arago"</line>
+    <line></line>
+    <line>#</line>
+    <line># Package Management configuration</line>
+    <line>#</line>
+    <line># This variable lists which packaging formats to enable. Multiple package backends </line>
+    <line># can be enabled at once and the first item listed in the variable will be used </line>
+    <line># to generate the root filesystems.</line>
+    <line># Options are:</line>
+    <line>#  - 'package_deb' for debian style deb files</line>
+    <line>#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)</line>
+    <line>#  - 'package_rpm' for rpm style packages</line>
+    <line># E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"</line>
+    <line># We default to ipk:</line>
+    <line>PACKAGE_CLASSES ?= "package_ipk"</line>
+    <line></line>
+    <line>#</line>
+    <line># SDK/ADT target architecture</line>
+    <line>#</line>
+    <line># This variable specified the architecture to build SDK/ADT items for and means</line>
+    <line># you can build the SDK packages for architectures other than the machine you are </line>
+    <line># running the build on (i.e. building i686 packages on an x86_64 host._</line>
+    <line># Supported values are i686 and x86_64</line>
+    <line>SDKMACHINE ?= "i686"</line>
+    <line></line>
+    <line>#</line>
+    <line># Extra image configuration defaults</line>
+    <line>#</line>
+    <line># The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated </line>
+    <line># images. Some of these options are added to certain image types automatically. The</line>
+    <line># variable can contain the following options:</line>
+    <line>#  "dbg-pkgs"       - add -dbg packages for all installed packages</line>
+    <line>#                     (adds symbol information for debugging/profiling)</line>
+    <line>#  "dev-pkgs"       - add -dev packages for all installed packages</line>
+    <line>#                     (useful if you want to develop against libs in the image)</line>
+    <line>#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)</line>
+    <line>#  "tools-debug"    - add debugging tools (gdb, strace)</line>
+    <line>#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))</line>
+    <line>#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)</line>
+    <line>#  "debug-tweaks"   - make an image suitable for development</line>
+    <line>#                     e.g. ssh root access has a blank password</line>
+    <line># There are other application targets that can be used here too, see</line>
+    <line># meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.</line>
+    <line># We default to enabling the debugging tweaks.</line>
+    <line>EXTRA_IMAGE_FEATURES = "debug-tweaks"</line>
+    <line></line>
+    <line>#</line>
+    <line># Additional image features</line>
+    <line>#</line>
+    <line># The following is a list of additional classes to use when building images which</line>
+    <line># enable extra features. Some available options which can be included in this variable </line>
+    <line># are:</line>
+    <line>#   - 'buildstats' collect build statistics</line>
+    <line>#   - 'image-prelink' in order to prelink the filesystem image</line>
+    <line>#   - 'image-swab' to perform host system intrusion detection</line>
+    <line># NOTE: if listing mklibs &amp; prelink both, then make sure mklibs is before prelink</line>
+    <line># NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended</line>
+    <line>USER_CLASSES ?= "buildstats image-prelink"</line>
+    <line></line>
+    <line># By default disable interactive patch resolution (tasks will just fail instead):</line>
+    <line>PATCHRESOLVE = "noop"</line>
+    <line></line>
+    <line># By default the machine configuration file sets the IMAGE_FSTYPES.  But if you</line>
+    <line># would like to add additional file system types you can uncomment the</line>
+    <line># following line and add the additional IMAGE_FSTYPES you want created</line>
+    <line># as part of the build flow.  Some common types are listed below and you</line>
+    <line># can remove the ones you do not want.</line>
+    <line># IMAGE_FSTYPES += "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz tar.bz2 cpio"</line>
+    <line></line>
+    <line>#</line>
+    <line># Parallelism Options</line>
+    <line>#</line>
+    <line># These two options control how much parallelism BitBake should use. The first </line>
+    <line># option determines how many tasks bitbake should run in parallel:</line>
+    <line>#</line>
+    <line># BB_NUMBER_THREADS ?= "1"</line>
+    <line># </line>
+    <line># The second option controls how many processes make should run in parallel when</line>
+    <line># running compile tasks:</line>
+    <line>#</line>
+    <line># PARALLEL_MAKE ?= "-j 1"</line>
+    <line>#</line>
+    <line># For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would</line>
+    <line># be appropriate for example</line>
+    <line>#</line>
+    <line># NOTE: By default, bitbake will choose the number of processeors on your host</line>
+    <line># so you should not need to set this unless you are wanting to lower the number</line>
+    <line># allowed.</line>
+    <line>#</line>
+    <line></line>
+    <line># Select a distribution from supported "arago", "angstrom-2010.x" or "poky"</line>
+    <line># By default, go with the "distroless" configuration, when not set</line>
+    <line>#DISTRO   = "arago"</line>
+    <line></line>
+    <line># Set terminal types by default it expects gnome-terminal</line>
+    <line># but we chose xterm</line>
+    <line>TERMCMD = "${XTERM_TERMCMD}"</line>
+    <line>TERMCMDRUN = "${XTERM_TERMCMDRUN}"</line>
+    <line></line>
+    <line># Don't generate the mirror tarball for SCM repos, the snapshot is enough</line>
+    <line>BB_GENERATE_MIRROR_TARBALLS = "0"</line>
+    <line></line>
+    <line># Uncomment this to remove work directory after packaging to save disk space</line>
+    <line>#INHERIT += "rm_work"</line>
+    <line></line>
+    <line># Keep one set of images by default</line>
+    <line>RM_OLD_IMAGE = "1"</line>
+</local-conf-template>
-- 
2.17.1


