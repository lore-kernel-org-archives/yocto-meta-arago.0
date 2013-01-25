Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by arago-project.org (Postfix) with ESMTPS id E17F452A9C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:41 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uo13so1033236obb.27
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/tBsd6nwf5SM9k1z3ocsnP0hDNmMluStdCDma91bnsI=;
	b=IueIITgeZB0AEOIDPTBwsPsoP15qT6ViyUNAc4lzYI9vzD1qLmwr/Osf6aXLKAekzM
	6JBTooFNJOjufM+HOi7ZijuhbBYA43t5Pj+HvgTeV0+xQ/VJekRoJ1AJWsJg9qVhzgz1
	G6Csd2t4NKlGkVEjj2TrWR24cKFqF4Nw4Xw1pfMxSecz/kQ5uqfld3z8slhtJODcvni+
	cqr7NS4eKtUAmfPdq3zd9flPSNy0hg2yOyBF6dVImm3HmDadSaUzV7KXX08IA0NFb2RY
	sC3fQCtrez03rqTX7t3EV7IDS1FYCEl8bYHKK7vHyYq58YA87BsuBaT6Ud0Ni4seX3az
	+ieA==
X-Received: by 10.60.169.105 with SMTP id ad9mr5587748oec.99.1359151120977;
	Fri, 25 Jan 2013 13:58:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:39 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:04 -0600
Message-Id: <1359150851-23602-23-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Michael Tadyshak <mtadyshak@ti.com>
Subject: [PATCH 24/31] pinmux-utility: Pull in Pin Mux Utility v2.4.1.0
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:42 -0000

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


