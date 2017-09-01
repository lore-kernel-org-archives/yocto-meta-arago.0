Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 17C2952A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:06:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81L6Es2029264
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299974;
	bh=UpO3JHneHiG2f/LcKXA1jQhpe/bZth0f5G61HOIFynw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jTvml3VK6P1djMD1mTYSeSN52diRbE3wvLumWEhVNcBx624dOj0PYm2JCjwMChLkK
	16niCqAZrxuEdQY7STLX82KWKQDogyCGE4V8X5bb66n8zPuVGeve3udxrlPJaRVPf4
	PCWMwh7uAcqBqhuEZ0UupLnOBxxlYACsaBVtbJWQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81L6EVf005563
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:06:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:06:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:06:13 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81L6DU5031786;
	Fri, 1 Sep 2017 16:06:13 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnt8n-0006nj-FF; Fri, 01 Sep 2017 16:06:13 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:06:05 -0500
Message-ID: <20170901210611.26095-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901210611.26095-1-manisha.agrawal@ti.com>
References: <20170901210611.26095-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/8] recipes-apps : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 21:06:14 -0000
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


