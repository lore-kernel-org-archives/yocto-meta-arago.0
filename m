Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by arago-project.org (Postfix) with ESMTPS id 04526529E0
	for <meta-arago@arago-project.org>;
	Tue,  9 Jun 2020 10:30:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h5so20685787wrc.7
	for <meta-arago@arago-project.org>;
	Tue, 09 Jun 2020 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ubP+zxX+3ugqwrjzXi9pWwA0Hhqw0pu0DdIsbUv63sE=;
	b=RQ/QDwIBseQ2pDQaRK0bTasbeg/ejd0kQp96UpmkExlZNuuP2IqzrtjLEiblbtWOd2
	VUJBut/qHdh+dYDQM0441doZDd1RGsfCkt+OJmCPJFT+LXqrIT2mKsolVFYilIVUxil7
	2t+3r05QM5ids/9kPNmXS6A63g3zzPvSxyZQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ubP+zxX+3ugqwrjzXi9pWwA0Hhqw0pu0DdIsbUv63sE=;
	b=YLrXRkL4xW5plKB+Rf3s7Ubp+GZBvqRDGDBucZRdFk3dvQLf+hOsntxZOuQJup51ys
	TVPS5BuXdRuKfAFajthlRJP5/7sXY4B2v9AMMIHmlKZAzp0bUqpjtuLXXbvuMqrWZjI2
	cSe+ieOb4QzJVsw61yJ1QxDnEePdPxwwgiXmseVrRVIuBnZJHNZ7mjAulYe5axHOnuAk
	4TDnUQyXLQl/7idPVhBLVbCxTtAfnasS0nObzZbjFTx14JkUvnx6rnCMm+LCG9LKB76W
	5MPWFxgKAQPUSyVjrhPGxtebooiVCF3PkxdkMjeb8qq3HDfbNum81aoug/dNC1FJEGZ9
	h60g==
X-Gm-Message-State: AOAM533kcL9kK0bNSwzs4htMdAojKdhAOSFNpwDpfjOuaCPHGhodVzTK
	+F6UP9oiAd/WyaruabyOm2hrtm39dY1LNA==
X-Google-Smtp-Source: ABdhPJxiZiL22PLSCXAXqzWcSz0MEUI0scxD/QzjId7+xIwGLtVUHlYZVzIK7rhVqaun3fkKGv3C/g==
X-Received: by 2002:a05:6000:114e:: with SMTP id
	d14mr3610740wrx.110.1591698493794; 
	Tue, 09 Jun 2020 03:28:13 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id q4sm2397590wma.47.2020.06.09.03.28.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 09 Jun 2020 03:28:13 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org
Date: Tue,  9 Jun 2020 11:28:08 +0100
Message-Id: <20200609102808.16475-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [master/dunfell][PATCH] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Tue, 09 Jun 2020 10:30:47 -0000
Content-Transfer-Encoding: 8bit

This change fixes the following error seen at parse time when the
meta-arago-distro layer is present but sysvinit is not in
DISTRO_FEATURES:

    ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
    ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
index 2eb2d777..a6e21745 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
@@ -1,3 +1,8 @@
+python __anonymous() {
+    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
+        raise bb.parse.SkipRecipe("sysvinit is not enabled")
+}
+
 require recipes-core/packagegroups/packagegroup-core-boot.bb
 
 PR = "r0"
-- 
2.26.2


