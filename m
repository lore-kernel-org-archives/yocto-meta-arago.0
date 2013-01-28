Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by arago-project.org (Postfix) with ESMTPS id E222452A62
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:34 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id ni5so1759539obc.26
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=o7nE3e6HOealRDYpbmOza+LinQHnIbb7qVVV5hl2z2w=;
	b=TdpJh81skmMHE7SqyBPUpGjTI/StgrQxu9GwSE/BHj9Fx3XO1WmHNqRSsbFZDAZvkX
	SpLeZak8GpCEQ8wEw78+LijEbnS8ewUn1YiGYjqB7N2FstU983875Qx2BojnaltoYa6N
	8PHViKl71WPDPYRpyrRPRFdF8U9fCzBu1m7J4TK/XL1wy0A/l38IcHas7eYcK6oY4Wbw
	8WZPB+hIvxszqYikS+4C8hNmpav8i8/u4UmMJ8njMzzJV3YO6v5m6bHzneP6J9AaF10a
	yYUfv99Zms6EZAFPhrHeOc1GVkbOkJ66btAkIkFzYpYcpO7ZxM+EpE5aJGVmreespeTU
	PSVw==
X-Received: by 10.60.171.76 with SMTP id as12mr11731422oec.107.1359393994444; 
	Mon, 28 Jan 2013 09:26:34 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:33 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:31 -0600
Message-Id: <1359393932-31361-31-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 31/32] meta-toolchain-arago: Remove remaining .la files
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:35 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* The following .la files were not deleted from the toolchain sdk:
    libgfortranbegin.la
    /arago-2012.12/lib/gcc/arm-arago-linux-gnueabi/4.5.3

    libbfd.la
    /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib

    libopcodes.la
    /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib

* Updating the path that find is using to insure all .la files are deleted
  from the toolchain sdk.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 332fe48..7428001 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r14"
+PR = "r15"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -84,7 +84,7 @@ populate_sdk_ipk_append () {
 	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub ${TARGET_PREFIX}gdb yes', d)}
 
 	# Remove broken .la files
-	for i in `find ${SDK_OUTPUT}/${SDKTARGETSYSROOT} -name \*.la`; do
+	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
 		rm -f $i
 	done
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
-- 
1.7.0.4


