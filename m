Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C15C652A0A
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 14:00:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NDx0Yp121397
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566568740;
	bh=EU/4E2ZM15f1uLd5lHLqDeecEmuFcxuEEIK9L25cqc8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VEETrUQHnZeuEt78wsyPPzCA2fzNUbdnhh+X0xavePQ7bCeoKBpD6slqJsYgFdyVY
	yT9qfF99VxQ6o7huKSgPARvF0fXp1x/MP1WFx+OV1iMrgRsixd1m1wxZW2IvTFJon8
	u5jWJcRniy/jn6lsproTvJUe02gM9xaNxhq8jYxY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NDx0W8131029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:59:00 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 08:59:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 08:59:00 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwwUb118791;
	Fri, 23 Aug 2019 08:59:00 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Aug 2019 09:58:56 -0400
Message-ID: <20190823135856.8053-6-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823135856.8053-1-x0157990@ti.com>
References: <20190823135856.8053-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv2 5/5] packagegroup-arago-tisdk: Include xNN glow based compiler tool into devkit, and demo-glow example
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
X-List-Received-Date: Fri, 23 Aug 2019 14:00:02 -0000
Content-Type: text/plain

- image-classifier tool which converts xNN model into executable object code
  and sample test images are included into devkit
- An example in demo-glow which convets lenet mnist model into object code and links
  into application is added to target filesystem and also top level example-applications

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../nativesdk-packagegroup-arago-tisdk-host.bbappend  |  4 ++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend | 11 +++++++++++
 ...ackagegroup-arago-tisdk-addons-sdk-target.bbappend |  6 ++++++
 .../packagegroup-arago-tisdk-addons.bbappend          |  7 +++++++
 4 files changed, 28 insertions(+)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
new file mode 100644
index 0000000..b35282e
--- /dev/null
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+EXTRA_TI_TOOLS_append = " nativesdk-glow "
+
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index a8a0b2e..6349bcd 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -18,3 +18,14 @@ EXTRA_LIBS_append_dra7xx = " \
 
 UTILS_append_am335x-evm = " pru-adc-src"
 
+EXTRA_PACKAGES_append_omap-a15 = " \
+    demo-glow-src \
+"
+
+EXTRA_PACKAGES_append_ti43x = " \
+    demo-glow-src \
+"
+    
+EXTRA_PACKAGES_append_ti33x = " \
+    demo-glow-src \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 08f20e4..6d8a49e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -77,3 +77,9 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-sys-iface \
 "
 
+EXTRA_PACKAGES_append_ti33x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow-dev "
+
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 0cf0322..f365dc6 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -26,3 +26,10 @@ EXTRA_PACKAGES_append_armv7a = " zbar"
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
 EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples"
+
+EXTRA_PACKAGES_append_ti33x = " demo-glow "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow "
+
-- 
2.17.1


