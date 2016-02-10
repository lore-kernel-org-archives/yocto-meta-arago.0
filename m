Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 5C5735296D
	for <meta-arago@arago-project.org>;
	Wed, 10 Feb 2016 21:40:16 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2C00DA8PHFCE90@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Feb 2016 15:39:25 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=RfMuOf7ajFGezJdEbLwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D750F161E8B;	Wed,
	10 Feb 2016 16:39:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 10 Feb 2016 16:39:14 -0500
Message-id: <1455140354-27752-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-base-tisdk-image: add coreutils-dev to BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 10 Feb 2016 21:40:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since coreutils-dev depends on coreutils, not merely recommends it, there's
no way to remove coreutils w/o coreutils-dev through BAD_RECOMMENDATIONS.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index 7b589e2..93150c8 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -18,6 +18,7 @@ BAD_RECOMMENDATIONS += " \
     libulm-dev \
     gdbserver-c6x-dev \
     coreutils \
+    coreutils-dev \
 "
 
 export IMAGE_BASENAME = "arago-base-tisdk-image"
-- 
2.2.0


