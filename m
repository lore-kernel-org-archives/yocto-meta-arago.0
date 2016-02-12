Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id C2655529C2
	for <meta-arago@arago-project.org>;
	Fri, 12 Feb 2016 23:05:30 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.150])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2G0076UIS65P30@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 12 Feb 2016 17:04:59 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=DnO3rwyF3k3c5YvvSNQA:9
Received: by 100.15.86.14 with SMTP id 73b43d15; Fri, 12 Feb 2016 23:04:59 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C201D161E9C;	Fri,
	12 Feb 2016 18:04:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 12 Feb 2016 18:04:53 -0500
Message-id: <1455318293-30510-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1455318293-30510-1-git-send-email-denis@denix.org>
References: <1455318293-30510-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] packagegroup-arago-test: add procps
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
X-List-Received-Date: Fri, 12 Feb 2016 23:05:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index ca5cf16..07b200f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -29,6 +29,7 @@ ARAGO_TEST = "\
     pulseaudio-misc \
     kselftests \
     cpuset \
+    procps \
     "
 
 ARAGO_TI_TEST = "\
-- 
2.2.0


