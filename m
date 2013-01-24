Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 85FEA52AA6
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:43 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id k1so9846680oag.30
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=w7J68qKtrYv/KC2+tceX8aWg4DfM0X21xt1SRo6gzIk=;
	b=x3dbuFMVmBSWUxiJGmUaiOlajEA6LgjhE7gEz4ZA4dHwCiPmwLD/3CzrAnc9jZIy8E
	vo1PpYI8R0XdUz+Cpt1XBb98zyD8gQvVihwBCFCgaDDMuHojKryR44eWDWErCtvRNEA6
	WS5R5x7UCRXVXoFpaClVL4HhWrYqOlP02TQzLqb98sC6yQp1lK7YxW4CgL2jDv4GSNYa
	NMEAfIu5ZEvMX4Ql4IvdJ5tXQbXlSh6YTOAUeXP2UCdc/3xTOtjSi9wKXP7lRRCBKDvw
	uwZ+Qb6lmDIb6YR4l0rGeoX8K53gaiHhDCOTe7KFpIckA3KJY0Z8AT7C5qhl47lan5Va
	fQKw==
X-Received: by 10.60.4.226 with SMTP id n2mr1578460oen.63.1359037302989;
	Thu, 24 Jan 2013 06:21:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:41 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:13 -0600
Message-Id: <1359037281-12610-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 39/47] tisdk-image: Fix missing header in SW manifest
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:43 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Added the missing table header text in the SW manifest that
  is generated as part of the SDK build.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 0177d7f..bbccdc4 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -272,6 +272,11 @@ echo "
 sw_manifest_toolchain_target() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/arm-arago-linux-gnueabi/var/lib/opkg/info"
 
+echo "
+<h2><u>Development Libraries Installed on Host</u></h2>
+<p>This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
+" >> ${SW_MANIFEST_FILE}
+
     generate_sw_manifest_table $opkg_dir
 }
 
-- 
1.7.0.4


