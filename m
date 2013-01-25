Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id 10D0552A6C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:34 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1037693obq.21
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/8tLMnnppVhyAxVoYeX1CR8uxFSqSvZ7wMXnfjodxxc=;
	b=QxRyK9dPx8fz+N0WU7e2Ok7BLhJtis17v6y8esEzTZ0Tp06KTTo3lPefb03pTYqvLG
	cYrdfYDKVjsBsNmugDnZBC+R2JkN3d8jHSrmPsIQ9tDvb3otw1Wboe9V7NghY0F5hHnG
	2a9wBIYl8jrpbpjP21Musm00fYURldMopRCm43YMrLoThc1Su2xfnZ3b0ZAIqOskW3fR
	VMeqn2vh0um72YRXqmQKNhCduo/vDTl1KCsMuTHX8ZL4X35uU2xNQMGBkyTEngAXQ7cz
	a9GOou19jY4w9tdQVKpFuC/GlOdb+CHMRvgvCEvR9Jn5lBdqM7yVkqDHbcbqKpE9I99r
	trgg==
X-Received: by 10.60.27.199 with SMTP id v7mr5672672oeg.23.1359151113522;
	Fri, 25 Jan 2013 13:58:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:32 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:00 -0600
Message-Id: <1359150851-23602-19-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 20/31] wifi-direct-demo: add license info
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:34 -0000

From: Eyal Reizer <eyalr@ti.com>

Add GPLv2 license file

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 1db1043..79d1dcc 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "Wifi Direct Demo"
 SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://src/main.cpp;md5=cf285050f56a20d116b026c9f8ded4f7"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH = "master"
-SRCREV = "9041d6052b43a38e3f06a474822f3f7382bf14a5"
+SRCREV = "1d41618cded6d82b285e14b85b59f3320fb22469"
 
 SRC_URI = "git://www.github.com/TI-ECS/wifi-direct-demo.git;protocol=git;branch=${BRANCH} \
            file://wifi-direct-demo.desktop"
-- 
1.7.0.4


