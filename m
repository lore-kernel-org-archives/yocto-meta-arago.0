Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by arago-project.org (Postfix) with ESMTPS id 9BEAF52AB2
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:44 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uo13so46051obb.13
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=XEsjJKefFxp0dt+hC83/M00LrkhHLyRrBJ1bnb/Hc1M=;
	b=R9Nz1rC+YFUxRpRQhcjeERPaNvCCIjP5lAhzwiDDer6WM8ZCvYGRIxh+LmYABQlFld
	5LP3ShKmOUxbFkpLZgkkFh21rQVie8KOJXWjX3pRQcBaWmcADxRF8C64nHqAEk8VOn/V
	ljZeOwfmhdiNEzuWMW4FDh6XDRFRN80CcvGvlhVdh7Qqyqcr6DTyjyhwgsyJlI1xwOGh
	2Tleed7FGrtZgAo7aI+OWPM4n/9s8PlC0BZ1yEsZM3/2siBSC/KXXftxp8xEINbUxj9O
	1I+E3u/xXpcXYyP+RnSNWm21ux48P7Bd4ezc8pcLeayPwLEwNJiMVh5z4neWBUGmuSmr
	/lpQ==
X-Received: by 10.182.38.69 with SMTP id e5mr10524717obk.79.1358632364111;
	Sat, 19 Jan 2013 13:52:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:43 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:49 -0600
Message-Id: <1358632316-12266-24-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 24/31] oe-layersetup: Add oe-layersetup script
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:44 -0000

* Add the oe-layersetup script which is used to setup an oe-core environment
  on a development machine.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/oe-layersetup/oe-layersetup.bb   |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb

diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
new file mode 100644
index 0000000..ff54341
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Package that contains a script to setup oe-core development environment"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+PACKAGE_ARCH = "all"
+
+BRANCH ?= "master"
+SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
+SRC_URI = "git://arago-project.org/git/projects/oe-layersetup.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git/"
-- 
1.7.0.4


