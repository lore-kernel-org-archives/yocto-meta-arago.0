Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6E15E529E7
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 20:31:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QKVZMs007713
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:31:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QKVZZT001416
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:31:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 15:31:34 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QKVVLo026267;
	Thu, 26 Sep 2013 15:31:32 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Sep 2013 16:14:58 -0500
Message-ID: <1380230098-19889-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] oe-layertool-setup.sh: Fix DL_DIR logic
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
X-List-Received-Date: Thu, 26 Sep 2013 20:31:37 -0000
Content-Type: text/plain

* There was a bug introduced that would set a blank DL_DIR if
  the was no existing local.conf file and the -d option was not
  used.  Now set the default option to a non-blank value if no
  old local.conf file exists and no -d option was set.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 oe-layertool-setup.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 72e36a2..99df1d9 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -738,7 +738,7 @@ EOM
     then
         old_dldir=`cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g'`
     else
-        old_dldir="$dldir"
+        old_dldir="$oebase/downloads"
     fi
 
     # If command line option was not set use the old dldir
-- 
1.7.0.4


