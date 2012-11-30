Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 930E3529A9
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2012 18:13:27 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id x4so651144obh.38
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2012 10:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/tBsd6nwf5SM9k1z3ocsnP0hDNmMluStdCDma91bnsI=;
	b=DMXKPaxM520/Fvm2k8OT0CJrqAPXqnnNXp6UBSFxSuajlgeJ7wANgx1sFy+TRr7m5p
	v/43khVbiS2Vya8Pdml+TB5L2TCrosODfVckem90Zdgiyb2hJoqg7+Azlk0QXH3tS4+H
	knMRt5A0p2i0QpVkOvrvLmR4spClAPA1iM4ZPB9KVp69wUCpem2ViCgMm1DlxexPPu4D
	UmDtrwAqsAtR3iasvYrqq3IBdvsR1sqPbcvchPLM0xXV9PEciI22SzwzFQhoIMz/cfeW
	CcuMOIn8rIJbKZ1pAJv7WeOXQHL2Nk99dQOyB2Gw+SGLP8mE+tk0/TkditWOT95SmKLi
	7+sA==
Received: by 10.60.32.50 with SMTP id f18mr1763845oei.8.1354299206325;
	Fri, 30 Nov 2012 10:13:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm5554985obm.21.2012.11.30.10.13.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 10:13:25 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 30 Nov 2012 12:13:20 -0600
Message-Id: <1354299200-19504-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Michael Tadyshak <mtadyshak@ti.com>
Subject: [PATCH] pinmux-utility: Pull in Pin Mux Utility v2.4.1.0
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
X-List-Received-Date: Fri, 30 Nov 2012 18:13:28 -0000

From: Michael Tadyshak <mtadyshak@ti.com>

* Update to AM335x design spreadsheet v0.89
* Move MII Rx link signals to MISC category separate from IO Sets
* Remove note about McASP voltage restraints
* Remove PRU_PRUSS1 IO Sets

Signed-off-by: Michael Tadyshak <mtadyshak@ti.com>
---
 ...tility_2.3.1.0.bb => pinmux-utility_2.4.1.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-devtools/pinmux-utility/{pinmux-utility_2.3.1.0.bb => pinmux-utility_2.4.1.0.bb} (76%)

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
similarity index 76%
rename from meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb
rename to meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
index 6cd5b0c..c34f9fd 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.3.1.0.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
@@ -5,14 +5,14 @@ COMPATIBLE_MACHINE = "am335x-evm|am37x-evm|am3517-evm|beagleboard"
 
 PR = "r0"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtility_v2_03_01_00.zip;name=base;subdir=${P}"
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/850/5562/PinMuxUtility_v2_04_01_00.zip;name=base;subdir=${P}"
 
 # Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
 # from the License Agreement screen when installing this application.
 SRC_URI += "file://LICENSE"
 
-SRC_URI[base.md5sum] = "31f28b06f72c042e5400fc53b4a29c0e"
-SRC_URI[base.sha256sum] = "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9"
+SRC_URI[base.md5sum] = "f65ec03bbbb9e14126ac8ce2795acede"
+SRC_URI[base.sha256sum] = "a95fe1b436419bf97bfdcc0b7ce95e497558ad81190d95dc0869ef9fc794094c"
 
 S = "${WORKDIR}/${P}"
 
-- 
1.7.0.4


