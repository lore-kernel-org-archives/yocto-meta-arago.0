Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C735B52A82
	for <meta-arago@arago-project.org>;
	Thu,  6 Oct 2016 19:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A58820A3E;
	Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lVpWqQqWqp7c; Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 54DB520A36;
	Thu,  6 Oct 2016 19:34:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 70556162161;
	Thu,  6 Oct 2016 15:34:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Oct 2016 15:34:38 -0400
Message-Id: <1475782479-31904-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475782479-31904-1-git-send-email-denis@denix.org>
References: <1475782479-31904-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/4] kms++: add C++ library for kernel mode setting
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
X-List-Received-Date: Thu, 06 Oct 2016 19:34:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/kms++/kms++_git.bb             | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
new file mode 100644
index 0000000..c8f3854
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "C++ library for kernel mode setting"
+HOMEPAGE = "https://github.com/tomba/kmsxx"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c670e18272184fc0e86e1648678b4f2a"
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=http;branch=${BRANCH}"
+SRCREV = "546e8d16dbc4dc74038dbcf86567186dbd80c3ab"
+
+DEPENDS = "drm python3 python3-pybind11"
+
+S = "${WORKDIR}/git"
+
+inherit cmake update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "kmstest"
+ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
-- 
2.7.4


