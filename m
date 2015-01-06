Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 15A2F52978
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 14:13:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06EDsQO019403
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:13:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EDsYd029149
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:13:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 08:13:53 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EDrgn020827;
	Tue, 6 Jan 2015 08:13:53 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y8UtN-000541-DH;
	Tue, 06 Jan 2015 09:13:53 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 09:13:43 -0500
Message-ID: <1420553623-19435-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-target-nfs: Fix 'chown' arguments for /opt directory.
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
X-List-Received-Date: Tue, 06 Jan 2015 14:13:55 -0000
Content-Type: text/plain

* 'chown' command was missing owner:group options.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-targetfs-nfs.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 695f799..d8d6805 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -70,7 +70,7 @@ extract_fs() {
     # Opt isn't a standard Linux directory. First make sure it exist.
     if [ -d $1/opt ];
     then
-            sudo chown -R $1/opt
+            sudo chown -R $me:$me $1/opt
             check_status
     fi
 
-- 
1.7.9.5


