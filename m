Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id E48AE52A7D
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:50 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so7005515oag.18
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PpyxIkSPD2H7mhZjqDGKXxO51v3ie3rPFZpHh7cJKtA=;
	b=nmuRJv5LuZMYpdAYT75dOuSkuPqFyO78lsdrMhkMaMcQ5Wvxgw53cComZaJeqV7SnX
	sIvA0HkTdNgV4J4EXoQBkXgnmnOckpXq4Z0xKEGpxWERj7shM3+U7S+/fXnRwKszfdG5
	ZNsSK72Rh+SqlCWCgYNihnvA5ovwvHzIFo+Oys0ML86T9Y+oGfbcSnWMRI0KgE26gJxI
	49Ym9MTa6f3VmxDYvRHlyJGlEM8Yo7wbUHROw1Ez1WljfNFFCtAGEpQXqJBk59O3hrLM
	EkT9mze+qxKo2OPwkkLhKHs1575zQpGEKSXQX0X9wjYCkyLLQ+ud2FiBFsFBJ8D6l6AY
	qWSQ==
X-Received: by 10.60.19.36 with SMTP id b4mr12399868oee.44.1360630010292;
	Mon, 11 Feb 2013 16:46:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:49 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:14 -0600
Message-Id: <1360629979-24789-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/18] board-port-labs: Inherit allarch class.
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:51 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Inherit allarch class which sets PACKAGE_ARCHS = "all" and some other things.
* This fixes a problem where board-port-labs was being rebuilt for every machine

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs_git.bb         |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
index 2c75c65..87a6735 100644
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -6,11 +6,12 @@ DEPENDS += "git-native"
 SRC_URI = "file://LICENSE"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
 
-PACKAGE_ARCH = "all"
+inherit allarch
+
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
 
-PR = "r2"
+PR = "r3"
 
 REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
           git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
-- 
1.7.0.4


