Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0CD0152A65
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2020 10:38:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03UAa3j7122364
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 05:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588242963;
	bh=ZeZlJWgKq8ADwFJ5pOoK44EjMPwONHKhYGlM4wtwb34=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wvB/+lzqPbOX6V+7982mjJ+frf7iSMWH2u77DDZbNBmp7CGfn5uCvhVOuH6rxil2S
	AGXEWcFmqa9YwTiLkSluYzFl3vKi+FkyOPB/gmZU7LszeR5itp9Al0vpjJRe03WcN6
	Au/Zc560E5AeqTVthnSAu7CekqFzhbi2NibMnla0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03UAa3kL054146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 05:36:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Apr 2020 05:36:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Apr 2020 05:36:03 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UAa0pg028819;
	Thu, 30 Apr 2020 05:36:02 -0500
From: <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Thu, 30 Apr 2020 16:05:58 +0530
Message-ID: <20200430103558.5797-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430103558.5797-1-nikhil.nd@ti.com>
References: <20200430103558.5797-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus PATCH v2 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Thu, 30 Apr 2020 10:38:25 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Statistics Collector is userspace application which communicates
with remote processors to get the statistics data on target.

This can be printed command line or sent over network for
host-side visualization.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Add the package in correct packagegroup

 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2913fa15..c8c445cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -77,7 +77,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
-UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw statcol"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
new file mode 100644
index 00000000..b87d940b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Statistics collector application"
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
+SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+DEPENDS = "rpmsg-char-helper websocketd"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"
+
+do_install() {
+	DESTDIR=${D} make install
+}
-- 
2.17.1


