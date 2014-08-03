Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id BB70A52972
	for <meta-arago@arago-project.org>;
	Sun,  3 Aug 2014 20:50:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R00BS80JX8R30@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 03 Aug 2014 15:50:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 25F4C20592; Sat,
	02 Aug 2014 21:10:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Aug 2014 21:10:18 -0400
Message-id: <1407028221-9762-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1407028221-9762-1-git-send-email-denis@denix.org>
References: <1407028221-9762-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] arago-image.inc: add udev-extraconf unconditionally to all images
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
X-List-Received-Date: Sun, 03 Aug 2014 20:50:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previously, udev used to RRECOMMENDS udev-extraconf in past releases. Now it
needs to be added explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 7cab56a..98af6c3 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -18,6 +18,7 @@ ARAGO_IMAGE_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL += " \
 	packagegroup-core-boot \
 	bash \
+	udev-extraconf \
 	${ARAGO_IMAGE_EXTRA_INSTALL} \
 "
 
-- 
2.0.2


