Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ED4FA52A52
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:33:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99BX7rJ021189
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:33:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99BX7I0004755
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:33:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 06:33:07 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99BX6WO003530;
	Fri, 9 Oct 2015 06:33:06 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkVv8-0001Si-9p; Fri, 09 Oct 2015 07:33:06 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 07:33:03 -0400
Message-ID: <1444390383-5586-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] init-ifupdown: Fix getting DNS if rootfs is network mount
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
X-List-Received-Date: Fri, 09 Oct 2015 11:33:15 -0000
Content-Type: text/plain

* Previously, if the rootfs was a network mount, then no network
  configuration was done
* This included the DHCP request to obtain the DNS addresses
* If the rootfs is a network mount, then run "udhcpc" to get the DNS
  addresses

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init      | 5 ++++-
 .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend              | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
index 86aff88..235652d 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
@@ -20,12 +20,15 @@ case "$1" in
         if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts | 
           grep -q "^/ nfs$"; then
             echo "NOT configuring network interfaces: / is an NFS mount"
+            udhcpc
         elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |  
           grep -q "^/ smbfs$"; then
             echo "NOT configuring network interfaces: / is an SMB mount"
-	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
+            udhcpc
+        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts | 
           grep -qE '^(nfs|smbfs|ncp|coda)$'; then
             echo "NOT configuring network interfaces: network shares still mounted."
+            udhcpc
         else
             echo -n "Configuring network interfaces... "
             ifup -a
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
index c0ab069..997adf2 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.9.1


