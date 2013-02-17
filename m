Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f179.google.com (mail-ye0-f179.google.com
	[209.85.213.179])
	by arago-project.org (Postfix) with ESMTPS id 687AD52A8D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:29 +0000 (UTC)
Received: by mail-ye0-f179.google.com with SMTP id m4so915242yen.38
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DPP03+vCJ4pq+KVJFdUrazWit219P2EQ4/IpZqaRazo=;
	b=rxqNfh3iWUGkRdRY8Wdu5oOIQC32aJkDelExl7ZWekzKZ1LZm3EL6q84AxmAQo/z9w
	bqb27agpgIX0e9B+whJFWlv2MolfxIdsqO9bZOkBG92cxpnBDzYdB0Y/GoXivLpQfdZB
	X+7PgWd74F9+qupylNjuXpAqoiMyep4tWBvM5q8/ugwzs2kK4WxXiRadTGUk/hz/eje5
	zpFrvQ+aREEMy/jUlrH2u2a/+ZXeWqYTdS3yU9xglxrDKuhrcVTa483r3/xLBq9KXubo
	0MN+VbDRtLS4IfIj3Ly6EdYuj2P+jFDxBdz2IqhcWAwMWWCa/LT1Eh9AvBIU7WXOoUbU
	nqNg==
X-Received: by 10.101.136.19 with SMTP id o19mr4773112ann.33.1361141608782;
	Sun, 17 Feb 2013 14:53:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:27 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:52:59 -0600
Message-Id: <1361141595-1687-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/20] packagegroup-arago-tisdk-matrix: Add PRU Matrix demos for am180x-evm
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:29 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 4c41265..e94c72b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -96,6 +96,7 @@ MATRIX_APPS_append_am180x-evm = "   \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
     matrix-gui-wifi-battleship-demo \
+    matrix-gui-pru-demos            \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.7.0.4


