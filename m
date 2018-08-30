Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 427D7529AE
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 13:51:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UDpYRE058688
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535637094;
	bh=pD8k2nCwfvoymHclKW0iHkNGZzUNUJ4eAnuSDe8j0WM=;
	h=From:To:CC:Subject:Date;
	b=hShv/yhbXrnbI5OAPtT21Voi+n0JSZim3Iy7GdSGOfYyIm0RB4xxG4jeE4UtssRhH
	MvV01PcaCKZ0NXlY09FmwzIyjJedngDmQpIOx1zx1c4yQeZJ/J1/5M/aWMxTtgYuas
	/7HiRw1NuhzAIV0QEfUH4mWSe+osWiPFTpQjE+x4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDpYDq004454
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:51:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 08:51:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 08:51:34 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDpXbf028429;
	Thu, 30 Aug 2018 08:51:34 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fvNMD-0007ts-Eb; Thu, 30 Aug 2018 09:51:33 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 09:51:30 -0400
Message-ID: <1535637091-30335-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH 1/2] setup-tftp: support k3
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
X-List-Received-Date: Thu, 30 Aug 2018 13:51:42 -0000
Content-Type: text/plain

* Enable copy of uImage and Image in addition to zImage.
* Enable copy of device tree overlays.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-tftp.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/setup-tftp.sh b/setup-tftp.sh
index 90f122b..e4dc816 100644
--- a/setup-tftp.sh
+++ b/setup-tftp.sh
@@ -114,7 +114,7 @@ else
 fi
 
 platform=`cat $cwd/../Rules.make | grep -e "^PLATFORM=" | cut -d= -f2`
-kernelimage="zImage-""$platform"".bin"
+kernelimage="*Image-""$platform"".bin"
 kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
 if [ -f $tftproot/$kernelimage ]; then
     echo
@@ -153,6 +153,9 @@ fi
 dtbfiles=`cd $prebuiltimagesdir;ls -1 *.dtb`
 copy_to_tftproot "$dtbfiles"
 
+dtbofiles=`cd $prebuiltimagesdir;ls -1 *.dtbo`
+copy_to_tftproot "$dtbofiles"
+
 uboot_gph_files=`cd $prebuiltimagesdir;ls -1 u-boot*.gph 2> /dev/null`
 copy_to_tftproot "$uboot_gph_files"
 
-- 
1.9.1


