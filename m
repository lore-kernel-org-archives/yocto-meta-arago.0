Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id D73B152A1C
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:39 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id h2so9814313oag.21
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vjz3qey/+4joB6TDegtGliyjQfAw1GXkJ468b0WOwzI=;
	b=LQBYzEOxSa31hyIvJ6EWFoqhmVD844P21MsXy8zVSVKdHMwBGiOrU58djAXgux03KB
	GGcwQRcOeb0Y3VicP2VFI5ye6AyEYifci3FTSWErRxivXAyKk+eHsvTXg97FAuuINedE
	jNEbrVYlzUoKhHXi7rbiKQUAuHEPDplcd3XF052qTLFcoou+mZliKckx8itFvGAHbkaV
	ho4oLCVJHiNZRMaOnj5mmmlg5ICGcAdHa3lP7XvAPRGCpQQmUYZlvIMAAA+6HNx8X1H4
	w0YzgzuP76RWhAoiR9Fg0qLin83357hJZAesHeHB1la+N2LIsfWBwXIcDuUCTqQ2jVUG
	DPnw==
X-Received: by 10.182.154.4 with SMTP id vk4mr1533259obb.70.1359037299131;
	Thu, 24 Jan 2013 06:21:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:38 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:11 -0600
Message-Id: <1359037281-12610-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 37/47] tisdk-image: Package gz file systems by default
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:40 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Allow packaging tar.gz files as well for the root file system
  if they exist.
* Usually only one tar.gz or tar.bz2 should be set to build but
  if both are there they will get packaged.  To set one or the
  other you should set IMAGE_FSTYPES in the machine.conf file
  for your machine.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 3222d0d..0177d7f 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -37,7 +37,7 @@ TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
 TISDK_TOOLCHAIN ?= "meta-toolchain-arago"
 
 # List of the type of target file system images we want to include
-TARGET_IMAGE_TYPES ?= "tar.bz2 ubi"
+TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
 
 # If EXTRA_TISDK_FILES points to a valid directory then all the contents
 # of that directory will be added to the SDK using the same directory
-- 
1.7.0.4


