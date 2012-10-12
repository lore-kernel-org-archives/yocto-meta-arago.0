Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 4989052A70
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:05:03 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2462501oag.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4iSTT/BOVsB9v3adPnsOq1TAw+SRf3PwBYIVnTM68RM=;
	b=Ux9regLAHnWtV+YbkrK3uWG69m1b7Q4WDtkRCslpc75YXVeFL0GbJfmAX7QhHe3VEe
	OzLgObYqhm6ghlDMDFX4PgLI7GcB4qUi4lddrVmtLw88aY8th9k+TQH8OTToCxKFkJ30
	wgzPqhZ3xBOi3XPuh2Hzv1ShMaCOIaZKXPXyTwRU6htHoWOQ/MWJwQWiyUwomhzYF9g0
	51c3cmMvRNmBoh2VrK245HssQYVs/iebjzZ1+iCIsJAuMM5GQM1mkyebKCLHoumvZdbK
	1mMkGhvXAsYCBev9T0ZBrSgiM5v6r8MABF9ATEN8hiVJukYULs36z2jcT7eOWvOfy3ir
	aAIg==
Received: by 10.182.221.97 with SMTP id qd1mr2566404obc.6.1350018302720;
	Thu, 11 Oct 2012 22:05:02 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm5960887obi.22.2012.10.11.22.05.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:05:01 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:35:18 -0500
Message-Id: <1350020118-11207-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] arago.conf: Set preferred u-boot version for am335x
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
X-List-Received-Date: Fri, 12 Oct 2012 05:05:03 -0000

* For now u-boot_am335x-evm version 2011.09-psp04.06.00.08 is not the default
  version of u-boot for am335x. Therefore, a PREFERRED_VERSION needs to be set
  to make sure the Arago SDK uses the correct u-boot version.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update comments.

 meta-arago-distro/conf/distro/arago.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9ae2339..48629f1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -36,6 +36,9 @@ ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
+# Use the SDK supported u-boot version
+PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 
-- 
1.7.0.4


