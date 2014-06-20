Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 04BC7529C3
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00FRJB75UMP0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:06 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 70EA1201C2; Fri,
	20 Jun 2014 13:57:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:32 -0400
Message-id: <1403287009-11256-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/19] linux-libc-headers: remove old 2.6.37 version
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux-libc-headers/linux-libc-headers_2.6.37.2.bb          | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb

diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
deleted file mode 100644
index 5c00af5..0000000
--- a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
-
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-headers/${PN}"
-
-PR = "r1"
-
-SRC_URI += " file://connector-msg-size-fix.patch"
-SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
-SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
-
-- 
2.0.0


