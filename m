Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EE8BB52993
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 17:14:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHHD0ed026401
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 11:13:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576602780;
	bh=pZ2+OJjcpxltcEKlB/L3V0ABRDJl/MZ4aBwpr+fcxn4=;
	h=From:To:CC:Subject:Date;
	b=p6TZlXTKBttmIU6NhyjIdLD9HJg8qxCr3gLRis5HYZM9/ZZgO73hO0d8Ou49mFuZP
	YdwVJR8ElzQJPGB7SZwATNNVevyE3/brSyaCU/t4AwAIB7FZ671L7a2yhzG8czbc7g
	iu5SfUbdQCqZSu+DKhtR1q/xBkz4KH9wiO4dVTps=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHHD06G009415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 11:13:00 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 11:13:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Dec 2019 11:13:00 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHHD0ZY069380;
	Tue, 17 Dec 2019 11:13:00 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1ihGP6-00021a-14; Tue, 17 Dec 2019 12:13:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Dec 2019 12:12:58 -0500
Message-ID: <1576602778-7751-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH v2] create-sdcard.sh: add support for early boot
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
X-List-Received-Date: Tue, 17 Dec 2019 17:14:38 -0000
Content-Type: text/plain

For the cores that support early boot, it is expected that the
firmware is available on the boot partition, for U-Boot, as well as
on the rootfs partition, for Linux. Therefore copy the default
firmware image from the rootfs to the boot partition. The boot
partition format is vfat, so it does not support symlinks. Follow
symlinks as necessary to get the firmware image into the boot
partition.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* remove syntactically incorrect spaces when setting
  RPROC_EARLYBOOT_FIRMWARE.
* Destination filename should be the same as that in the list, not
  that of the resolved link.

 create-sdcard.sh | 50 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 5c02a12..736cd42 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -1097,16 +1097,6 @@ fi
 
 echo ""
 echo ""
-echo "Syncing..."
-sync
-sync
-sync
-sync
-sync
-sync
-sync
-sync
-
 if [ "$KERNELFILESOPTION" == "2" ]
 then
 
@@ -1138,6 +1128,46 @@ then
 
 fi
 
+
+# The following firmware are required for early boot, and therefore must be
+# copied to the boot partition.
+RPROC_EARLYBOOT_FIRMWARE=" \
+    dra7-ipu1-fw.xem4 \
+"
+
+for fw in $RPROC_EARLYBOOT_FIRMWARE
+do
+	fw_path="$PATH_TO_SDROOTFS/lib/firmware/$fw"
+
+	# Handle links specifally as they may be absolute paths with respect to the rootfs
+	if [ -L "$fw_path" ]
+	then
+		fw_link=$(readlink "$fw_path")
+		if [[ "$fw_link" == /* ]]
+		then
+			# Absolute path
+			fw_path="$(readlink "$fw_path" | sed -e "s|^/|$PATH_TO_SDROOTFS/|")"
+		else
+			# Relative path
+			fw_path="$(dirname "$fw_path")/$fw_link"
+		fi
+	fi
+
+	# this is a global list of firmwares, so do not fail
+	cp -L "$fw_path" "$PATH_TO_SDBOOT/$fw" 2> /dev/null || true
+done
+
+echo " "
+echo "Syncing..."
+sync
+sync
+sync
+sync
+sync
+sync
+sync
+sync
+
 echo " "
 echo "Un-mount the partitions "
 sudo umount -f $PATH_TO_SDBOOT
-- 
1.9.1


