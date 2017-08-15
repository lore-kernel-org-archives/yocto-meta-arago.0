Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by arago-project.org (Postfix) with ESMTPS id 30CF352093
	for <meta-arago@arago-project.org>;
	Tue, 15 Aug 2017 07:44:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 83so416462pgb.4
	for <meta-arago@arago-project.org>;
	Tue, 15 Aug 2017 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LnLU3BGGJ1RtMTefpjq5qJTPvvBhRSyXN3TtI5oZPWc=;
	b=cNo6CPha94GUhFtwA/KkWbnWBakrUDUxP2he4PqQtdI5Yrb7fFHsl9j3lATUAgqGBc
	hXFqWk+nCASSrAryfCaTtjbYLNN3GCw8DGjErr9daPtYsUqVSXZnn6KCqj6Jgn6Rd3Y/
	ZuMxe/6kKD0P1DufGtGnzaR7tS230waD7XuY7xG5DP+h79R9kQVFxILvuDKbVlcEzIzO
	Wf8wDbn49+W/kD3foyp3vlrd/PfVBEs92TlatjKxEdBhtP+A0e8+bLtUQC5/eNAqMnLN
	Ig357x5TgMYuqBR6LjHzfsakylO89v9theFrSpADKwmjAHU1vH7F6oxw6GIx3X2N6V3F
	MuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LnLU3BGGJ1RtMTefpjq5qJTPvvBhRSyXN3TtI5oZPWc=;
	b=PJObDVHHq8y//8Xt4quxqbyV4CtHv+sfmIcvJlFpYSzcrE3mbhAY3oKe1JVHeW+uhI
	gsFSjJJM1zPjbgXN+yzNz4qJelLb0UmgUy8y2O3KsqNubNUW3kTnWbMUAyvhVqoPn2UO
	YUqbpDovRKhjNq5PPX9t5O42NKccTEnyDatVFPgKYIx+MofUYsewcInx0F5KtOwadOVS
	H+klFiTnvTVT5O6vLObjNy4l07CyT2M4vkrvpJCpZzIWlFGiI1yEPYZn5qY8km32NTHj
	Oabf1FwnejVvdpchATRvsbSEj8TtNa0FDvDtz6ktY2vONXde5GZQVRW+obxzkrX44a6b
	ZHKA==
X-Gm-Message-State: AHYfb5jZP41ofCkLgsjTvmwmgMXekAe2axI1Ragrk3uhua2TMmT4d/Hw
	93W6efXUmkpD7PbZ
X-Received: by 10.84.231.131 with SMTP id g3mr30188668plk.283.1502783040497;
	Tue, 15 Aug 2017 00:44:00 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-96.flip.co.nz.
	[103.224.128.96]) by smtp.gmail.com with ESMTPSA id
	l8sm15723666pgu.63.2017.08.15.00.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Aug 2017 00:43:59 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 15 Aug 2017 19:43:41 +1200
Message-Id: <1502783021-4082-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [master][PATCH] packagegroup-arago-qte: Add qtconnectivity module
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
X-List-Received-Date: Tue, 15 Aug 2017 07:44:02 -0000

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index e9d7a3f..fdaac25 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -46,6 +46,7 @@ QT5_ESSENTIALS = "\
     qtvirtualkeyboard-qmlplugins \
     qtwebengine-qmlplugins \
     liberation-fonts \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'qtconnectivity', '', d)} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


