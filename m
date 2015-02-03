Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 11EF5529D9
	for <meta-arago@arago-project.org>;
	Tue,  3 Feb 2015 16:12:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t13GCrtd003463
	for <meta-arago@arago-project.org>; Tue, 3 Feb 2015 10:12:53 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t13GCqaS002716
	for <meta-arago@arago-project.org>; Tue, 3 Feb 2015 10:12:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Feb 2015 10:12:52 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t13GCpUE017173;	Tue, 3 Feb 2015 10:12:52 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t13GCnTK018196;	Tue, 3 Feb 2015 21:42:50 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Feb 2015 10:12:46 -0600
Message-ID: <1422979967-19687-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] sourceipk: When preserving git repository optionally create local branch
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
X-List-Received-Date: Tue, 03 Feb 2015 16:12:55 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Previously if you saved the git repository with sourceipk and did a git status
  you would see "# Not currently on any branch." since when checking out a git
  repository OE will use a commit id.
* Also since SDKs tend to depend on git repositories based on a tag there is
  generally no SDK branch that can refer people to which means they end up
  creating their own SDK branch.
* This patch adds several variables that creates a local branch based on the
  commit the recipe uses. A variable is also used to specify a "commit"
  message that can be used to explain the purpose of the branch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 6895378..26d3922 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -61,6 +61,16 @@ SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
 SRCIPK_PRESERVE_GIT ?= "false"
 
+# Git commit message that explains the purpose of the custom git branch
+SRCIPK_CUSTOM_GIT_MESSAGE ?= ""
+
+# File that will store the same information as the commit message but is also
+# used to add something to insure a commit can be committed.
+SRCIPK_SDK_README ?= "TISDK-README"
+
+# Name used when creating the custom branch
+SRCIPK_CUSTOM_GIT_BRANCH ?= ""
+
 # Create a shallow clone of the git repository to reduce the size of
 # the sourceipk
 SRCIPK_SHALLOW_CLONE ?= "false"
@@ -167,6 +177,33 @@ adjust_git() {
             # (remote) git repository
             git repack -a -d
 
+
+            if [ "${SRCIPK_CUSTOM_GIT_BRANCH}" != "" -a "${SRCIPK_CUSTOM_GIT_MESSAGE}" != "" ]
+            then
+
+                # Create local git config settings to create commit
+                git config user.email "<>"
+                git config user.name "Texas Instruments SDK Builder"
+
+                # For recipes like the kernel which may end up running
+                # sourceipk more than once.
+                branch_exist=`git branch | grep ${SRCIPK_CUSTOM_GIT_BRANCH}` || echo ""
+                if [ "$branch_exist" != "" -a -f ${SRCIPK_SDK_README} ]
+                then
+                    git add -A
+                    git commit --amend
+                else
+                    echo -e ${SRCIPK_CUSTOM_GIT_MESSAGE} > ${SRCIPK_SDK_README}
+                    git add -A
+                    git commit -F ${SRCIPK_SDK_README}
+                    git checkout -b "${SRCIPK_CUSTOM_GIT_BRANCH}"
+                fi
+
+                # Delete local git config settings
+                rm .gitconfig .git/config > /dev/null 2>&1 || echo ""
+
+            fi
+
             rm -f .git/objects/info/alternates
 
         else
-- 
1.7.9.5


