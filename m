Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id 6A6A252A1C
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:45 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1138899obc.34
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cWMH3v+f2+c5EDiKPomTXMf0b9UiGPo1NcBsgwlwbDA=;
	b=aLcG1GW01gYxrw4WmtM10VM5R5/txHL7W/ob5LE8O87DPilPAH4jeQTCJe8+8CD9dM
	Bybx87DODq8q0r8xPiGiXp9khZhc6RCGvlVm5uXLRlHR+483tQOnVGnVU0kmTeJIRess
	Tg93mKBcKbEPPjxrM3T51AqJv04GYW6dIupAMYglvZ6aaplZtOOMDZuZWNjbIjiVI+ky
	Hg/i5QQWHgPBkaO5r/AjO9gYCK/zTDyg/5hnDxxXH3PNBzeJunbJ6FCse3sGkTWyPdZF
	BzFmEuYrtX7/5CYMd98XBz3ooKgq744V+mmZ5A20OwKjoW9TNhGVo7KSvEMz2XJXx3/7
	zrPA==
X-Received: by 10.182.39.38 with SMTP id m6mr1522744obk.90.1359037304750;
	Thu, 24 Jan 2013 06:21:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:43 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:14 -0600
Message-Id: <1359037281-12610-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 40/47] meta-toolchain-arago: Substitute dirname statement
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:45 -0000

* On 32bit systems, the dirname statement sometimes return an empty string.
* Replace dirname with several statements that provide the same result.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index a9d07b6..332fe48 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r13"
+PR = "r14"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -59,7 +59,12 @@ toolchain_create_sdk_env_script () {
 create_shell_stub () {
 	i=$1
 	mv $i $i.real
-	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirname \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > $i
+	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
+	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
+	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
+	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
+	printf "fi\n" >> $i
+
 	if [ "$2" == "yes" ]; then
 		echo 'export PYTHONHOME=$SDK_PATH' >> $i
 		echo 'export PYTHONPATH=lib/python2.7' >> $i
-- 
1.7.0.4


