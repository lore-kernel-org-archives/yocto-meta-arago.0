Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E0D9152ABC
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVod3021665
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:50 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMVnal021458
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:48 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVlZg005108;	Fri, 30 Jan 2015 16:31:48 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1p007326;	Sat, 31 Jan 2015 04:01:46 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:37 -0600
Message-ID: <1422657099-15544-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422657099-15544-1-git-send-email-fcooper@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6] sourceipk: Fix issue with git fetch when shallow clone is used
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:51 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* When shallow clone is used for some reason running git fetch on the repository
  didn't end up making it completely whole (fetch all commits).
* Even worse the copied repository didn't have a proper way to reference or
  fetch remote branches or tags.
* For some reason deleting the origin and seeing it back to the correct value
  fixed these problems.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 6b16657..6895378 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -157,7 +157,11 @@ adjust_git() {
 
             cd -
 
-            git remote set-url origin $remote_repo $local_repo
+            # Some crazy reason I need to add these two lines when doing a
+            # shallow copy. Otherwise, I had problems where git fetch wasn't
+            # properly fetching all the commits and extra remotes.
+            git remote rm origin
+            git remote add origin $remote_repo
 
             # Repackage the repository so its a proper clone of the original
             # (remote) git repository
-- 
1.7.9.5


