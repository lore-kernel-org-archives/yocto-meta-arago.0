Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9E52152A04
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 21:30:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1GLUSBP017792
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:29 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1GLURxV006907
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 15:30:27 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1GLUQPH009707;	Mon, 16 Feb 2015 15:30:27 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1GLUOpl030075;	Tue, 17 Feb 2015 03:00:25 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:30:15 -0600
Message-ID: <1424122222-26709-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/8] sourceipk: Cleanly clear local config settings
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
X-List-Received-Date: Mon, 16 Feb 2015 21:30:29 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Use git commands to clear previously set local git config settings
* Current approach causes problems within the git repository

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 26d3922..0e778f4 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -177,10 +177,8 @@ adjust_git() {
             # (remote) git repository
             git repack -a -d
 
-
             if [ "${SRCIPK_CUSTOM_GIT_BRANCH}" != "" -a "${SRCIPK_CUSTOM_GIT_MESSAGE}" != "" ]
             then
-
                 # Create local git config settings to create commit
                 git config user.email "<>"
                 git config user.name "Texas Instruments SDK Builder"
@@ -199,8 +197,9 @@ adjust_git() {
                     git checkout -b "${SRCIPK_CUSTOM_GIT_BRANCH}"
                 fi
 
-                # Delete local git config settings
-                rm .gitconfig .git/config > /dev/null 2>&1 || echo ""
+                # Delete local git config settings previously set
+                git config --unset user.email
+                git config --unset user.name
 
             fi
 
-- 
1.7.9.5


