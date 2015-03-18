Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 25FF552099
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 12:45:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ICjGsS007870
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:45:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICjFs0028759
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:45:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 07:45:14 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICjCcX012053;
	Wed, 18 Mar 2015 07:45:14 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Mar 2015 18:15:10 +0530
Message-ID: <1426682711-3071-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426682711-3071-1-git-send-email-a0393906@ti.com>
References: <1426682711-3071-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago PATCH V2 2/3] uim: switch protocol to http
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
X-List-Received-Date: Wed, 18 Mar 2015 12:45:17 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/uim/uim_git.bb            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
index 0ebaeb0..31bb9cb 100644
--- a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
+++ b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
 
 PV = "1.0"
-PR ="r1"
+PR ="r2"
 PR_append = "+gitr${SRCPV}"
 
 INITSCRIPT_NAME = "uim-sysfs"
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


