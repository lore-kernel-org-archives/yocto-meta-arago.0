Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A574852A71
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2015 15:38:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB7FcGig008392
	for <meta-arago@arago-project.org>; Mon, 7 Dec 2015 09:38:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7FcGjr007431
	for <meta-arago@arago-project.org>; Mon, 7 Dec 2015 09:38:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Dec 2015 09:38:15 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7FcG3I025237;
	Mon, 7 Dec 2015 09:38:16 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a5xrj-0008AN-Ny; Mon, 07 Dec 2015 10:38:15 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Dec 2015 10:38:08 -0500
Message-ID: <1449502689-31357-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH v2 4/5] setup-tftp: Copy firmware if available
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
X-List-Received-Date: Mon, 07 Dec 2015 15:38:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Copy generic firmware binaries

 setup-tftp.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/setup-tftp.sh b/setup-tftp.sh
index 714968f..f62ef67 100644
--- a/setup-tftp.sh
+++ b/setup-tftp.sh
@@ -159,6 +159,9 @@ copy_to_tftproot "$uboot_gph_files"
 monfiles=`cd $prebuiltimagesdir;ls -1 skern*.bin 2> /dev/null`
 copy_to_tftproot "$monfiles"
 
+fw_files=`cd $prebuiltimagesdir;ls -1 *firmware*.bin 2> /dev/null`
+copy_to_tftproot "$fw_files"
+
 echo
 if [ -f $tftpcfg ]; then
     echo "$tftpcfg already exists.."
-- 
1.9.1


