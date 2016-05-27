Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 60E4752AC1
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 13:18:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4RDI1Tq013194
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4RDI1PT028650
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 08:18:01 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4RDI1Cj027612;	Fri, 27 May 2016 08:18:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 May 2016 09:17:50 -0400
Message-ID: <1464355073-24441-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
References: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] python-appdirs: add version 1.4.0
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
X-List-Received-Date: Fri, 27 May 2016 13:18:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb b/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
new file mode 100644
index 0000000..fdea221
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a "user data dir"."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+SRC_URI[md5sum] = "1d17b4c9694ab84794e228f28dc3275b"
+SRC_URI[sha256sum] = "8fc245efb4387a4e3e0ac8ebcc704582df7d72ff6a42a53f5600bbb18fdaadc5"
+
+inherit pypi setuptools
-- 
2.7.4


