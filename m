Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9DDD452993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:11:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIBjIE118486
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862305;
	bh=M6eCWNRNP4D4NxPbPU5CIIQuhSFzF1O0oM75voro5m8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qaND/rFQrDtrBWHPwReZc8mOo4R8CqlCcsY2CyHryYzGRupPMGwqWWMi/rr1ojDDK
	x0MNUQEHW7z7opidRJv8+9aHmun3Qo+fwOXZWSBb6rU/YyQEGKQey0/e36gEi+nIQV
	IG6/YBIs9Z/SjzFFRwzQp//AUcJkpoQoBwKAKwpU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBjN6030728
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:45 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:11:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:11:45 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBR6g025581;
	Thu, 13 Sep 2018 13:11:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 13:56:23 -0400
Message-ID: <1536861387-7418-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v6 1/5] stb: C/C++ libraries used to build armnn test examples.
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
X-List-Received-Date: Thu, 13 Sep 2018 18:11:53 -0000
Content-Type: text/plain

From: Qin Su <qsu@ti.com>

Signed-off-by: Qin Su <qsu@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Changes from previous versions:
* Add "_git" suffix to recipe name.
* Add version.
* DESCRIPTION --> SUMMARY.
* Add branch option for SRC_URI.
* For installation, use install by looping over *.h files.
* Remove bash-completion package as the file is not present.

 meta-arago-extras/recipes-support/stb/stb_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/stb/stb_git.bb

diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-extras/recipes-support/stb/stb_git.bb
new file mode 100644
index 0000000..4181007
--- /dev/null
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "single-file public domain (or MIT licensed) libraries for C/C++"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=42144ce827adcfa5170032f0ea03c227"
+
+PV = "2.31"
+
+BRANCH = "master"
+SRCREV = "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
+
+SRC_URI = " \
+    git://github.com/nothings/stb.git;branch=${BRANCH} \
+"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${includedir}
+    for hdr in ${S}/*.h
+    do
+        install -m 0644 $hdr ${D}${includedir}
+    done
+}
-- 
2.7.4


