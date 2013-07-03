Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C399152979
	for <meta-arago@arago-project.org>;
	Wed,  3 Jul 2013 05:44:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r635iUln032437
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2013 00:44:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r635iUQV024429
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2013 00:44:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 3 Jul 2013 00:44:30 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r635iSAU010838	for
	<meta-arago@arago-project.org>; Wed, 3 Jul 2013 00:44:29 -0500
Date: Wed, 3 Jul 2013 11:14:28 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130703054428.GA9111@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH oe-setuplayer] oe-layertool-setup: Add warning before overwriting local.conf
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
X-List-Received-Date: Wed, 03 Jul 2013 05:44:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Its possible for the user to have already configured her setup.
  Warn the user that we are overwriting his local.conf when
  generating the local.conf.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 oe-layertool-setup.sh |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e8c427f..55cd174 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -717,6 +717,13 @@ NOTE: You will probably want to change the default MACHINE setting in the
       local.conf file to the machine you are trying to build.
 
 EOM
+    
+    if [ -e $confdir/local.conf ]
+    then
+        echo "WARNING: Found existing $confdir/local.conf"
+        echo "Saving a backup to $confdir/local.conf.bak" 
+        cp -f $confdir/local.conf $confdir/local.conf.bak
+    fi
 
     # First copy the template file
     cp -f $OECORELOCALCONFPATH $confdir/local.conf
-- 
1.7.0.4


