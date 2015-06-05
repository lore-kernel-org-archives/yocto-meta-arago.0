Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0159B529A7
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 12:01:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t55C1bui012038
	for <meta-arago@arago-project.org>; Fri, 5 Jun 2015 07:01:37 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t55C1bCq013606
	for <meta-arago@arago-project.org>; Fri, 5 Jun 2015 07:01:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Jun 2015 07:01:36 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t55C1axJ015887;	Fri, 5 Jun 2015 07:01:36 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Z0qJc-0007H5-Cy;
	Fri, 05 Jun 2015 08:01:36 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Jun 2015 08:01:32 -0400
Message-ID: <1433505693-27926-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Fri, 05 Jun 2015 12:01:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Previously submitted to meta-ti.

 .../recipes-core/llvm/llvm-common.bbappend         |    5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common.bbappend

diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend b/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
new file mode 100644
index 0000000..65de0d8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
+
+BBCLASSEXTEND += "nativesdk"
-- 
1.7.9.5


