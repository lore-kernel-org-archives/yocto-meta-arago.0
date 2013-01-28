Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id 2CA5952A5D
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:49 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so2204383oag.39
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pz5HSSBkSYHe8sDZzMJJGcf7iFDovfUFj7ZH96zUPf8=;
	b=DDZyPA1KYOH+azJWuEcK+18mDvawS4idNUtNruaCefn2PSBbx6vBQHQDgGZ/RtzoFL
	fCbfD1t/eMgn1nPRzK7vKqM+kt87xP0meqeJHEXVpr4xh6l4T0K88yEwL2h5XKKz3042
	GB0hLAdtek2ObLvfE3auk1hFCSSo6PEbLNutcYp/kUSlTMf+Y1XvBhkzL7641GcjKgT4
	SKDiD9yrMc8/S6r65YbgCxlBkVlFyVR/7Njzo4ZokaHZTdeLGEPtwfwLEFJtHiYls83E
	BVj1zrJifxBjFrnaxt/7e+0+zh01x216uGTOCjDmA0qFeTGiDD+h3EMGPjuCZAg175Vc
	/MWw==
X-Received: by 10.60.30.231 with SMTP id v7mr12025903oeh.22.1359393948479;
	Mon, 28 Jan 2013 09:25:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:47 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:06 -0600
Message-Id: <1359393932-31361-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/32] arago-amsdk-image: Remove additional GPLv3 components
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:49 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Remove GPLv3 packages that we currently do not have clearance to ship.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 9ce7754..0fc3ac7 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
 # List of packages to remove from the host package.  This is usually due to
 # licensing issues and unneeded dependencies.
 HOST_CLEANUP_PACKAGES = ""
-TOOLCHAIN_CLEANUP_PACKAGES = ""
+TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-- 
1.7.0.4


