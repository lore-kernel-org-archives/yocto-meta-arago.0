Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id DF0CC52AA5
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:46 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc20so8986683obb.36
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8Xq4DPO3qKAU3MRkki+jCg83CZdofWCWp91Qa0zsnwk=;
	b=zQFypNcuZk165aSvCX3UzGPl8fN4DjSiqr7jYtyed/bQXIVqOMpofK+o19G8f0Xlnt
	SdVGDuNv+g73xd6eaSZTBK+Xn0Zyy4b2s+v8aY5idmVuYSLoF36Mu34zKvebMooi+NsH
	+zAu9lzDTUkyUqtYVVF7OmiEDuh0GELQ4sA6hREhJcvajSxqZdUVv8v9ilXIWLpWCp1A
	05dwvKCwKWzhnQyXX+rWw0UJf0aomjOq7BEHDfmsZONtA7zS+SbHAPay9q51L/09KbjZ
	9P1bHIk++xThOY3afToy7/tk0Dio59mJW1DGoohYVkLm7yOGdGwLwx2Pi3G6x/WdCCdb
	g2bw==
X-Received: by 10.182.156.103 with SMTP id wd7mr1581750obb.33.1359037306407;
	Thu, 24 Jan 2013 06:21:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:45 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:15 -0600
Message-Id: <1359037281-12610-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 41/47] ti-tisdk-setup: Switch back filesystem file type
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:47 -0000

* Pull in latest commit that switches the expected filesystem file type from
  tar.bz2 to tar.gz.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 96df155..4e63986 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
-SRCREV = "b7d67ebb3c3267248210e2e66b1bad273747f9b6"
+SRCREV = "49b4f5b891a4bb96990924ce6431e0c01f9f25d4"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.7.0.4


