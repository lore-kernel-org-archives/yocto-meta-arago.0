Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 3F2B352A50
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 19:34:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X00HFTADCQ4B0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 14:34:24 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7DE0A20087; Fri,
	18 Jul 2014 15:34:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 15:34:21 -0400
Message-id: <1405712061-14868-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-11-git-send-email-denis@denix.org>
References: <1405709522-404-11-git-send-email-denis@denix.org>
Subject: [PATCH v2 11/11] arago.conf: use the new _remove override to filter out sgx feature
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
X-List-Received-Date: Fri, 18 Jul 2014 19:34:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - do not remove local filter_out function, still used by ASSUME_PROVIDED

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2686264..3ac30ce 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -49,7 +49,7 @@ TARGET_CPPFLAGS += "-fstack-protector"
 require conf/distro/include/arago-prefs.inc
 
 # Hack out sgx flag for now, as breaking on kernels >= 3.14
-MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
+MACHINE_FEATURES_remove = "sgx"
 
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
-- 
2.0.0


