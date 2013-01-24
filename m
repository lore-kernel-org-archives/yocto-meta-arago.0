Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id CDE4A52A21
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:53 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1107848obc.20
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PGGQ5EiHeRq9JvA6jyqfyDBOFKVdeBp9MQuHM3Gxzn8=;
	b=AiM4SKCXjiIQHq7VUKRalRUEe3CfXmnDr3TjoLu48puETSWT4XYLM6QLsglVNaWr6g
	UZDWQaoIIhoCguyQ+R/tHexKLt6Pv1Gcv7RyN4ClU3LxLMMggFYNHcA8fYoX/AkM9is7
	Y49gG/5ZTuR+H5+OwhnKGe7+cpfICJtgvkiv55s+pSRgnoaDH6ruAW1iWgVmU9pcGFEg
	C9vTPCTQwF//q2WMKDYxBoAbzaJsx2XDxpsU0CniWpA21UrxctPOGsrwqqXGcQqXg/UY
	UlY5rXz3xJ+icMyZ2WiD4vJIpLlpJmg97bvYkPSOd1/ABJ+rjVFw/xS8QR/TGMXDPlAO
	2U7Q==
X-Received: by 10.60.31.39 with SMTP id x7mr1628127oeh.45.1359037313191;
	Thu, 24 Jan 2013 06:21:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:52 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:19 -0600
Message-Id: <1359037281-12610-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 45/47] qt-tstat: Remove proxy settings
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:54 -0000

* Remove default proxy settings from the application

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index 143d0a2..9b9704c 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
-SRCREV = "429c802ea04c41f7b29efb89642828091fb83f9b"
+SRCREV = "1d3f0ecc0e9c9358166db94965b9075b5ae73723"
 
 SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
 
-- 
1.7.0.4


