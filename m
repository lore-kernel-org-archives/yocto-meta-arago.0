Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 673EC52A76
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHjXN020017
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300665;
	bh=UpO3JHneHiG2f/LcKXA1jQhpe/bZth0f5G61HOIFynw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uZSeihj26BELadJi8WKu7u+DNTpO3bWhqGM0U/T9ZHW+m7LEHVkR+Bgxs/xrxvOYc
	RCzZ4qlX5BudxdNwlG+Fh3EFgw9ftOwyMe8Y+88HmAw+3ZNH3ESaobTehh36tX7Axg
	ht9G5EairM+D/3Fa8GEJvCBL2LXLrQz1oRiZD+xk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjfc021193
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjfT008402;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJw-0006tL-VX; Fri, 01 Sep 2017 16:17:45 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:36 -0500
Message-ID: <20170901211741.26451-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 2/7] recipes-apps : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:46 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../protection-relays-hmi_git.bb                   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb

diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
new file mode 100755
index 0000000..a6ece91
--- /dev/null
+++ b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "HMI demo for Prectection Relays using QT QWidget tools"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
+
+inherit qt-provider
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
+
+S = "${WORKDIR}/git"
+
+CREATE_SRCIPK_protection-relays-hmi = "1"
+SRCIPK_INSTALL_DIR_protection-relays-hmi = "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 protection_relays_hmi ${D}${bindir}
+}
-- 
2.13.0


