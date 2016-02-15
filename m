Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id C20E852A83
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 21:08:09 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.154])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2L008KOXCPH6R0@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Feb 2016 15:07:48 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=FoZ_MdnTAYPHXUw6teAA:9
Received: by 100.15.86.14 with SMTP id 7b7cbf24; Mon, 15 Feb 2016 21:07:48 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5D4FF161E9F;	Mon,
	15 Feb 2016 16:07:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Feb 2016 16:07:36 -0500
Message-id: <1455570456-20441-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1455570456-20441-1-git-send-email-denis@denix.org>
References: <1455570456-20441-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] dropbear: update list of TSU exempt versions
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
X-List-Received-Date: Mon, 15 Feb 2016 21:08:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
index 6c43541..e7868e2 100644
--- a/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
+++ b/meta-arago-distro/recipes-core/dropbear/dropbear_%.bbappend
@@ -5,8 +5,10 @@
 # dropbear-0.51
 # dropbear-2012.55
 # dropbear-2013.58
+# dropbear-2014.63
+# dropbear-2015.71
 #
 # This package requires TSU exemption. Any update to the version of dropbear being
 # appended must be double checked to see if a new TSU exemption must be made.
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
2.2.0


