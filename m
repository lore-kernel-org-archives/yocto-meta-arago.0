Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BA5C5529C2
	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 21:25:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SLOu5C022110
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 15:24:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SLOuai006180
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 15:24:56 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 15:24:55 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SLOsGA024672;
	Thu, 28 Jan 2016 15:24:55 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1aOu3h-0000Fk-1E; Thu, 28 Jan 2016 16:24:53 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jan 2016 16:24:51 -0500
Message-ID: <1454016291-937-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-tftp: Copy initramfs if available
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
X-List-Received-Date: Thu, 28 Jan 2016 21:25:09 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-tftp.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/setup-tftp.sh b/setup-tftp.sh
index f62ef67..90f122b 100644
--- a/setup-tftp.sh
+++ b/setup-tftp.sh
@@ -162,6 +162,9 @@ copy_to_tftproot "$monfiles"
 fw_files=`cd $prebuiltimagesdir;ls -1 *firmware*.bin 2> /dev/null`
 copy_to_tftproot "$fw_files"
 
+initramfs_files=`cd $prebuiltimagesdir;ls -1 *fw-initrd*.cpio.gz 2> /dev/null`
+copy_to_tftproot "$initramfs_files"
+
 echo
 if [ -f $tftpcfg ]; then
     echo "$tftpcfg already exists.."
-- 
1.9.1


