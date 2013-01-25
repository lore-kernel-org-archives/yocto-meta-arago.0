Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id AD58A529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:52 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so1066744oag.0
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qUaQZXbvy1R3kV5J/+GOa/MvRj/qNvxQ/MYCQde1fSU=;
	b=vDP5lLzlDJWz0R1QrgYotwGfYh43A6m9f452j1fK302PTLMMSMZzyWSTQhRAE+WxBD
	Zbbh4fuwN60dWmWrm7DVbYE/5k6mKblOBA1rVYy1njE9cFpibugrPikh83b8WhDixBYz
	/Zi9/JPYaXyU424K//MiyY8jphPBXtMfK/IiTYpR6dd60OQy70CizGTnS9nIp9ql63jG
	ptUNzZ+FH9BRdssv5jAUynNGoX/XuNiR9ssrA+sAnTpUNe6kwtyjGzaVsd8NSQGXZwbD
	xcwEUAV5bbRsupkxvJsBklhZK6GXf8DubxfoOi41kv5dBUO9zt7BLAHCgLAdRwXAAIDs
	t15w==
X-Received: by 10.182.162.66 with SMTP id xy2mr5629886obb.82.1359151131911;
	Fri, 25 Jan 2013 13:58:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:51 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:10 -0600
Message-Id: <1359150851-23602-29-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 30/31] arago-image.inc: Use bash as shell instead of busybox
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:52 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* There is a bug with ash when provided by busybox that results in certain
  commands returning an incorrect value when called from within a script.

Example:
printf '%s' 'franklin' > /dev/null
echo $?

Executing the above statements on the command line prints 0 as expected. But
running the same statements inside of a script prints 1.

* By using bash for the shell the above issue is fixed and so are similar bugs
  that were discovered when a redirect to /dev/null is used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-image.inc            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 1c5c85a..b2e0762 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -15,6 +15,7 @@ ARAGO_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL += " \
 	task-core-boot \
+	bash \
 	${ROOTFS_PKGMANAGE} \
 	${ARAGO_IMAGE_EXTRA_INSTALL} \
 "
-- 
1.7.0.4


