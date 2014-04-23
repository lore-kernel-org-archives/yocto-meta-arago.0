Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 19ACA52A23
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 19:43:01 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00GRG1EU04U0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 14:42:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B7ACA2009D; Wed,
	23 Apr 2014 15:42:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 15:42:24 -0400
Message-id: <1398282148-11547-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398282148-11547-1-git-send-email-denis@denix.org>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 1/5] bblayers-denzil: remove denzil-specific bblayers file, deprecated
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
X-List-Received-Date: Wed, 23 Apr 2014 19:43:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/bblayers-denzil.conf.sample | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 sample-files/bblayers-denzil.conf.sample

diff --git a/sample-files/bblayers-denzil.conf.sample b/sample-files/bblayers-denzil.conf.sample
deleted file mode 100644
index b1c3952..0000000
--- a/sample-files/bblayers-denzil.conf.sample
+++ /dev/null
@@ -1,9 +0,0 @@
-# This template file was created by taking the oe-core/meta/conf/bblayers.conf
-# file and removing the BBLAYERS section at the end.
-
-# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
-# changes incompatibly
-LCONF_VERSION = "4"
-
-BBPATH = "${TOPDIR}"
-BBFILES ?= ""
-- 
1.9.2


