Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id 00EC6529DD
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:23 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n5so2942088oag.17
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PYXagy41KwfInamM2m8efMGgPQs/6t9sUH6zYEIBYvI=;
	b=GWLMCPyUQLJOCKGoxev7vBJ7PpVkdpJHypV+OU7CY9+q51oHN3OFRlLoT2Col8kYbu
	R5HVPf8SznOlWi2Tj5IuMo444LBLSlHqc/ux6H6GBgvsUImmmRgcDsgGfM+CUbYmD66T
	/JV9DEZYeLmg7U4LLR7iEnXWHEX/9QQXJW5BgO9t4K6S4UsLCoSqvkxKf3XMH0MKvNxj
	kGav8tzeIqV2uoxCHPAAZRsQ33YjeUVFf4LFslJYS/KhKs8gl1EKEkx42I1uOLucRnlu
	M6zAEQpAce+4DE7jSW3L0d56oP12XWoauPaaytoy/BEzSODBgm+JRsDquP7C100oAESW
	+P9w==
X-Received: by 10.182.212.99 with SMTP id nj3mr4581266obc.11.1358445203450;
	Thu, 17 Jan 2013 09:53:23 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.21
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:22 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:05 -0600
Message-Id: <1358445195-22441-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/12] arago-source-ipk: Remove libgles-omap3
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:24 -0000

* do_create_srcipk was causing build failures for libgles-omap3.
* Remove libgles-omap3 from the list of packages that have sourceipk enabled
  since it wasn't suppose to be enabled in the first place.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 7a36f1f..312f629 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -262,9 +262,6 @@ CREATE_SRCIPK_pn-ti-audio-soc-example = "1"
 SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example = "audio-soc-example_${PV}"
 SRCIPK_PACKAGE_ARCH_pn-ti-audio-soc-example = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-libgles-omap3 = "1"
-SRCIPK_INSTALL_DIR_pn-libgles-omap3 = "component-sources/graphics-sdk_${PV}"
-
 CREATE_SRCIPK_pn-ti-c6run = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
 SRCIPK_PACKAGE_ARCH_pn-ti-c6run = "${MACHINE_ARCH}"
-- 
1.7.0.4


