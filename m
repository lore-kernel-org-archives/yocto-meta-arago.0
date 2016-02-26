Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id D4D5D52AB5
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 21:09:52 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3600K65AS07J80@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Feb 2016 15:09:37 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=6JLBqQ_0ensYL-ClyGwA:9
Received: by 100.15.86.14 with SMTP id 2d50f286; Fri, 26 Feb 2016 21:09:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C171161EE8;	Fri,
	26 Feb 2016 16:09:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Feb 2016 16:09:36 -0500
Message-id: <1456520976-17176-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1456520976-17176-1-git-send-email-denis@denix.org>
References: <1456520976-17176-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] packagegroup-arago-test: add timestamping
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
X-List-Received-Date: Fri, 26 Feb 2016 21:09:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 07b200f..34d3b59 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r38"
+PR = "r39"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -36,6 +36,7 @@ ARAGO_TI_TEST = "\
     ltp-ddt \
     input-utils \
     cpuloadgen \
+    timestamping \
     "
 
 ARAGO_TI_TEST_append_ti33x = " \
-- 
2.2.0


