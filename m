Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 006425299E
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 10:01:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OA0Z6w098281
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 05:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561370435;
	bh=hyXk12OKduLhpQ1v4AkETePiqvSgb6+EvByyq6HEzzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yaek3ln/A8rjX0rmfZoUzorymPxy9bHWrods3/n5CipsPWl9D6AtT2CdOQv+7RlVx
	WLrQqyyQHsZGarVsVysvMyMPw00Tmu6yzCTfcqF7YBUdaNnTeqamE7F/03nWO5EcMc
	aJ0OIxsXDD88sKQ8TKMLcJcimfRIZIzthAsZFrPE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OA0Ztj112802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 05:00:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 05:00:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 05:00:34 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OA0Wr0029540;
	Mon, 24 Jun 2019 05:00:34 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 00:56:51 -0400
Message-ID: <20190624045651.17223-3-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624045651.17223-1-x0157990@ti.com>
References: <20190624045651.17223-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v3 3/3] glow: Add glow and demo-glow to packagegroups
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
X-List-Received-Date: Mon, 24 Jun 2019 10:01:18 -0000
Content-Type: text/plain

- Add glow to nativesdk
- Add demo to target and src packagegroups
- Also include demo-glow to example-applications

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../nativesdk-packagegroup-arago-tisdk-host.bbappend |  3 +++
 ...packagegroup-arago-tisdk-addons-sdk-host.bbappend | 12 ++++++++++++
 ...ckagegroup-arago-tisdk-addons-sdk-target.bbappend |  7 +++++++
 .../packagegroup-arago-tisdk-addons.bbappend         |  7 +++++++
 4 files changed, 29 insertions(+)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
new file mode 100644
index 0000000..409740b
--- /dev/null
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+EXTRA_TI_TOOLS_append = " nativesdk-glow "
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index 76a185c..7cb0cae 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -18,3 +18,15 @@ EXTRA_LIBS_append_dra7xx = " \
 "
 
 UTILS_append_am335x-evm = " pru-adc-src"
+
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
index 8351352..6d8a49e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -76,3 +76,10 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-lib-host-staticdev \
     tiovx-sys-iface \
 "
+
+EXTRA_PACKAGES_append_ti33x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow-dev "
+
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 93bcc88..62796d8 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -28,3 +28,10 @@ UTILS_append = " net-snmp net-snmp-server-snmpd"
 EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples kaldi ti-fftw-examples"
 
 EXTRA_PACKAGES_append_k2hk = " ti-fftw-examples"
+
+EXTRA_PACKAGES_append_ti33x = " demo-glow "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow "
+
-- 
2.17.1


