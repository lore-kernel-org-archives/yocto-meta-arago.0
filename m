Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id D7B855208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:20 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MX+H8EQVXkObZVH2sYfoS3vH8dNmWvwipO97hNmBdjs=;
	b=0hWhj+aPTHjbo4mhu9M2SFEgGG+uGASANtazYliMsDSHBVE96SXR1b9R+PbGC4HnYr
	2KiPKwLlMGAXiO9bv3FM2xrN2UN8oSbS095AYFmPmSLbXn3VLgCkEVDAhtn04wpdynF/
	/U1cuKxFCeBPpniktAJbM1HDjPEhUMZ2+XO/MQInh39iS5h86PnHmIFUTHMcqOQsrF+i
	/x3Byh45uoIJY/6VBIWPtHjJkiWKV9MiMiucy6Eg/i6HZpzv1hurBmXGm98ZvJXvwOne
	doveClR1mBVUuQ9IN/BcDVdahWf5KNN/xV0s2cYdhvCfqB80YIrlEbXgkG0I+AXDkB6z
	HSzg==
Received: by 10.182.4.174 with SMTP id l14mr6642447obl.88.1352080460575;
	Sun, 04 Nov 2012 17:54:20 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:20 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:25 -0600
Message-Id: <1352080417-9792-28-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 30/42] linux-am335x: Update psp 04.06.00.08 recipe
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:21 -0000

* The defconfig that is supposed to override the defconfig in meta-ti was placed
  in the wrong directory. This was due to a rename of the recipe in meta-ti.
* Also the append was adding ${PN} to the additional file path. Updating to ${P}
  to reflect that the directory is based on both ${PN}-${PV}

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../defconfig                                      |    0
 .../linux-am335x_3.2.0-psp04.06.00.08.bbappend     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08.sdk => linux-am335x-3.2.0-psp04.06.00.08}/defconfig (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig
rename to meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
index 3f7b524..c100597 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 # KVER is used by arago-source-ipk.conf
 KVER = "${PV}"
-- 
1.7.0.4


