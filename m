Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 619E752AE2
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:32 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n9so1055452oag.13
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PTvfN8Gt9hmvVHmqk3TNXZgbcTr+ja9XuL441NF1Bzs=;
	b=wdZ4HSyUZO0AM3OrUiAYVMsOnEJ72aqb24ilgXnP/YEPYoUcQ9aAkCzM7i9HN4kuXH
	6ZYIuqO9hkJPpMhH8vvnc3IcW3VRKOHoIPC7eFe0xofwk4XWZvS0Gu4P9tihWGTvn+Nt
	CRKlFYIDpbxTgATlL2qe/cOK0Mkm5c9XTXdrznELA0kBfDnflOR9inuWh88+4WJDEqKG
	aAcLGJ6jCmvWb1u/g7aXxKXT0xqxHsGGcP31aokp+Q4pvaPDwq2Ig0oWx4ng1a+eYrob
	gJUTFo7SmQk7hm3gG81F4UsguKRa68xSxTM41TF52UlUL5LenWltl+39jBf5GXwYV3ro
	4tZQ==
X-Received: by 10.60.18.163 with SMTP id x3mr5616130oed.104.1359151111737;
	Fri, 25 Jan 2013 13:58:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:30 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:59 -0600
Message-Id: <1359150851-23602-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 19/31] battleship:update license information
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:33 -0000

From: Eyal Reizer <eyalr@ti.com>

* Add license file to the project

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../battleship/battleship_git.bb                   |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
index 6e6df66..2c8312f 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "Battleship game with wifi direct"
 SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://src/kgamecanvas.cpp;beginline=1;endline=25;md5=b4fc9c236e9a19cfaeaca80abbb29032"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
-PR = "r3"
+PR = "r4"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
 BRANCH = "master"
-SRCREV = "c202d2bbc6b1d1b80ee357872cd8329b7f10dca3"
+SRCREV = "78524080276f5395b91c1d36858522f69f529462"
 PR_append = "+gitr${SRCREV}"
 
 SRC_URI = "git://www.github.com/TI-ECS/battleship.git;protocol=git;branch=${BRANCH} \
-- 
1.7.0.4


