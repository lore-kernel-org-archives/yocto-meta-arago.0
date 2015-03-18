Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 08A2452A6D
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 12:28:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ICSLae022275
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:28:21 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICSKOl025265
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:28:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 07:28:19 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICSHuk020803;
	Wed, 18 Mar 2015 07:28:19 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Mar 2015 17:58:14 +0530
Message-ID: <1426681695-8833-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426681695-8833-1-git-send-email-a0393906@ti.com>
References: <1426681695-8833-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago 2/3] uim: switch protocol to http
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
X-List-Received-Date: Wed, 18 Mar 2015 12:28:22 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/uim/uim_git.bb            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
index 0ebaeb0..adf578f 100644
--- a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
+++ b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
@@ -12,7 +12,7 @@ INITSCRIPT_PARAMS = "defaults 03"
 inherit update-rc.d
 
 SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
-SRC_URI = "git://gitorious.org/uim/uim.git \
+SRC_URI = "git://gitorious.org/uim/uim.git;protocol=http;branch=${BRANCH} \
 	   file://0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch \
 	   file://uim-sysfs \
 "
-- 
1.7.9.5


