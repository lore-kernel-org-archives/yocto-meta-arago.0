Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9189752974
	for <meta-arago@arago-project.org>;
	Thu, 15 Oct 2015 13:40:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9FDetsg032725
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 08:40:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FDetFA030575
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 08:40:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Oct 2015 08:40:54 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FDespL017622;
	Thu, 15 Oct 2015 08:40:54 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zmim6-0002VT-4l; Thu, 15 Oct 2015 09:40:54 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Oct 2015 09:40:52 -0400
Message-ID: <1444916452-9601-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gdb: Add python-modules as runtime dep for python support
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
X-List-Received-Date: Thu, 15 Oct 2015 13:41:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend

diff --git a/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend b/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend
new file mode 100644
index 0000000..0eb06c8
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gdb/gdb_linaro-7.8.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago0"
+
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python-modules"
-- 
1.9.1


