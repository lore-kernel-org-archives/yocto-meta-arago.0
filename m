Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by arago-project.org (Postfix) with ESMTPS id 86A2052ADE
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:21 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wd20so470319obb.23
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5+QQc4ihTgacoO5YTR0jvyTq1R8z8tF8AxAanvwLmHQ=;
	b=CcG47fzJwtviNxUplOFRvvqo4KlhGgxzQO8ew49COVl22PcLddagx8uw8HmceRt3Po
	hBmitN/oV/6WOquFw6qbzjfvFX+XtajEJLCo8dr1hGdZs52ChTjGSSHo0VqT4Uhqdi7u
	fRO5+zu7IoRDr3gogAEq9VP2wIKw4efHJ3igFajgnCYiW6/VGNRyWXHHuv1cz3iANpvR
	PmXfkUHVjxHJeS/jK5vmXBrxPwo4HW8ACaRzvM6JTzhUFQafdF+6WKjbY7JIDOvcRdat
	GqfkG2aaQw3tcBkFxUcTpcPSTi8o5cmZi+MPj4EjnoRMm8rNmT+NavIniQZy6wY3OTQA
	zBdg==
X-Received: by 10.182.88.3 with SMTP id bc3mr5698420obb.8.1359151100865;
	Fri, 25 Jan 2013 13:58:20 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:19 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:53 -0600
Message-Id: <1359150851-23602-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 13/31] matrix-gui-apps-git: update to latest commit
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:21 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Update to the latest commit ID which changes the cryptography
  demos to use the C example programs instead of the openssl
  scripts.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 31fdf42..050ad2b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "24ed8977d232a6d706594a349549f481bd7087a4"
+SRCREV = "e739979100810a09a2157682e9000e40e99edbc3"
 BRANCH = "master"
-INC_PR = "r7"
+INC_PR = "r8"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


