Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 577DB52A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:07 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id l20so1047079oag.26
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UlivppILWdGqYFZL4ptLtC/ppn1Tk0NcEt4P3mwe1B8=;
	b=BY/4uvAka/+7pYbm0+bMBM/DzdX6sowTS07LQG2fM/O9G5naS6hEPVbqBPz9KnYmwj
	VpEcfb+gH7hSQ8yHToilKsgyVUeEexG/r93enZ3NDcGhsulsi3UX3azRnM2P+aFLqti4
	JkeS+g3ryqpuBc5YT3trmKhNrg2YaGTo3z3OUr8Cgj28kobyeRAlr5wQ1iMdHTQCPs9X
	lUTOEP98jHcURcXo6oxDRB2EOi7RU9glhnPUkeEmN311LMSIUQ//lARqGeWGF7KIDgfc
	2mGqxF6xGKWiBdJnYnzMeMaRb4e5IINuZmHGhs+dDdHeUwNdQVtRcEbcPccRXOXSki4W
	3zHw==
X-Received: by 10.182.18.133 with SMTP id w5mr5810729obd.64.1359151086746;
	Fri, 25 Jan 2013 13:58:06 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:05 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:45 -0600
Message-Id: <1359150851-23602-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/31] ti-compat-bluetooth: update to use a different compat zip
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:08 -0000

From: Eyal Reizer <eyalr@ti.com>

* Update the recipe to use a different compat-bluetooth zip file

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
index e9fc22b..9ce50f7 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
@@ -9,20 +9,20 @@ inherit module
 RDEPENDS_${PN} = "ti-compat-wireless-wl12xx"
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "a"
+PR_append = "b"
 
-COMPAT_BLUETOOTH_VERSION = "2012-05-22-r5-18"
+COMPAT_BLUETOOTH_VERSION = "2012-11-19-r5-sp3"
 TAG = "${@'${COMPAT_BLUETOOTH_VERSION}'.replace('-', '')}"
 PV = "0.${TAG}"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-bluetooth-wl12xx-2012-05-22-r5-18.tgz \
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-bluetooth-2012-02-20.tar.gz \
            file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
            file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
            file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
           "
 
-SRC_URI[md5sum] = "85118756a605ebd8f4fbff19995368a6"
-SRC_URI[sha256sum] = "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393"
+SRC_URI[md5sum] = "7c231b35a2297391b5192f86ff4f10dd"
+SRC_URI[sha256sum] = "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350"
 
 S = "${WORKDIR}/compat-bluetooth/"
 
-- 
1.7.0.4


