Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by arago-project.org (Postfix) with ESMTPS id 31ED9529A4
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 11:24:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so121404pfr.5
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zIZVZNlLkud69y8kb3APgeVjfqhRqsf1kAT6UwSQbzs=;
	b=FacS2j+qeM6Q9q42269aA3nCka/dqXFQDc7P+pWpfIzRAGynqkwJwuXTwti+QhNlEO
	nhfvXspz04ezmRZ0WHXurmL/qAmOPanWfRzaC/CdhN79AIYqOumPj+o7frzfuJI5tkCG
	RZFDnAgeJh7GZi/Qj+D1fRaWxsaQulOshkKl8ZZ33iHPsCLtzYjiQyqZcq1/WCSXRZYv
	qMZUQBGkpxDEBMM3wKwEjSZvw5M6HhM8vLaRU69WqPCiyYQ1KBqVAB1YvLAF0RsLYVHR
	xv3TMKlPkEOxROiMpC4aWl13jhzC0RG3ElguaFdUycUzq2Jts4T54mY3D5jALpDEUYz9
	W8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zIZVZNlLkud69y8kb3APgeVjfqhRqsf1kAT6UwSQbzs=;
	b=l2Dv7gr0udqabPdmhNDC9p5oojmbA0tHUdKHQLxW2OSnlyFZ73Amuznza/5JHdcLYQ
	zOn2g5yjimjgHOTuZjmMGxn8IpswS2+Rv7oSCFEBMEtpKj5przw+HHyhffqa5smIECZ3
	FXev+04Dkx/rdX72CjRtTH6DDnm+QSw0Nr3kZh3uJKgQOwLj+7hd86XZ6SMazvol+gRg
	mwmJDMKfbDMG7wEkCn1kmzMlkndPti5JSdl7oe1OjqBks/51iG3p81oThJh2Z9OvCjEg
	ncab64EJlqwnZrJnF6lyW57cnO1BdU47n1fJJ4x+3PK8GnmJ/sWrBRIV8floer3p3BpQ
	TrQw==
X-Gm-Message-State: AHYfb5iUmJi5EzNuM/5c3HHudVaA5+UM+SqAJft7PWG1buyFK0LeU4aO
	+Lta3ErNMqi+Ao4I
X-Received: by 10.98.192.20 with SMTP id x20mr231896pff.146.1503919448264;
	Mon, 28 Aug 2017 04:24:08 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-96.flip.co.nz.
	[103.224.128.96]) by smtp.gmail.com with ESMTPSA id
	u83sm325664pfd.159.2017.08.28.04.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 04:24:07 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 28 Aug 2017 23:23:56 +1200
Message-Id: <1503919436-29891-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [master][PATCH] qt_env: Update Qt environment variables for ti33x
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
X-List-Received-Date: Mon, 28 Aug 2017 11:24:09 -0000

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 8f47083..b804fe2 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -1,5 +1,6 @@
 #!/bin/sh
 
 ### QT Environment Variables ###
-export QT_QPA_GENERIC_PLUGINS=Auto
-export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
+export QT_QPA_GENERIC_PLUGINS=tslib
+export QT_QPA_EGLFS_TSLIB=1
+export QT_QPA_EGLFS_DISABLE_INPUT=1
-- 
2.7.4


