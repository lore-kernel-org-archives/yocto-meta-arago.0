Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 157B152A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESWX9006150
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EESWfC032562
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:31 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESVZp017528;	Thu, 14 May 2015 09:28:31 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7j-0006nd-L4;
	Thu, 14 May 2015 10:28:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:18 -0400
Message-ID: <1431613705-26086-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] am-sysinfo: Move SRC_URI to git.ti.com.
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
X-List-Received-Date: Thu, 14 May 2015 14:28:34 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index d285347..0fa7366 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -11,7 +11,7 @@ PR = "r9"
 BRANCH ?= "master"
 SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
 
-SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=http;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/apps/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


