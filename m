Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 5D19052A8F
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 17:18:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4J0059FPDVRH40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Apr 2014 12:18:08 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7E9D720120; Thu,
	24 Apr 2014 13:17:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Apr 2014 13:17:51 -0400
Message-id: <1398359871-24257-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398359871-24257-1-git-send-email-denis@denix.org>
References: <1398359871-24257-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 3/3] local-arago.conf.sample: enable single set of images by default
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
X-List-Received-Date: Thu, 24 Apr 2014 17:18:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/local-arago.conf.sample | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
index 06352e0..44fe8ce 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago.conf.sample
@@ -157,3 +157,6 @@ BB_GENERATE_MIRROR_TARBALLS = "0"
 
 # Uncomment this to remove work directory after packaging to save disk space
 #INHERIT += "rm_work"
+
+# Keep one set of images by default
+RM_OLD_IMAGE = "1"
-- 
1.9.2


