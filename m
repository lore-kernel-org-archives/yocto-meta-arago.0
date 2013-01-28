Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id 8FD2352A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:27 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so2205172oag.39
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Z8sIxFClQHxsg97aWSw0P3qwkd0NEgmxBdUQcHWJbR4=;
	b=RSQdkIEpvHsu5e8SBUHCaZx2/aN6pssB/icKiK9QqVKE1ItT8Xlsc4eGk6zswbe3+s
	5rfofWwDEffJO9b07It2pP6kWt/agYXBFsUtT2iyveyWdTSad6+VbuK50YdpaDGD9oXH
	bqmIZlt3GhqqqAorLAEdvM9NGL7m66E94ydYlaOlxPxPfVfBU7P1wwZ9EnrKgzbJTbdo
	7pg0r8+2cWQrLuAvNjvI4eCs9YnCyRNkQzZlTTkP39+YDchM10GseDKNOLJPXfmnd1E6
	0Sjx3c/MPzH9TuEUJg+F+VtMybnB32tJy2Ln8G7nNgSHxEWShg4/cUZgK3BKU+nLi0gr
	3Q9g==
X-Received: by 10.60.171.76 with SMTP id as12mr11731080oec.107.1359393986959; 
	Mon, 28 Jan 2013 09:26:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.25
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:25 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:27 -0600
Message-Id: <1359393932-31361-27-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 27/32] matrix-gui-apps-git.inc: Pull in latest power management script
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:27 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Pull in updated warnonpm.sh file that allows power management demos to run
  even if a invalid/buggy CPLD firmware is being used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 3f69d35..823f0e7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "06b699311af0729eb327563f2e0b35570932a990"
+SRCREV = "4a5a56fff71ff83880204eac43514f686e251de6"
 BRANCH = "master"
-INC_PR = "r9"
+INC_PR = "r10"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


