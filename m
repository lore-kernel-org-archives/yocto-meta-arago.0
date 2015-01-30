Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 83ACA52090
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVmEX009285
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMVlIm021436
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:47 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVkdR005093;	Fri, 30 Jan 2015 16:31:47 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1o007326;	Sat, 31 Jan 2015 04:01:45 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:36 -0600
Message-ID: <1422657099-15544-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422657099-15544-1-git-send-email-fcooper@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/6] sourceipk: Make the # of revisions preserved from shallow clone a variable
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:49 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* The size of the shallow clone depth really is a balancing act between how much
  space you want to save by ignoring commits compared to how much commits you
  want to preserve to make git log/git blame/gitk useful without requiring a
  fetch.
* Add a new variable that allows recipes to change alter the "depth" when the
  shallow git repository is created.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 8fef2e9..6b16657 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -65,6 +65,12 @@ SRCIPK_PRESERVE_GIT ?= "false"
 # the sourceipk
 SRCIPK_SHALLOW_CLONE ?= "false"
 
+# By default limit the history to 1 commit since the user can always
+# use git pull --unshallow to fetch the rest of history.  The depth
+# level of 1 is set to keep from tracking through all merges and
+# pulling excess history
+SRCIPK_SHALLOW_DEPTH ?= "1"
+
 # This function will return the fetch URL for a git repository passed as
 # the first parameter.
 get_remote() {
@@ -100,11 +106,6 @@ get_remote() {
 #       than just a single branch the limited history will be a depth of
 #       1 for all branches and tags.
 limit_git_history() {
-    # By default limit the history to 1 commit since the user can always
-    # use git pull --unshallow to fetch the rest of history.  The depth
-    # level of 1 is set to keep from tracking through all merges and
-    # pulling excess history
-    commits="1"
 
     # Temporary directory to make shallow clones in
     gitshallowclone="${WORKDIR}/temp-git-shallow-clone"
@@ -117,7 +118,7 @@ limit_git_history() {
 
     remote=`get_remote $PWD`
 
-    git clone --depth $commits --branch ${BRANCH} file://$remote $gitshallowclone
+    git clone --depth ${SRCIPK_SHALLOW_DEPTH} --branch ${BRANCH} file://$remote $gitshallowclone
 
     # remove original kernel clone since we will replace it with the shallow
     # clone
-- 
1.7.9.5


