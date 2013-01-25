Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id A54FF52AE7
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:48 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1033865obq.35
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pPWk+HF1YQe2nSpd4xcSWg4zI+9cdBOcUVw5aWzjJlA=;
	b=UzrvoCMHeeO7feiCsvFbTXcaU4Va7b81A81FwXPM8TbDhs27Thb/gHsI1MAXHWkd41
	kmquptarzS0dXDHjChsehsfTFk9DWzBIbJpKotSbECJVJMDDr9ENq2k0klPpYFSNuuOw
	rYnZxIvyOg+JX2p5gh3Nq78aKo4FORwjO24ZRCLEGJbwmNBR9RshCJGqbem+09PGbd5P
	l7HmxdWabdvh/2kdt2h7lN1oODD56cNv9osl+RJKBfzz4dubX4ZVjlecVAW46XA/WMVw
	9nPMBFzi47Vq8iuX8wuKzXI1smlDCmnzS5ZnBU7Q+KO7NmYmwv8VtlAXHqTg6/AVqgPq
	8Tzw==
X-Received: by 10.60.6.167 with SMTP id c7mr2758103oea.100.1359151127908;
	Fri, 25 Jan 2013 13:58:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:47 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:08 -0600
Message-Id: <1359150851-23602-27-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 28/31] bash: Mimic patch "Make it possible to run bash 3.2.48 instead of 4.2."
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:49 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Duplicating bash_3.2.48.bb recipe to mimic changes done by the patch
  "bash: Make it possible to run bash 3.2.48 instead of 4.2." commit id
  "e7b82cb4d107bfbfa5c939d406dd6ce6615b24e1" from oe-core master/danny.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-extended/bash/bash_3.2.48.bb           |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/bash/bash_3.2.48.bb

diff --git a/meta-arago-extras/recipes-extended/bash/bash_3.2.48.bb b/meta-arago-extras/recipes-extended/bash/bash_3.2.48.bb
new file mode 100644
index 0000000..7fcaf78
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/bash/bash_3.2.48.bb
@@ -0,0 +1,23 @@
+require ${COREBASE}/meta/recipes-extended/bash/bash.inc
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
+
+PR = "r11"
+
+SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003"
+
+SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
+SRC_URI[tarball.sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
+SRC_URI[patch001.md5sum] = "af571a2d164d5abdcae4499e94e8892c"
+SRC_URI[patch001.sha256sum] = "b1217ed94bdb95dc878fa5cabbf8a164435eb0d9da23a392198f48566ee34a2f"
+SRC_URI[patch002.md5sum] = "8443d4385d73ec835abe401d90591377"
+SRC_URI[patch002.sha256sum] = "081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3c078503609a1642"
+SRC_URI[patch003.md5sum] = "15c6653042e9814aa87120098fc7a849"
+SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef"
+
+SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
+SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
-- 
1.7.0.4


