Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id DA5B852A9A
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:29 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oKBWY+vj6ZxezZ5QXMKSZV2ANcluD3ltAAtONVR7MHc=;
	b=I+8Ffn5fHHnHr62RrgpfXg90fe+IimX6gz5KHY7ucUK93XCCmp7FU7wuE0AaCcgcz3
	8nhrRV1tDgg1K4PQ76lo0ddO8vItZYcrWPX335gSaXuFp6jH5qTqle/ueNeL91Lz4BL7
	nDUz4GOyF2zB587O/lIAkrB6SUPGmIc3OGDpM70goQVJwbw6NVRXlO8d/lXd1xj4r396
	dNHxRimhRc97oF3QSo68x+Gs7IdhHCr8ceDQeVR+vZ9JBJsq19ShXZip3DZQXz+mowVK
	nmxVVHGB4Na+LUlvMzf/Y/2EXJhOoGzAgq4cdkuo63FuUngFeMt8PnoW1tI42hjioO0u
	yDAA==
Received: by 10.60.13.193 with SMTP id j1mr6598994oec.41.1352080469573;
	Sun, 04 Nov 2012 17:54:29 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:29 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:32 -0600
Message-Id: <1352080417-9792-35-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 37/42] ti-tisdk-setup: Update targetNFS filesystem
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:30 -0000

* Update SRCREV to pull in tweaks to the setup-targetfs-nfs.sh
* Update extracting of file system to match the tar.bz2 file extension

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index d9b5da3..96df155 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "5bbfa583671b87bc8c17316bb3a9787fbc884ec6"
+SRCREV = "b7d67ebb3c3267248210e2e66b1bad273747f9b6"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.7.0.4


