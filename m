Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id 1971952AB8
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:36 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id za17so4854454obc.31
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uqDCZS0ur2utsdaoWFpWBAJtXp2sBgaZRrQ43e9oIkA=;
	b=yLEcaINrYu6Cpw1zTm219xuUKHmDVox654MLtJDKWWQXguYTjDtClq3oK0dJ3mxD61
	BFdYyk2y8NAj+ybwftvB3eR806t5wiNHV8eqiimCgJW/FkZ6GOw0vX5K+hYhai28kzt3
	vF2QkQDW+gOpUMFSiu6Q/aPCoDywf6wKYTLrni792LszpDgJ2Mkuxfx36TZlwhr5CGUf
	jTqrNoHm1LISsyfnKaW0NyBUG1qSjhWdBnWskpxWAnd+oRdPEXACAgoZq+94apBc6uLl
	e2eMpvqFfG34zoO2EtsV3bNpMY2msa4jfV1cx9j83BYuWWeHq+GqGJ1w7WpaFB8pJY4C
	Cm2Q==
X-Received: by 10.60.169.140 with SMTP id ae12mr10340050oec.52.1358632355544; 
	Sat, 19 Jan 2013 13:52:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:34 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:44 -0600
Message-Id: <1358632316-12266-19-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 19/31] battleship: Fix build issue when upgrading qt4
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:36 -0000

From: Eyal Reizer <eyalr@ti.com>

the battleship project was using an auto-generated code file instead of
letting it being generated during the build which caused it to build
with qt4 version 4.7.4 only. This patch fixed this issue.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../battleship/battleship_git.bb                   |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
index c4db5f4..6e6df66 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
@@ -3,15 +3,15 @@ SECTION = "network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://src/kgamecanvas.cpp;beginline=1;endline=25;md5=b4fc9c236e9a19cfaeaca80abbb29032"
 
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-BRANCH = "dbus"
-SRCREV = "644e7d37e982e3f8f3b93b01e115b11a6da161bb"
+BRANCH = "master"
+SRCREV = "c202d2bbc6b1d1b80ee357872cd8329b7f10dca3"
 PR_append = "+gitr${SRCREV}"
 
-SRC_URI = "git://git.profusion.mobi/users/lucas/battleship.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://www.github.com/TI-ECS/battleship.git;protocol=git;branch=${BRANCH} \
            file://battleship.desktop"
 
 require recipes-core/matrix/matrix-gui-paths.inc
@@ -33,7 +33,7 @@ do_install () {
        install -m 644 ${WORKDIR}/battleship.desktop ${D}${MATRIX_APP_DIR}/battleship
 }
 
-PACKAGES += "${PN} matrix-gui-wifi-battleship-demo"
+PACKAGES += "matrix-gui-wifi-battleship-demo"
 
 FILES_${PN} +=" \
 	${bindir}/battleship \
-- 
1.7.0.4


