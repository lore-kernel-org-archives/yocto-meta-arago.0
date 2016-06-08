Return-Path: <yesipov@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by arago-project.org (Postfix) with ESMTPS id 0C6D05208C
	for <meta-arago@arago-project.org>;
	Wed,  8 Jun 2016 08:16:41 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s186so79529lfs.2
	for <meta-arago@arago-project.org>;
	Wed, 08 Jun 2016 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iAlD/zcsTm4Ogk+RV1q998mQAdtwTspxK1xKIbrNZKY=;
	b=a8ivZXl6x2uZ+xMuXLI6lVCNdsWONF/QHgdSE9kqy83M+aFfoiGOQIdsvD0OBLCTEP
	BGMe7VJ+hIyaDevzhXO2FwlY3hE59URIUH7ak1e31CC9qDTHYfxhWBSF1/laaPNCmAbs
	XHzxWUMqVfRSE3PL/eLF2fyb34dakZvvxKrTx9REt74ZyFOf5c+hSi5MG0iLcBMMceLX
	ik4iC9nXAStFV0jDEvYlGK+ZJomKfbH2wDtageRBgGyBvLLyUfcZvbGsQkRQETtpgH7z
	gO/9kdRbenWtb+asfHHbKK/9vUED6Hz3BWY4ix/RxVDxGB5UNsKiH29a5aKzjx8LpSRI
	vFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iAlD/zcsTm4Ogk+RV1q998mQAdtwTspxK1xKIbrNZKY=;
	b=LOypv27Nh9xjB9CkKmNvFsnnrFXS/HxWQ3SwB5Oo3nVavr7+LmmPkZg+PpvYk0lpqK
	G/RC4sng7NpWm4GZ2nsJDN4u4WraT/PjSY9Z55s8JzDREGcpAeYjuQzxancf8rc5vPmN
	YWp2KtE0Bt5ujf/hXQHd+9Cw/S8/c1HqriG8JQnhpI0u/WIFFER/tm7kBhvi/FtRljDp
	SuPVrDD7dnSdo+CvVUKDOtQZE2OT1vzty8JndeWe7CMyQNYPu2sJXLWhYoE79dL+CeAX
	OImnHD/CMa9UAhtZRhdT5YjcqoYHTjarnFPq/5UEB9ISjUjORrJ7cqGIVdNkiODUxzxC
	ZWQQ==
X-Gm-Message-State: ALyK8tJT2iZynaSlQDhGyQvDARAVBn7YITheBTCreBoDzTudQIMzjDpkppYPt7mo5aoThw==
X-Received: by 10.46.5.84 with SMTP id 81mr941497ljf.66.1465373799988;
	Wed, 08 Jun 2016 01:16:39 -0700 (PDT)
Received: from nw.d-systems.local ([185.75.190.112])
	by smtp.gmail.com with ESMTPSA id f93sm2014lji.46.2016.06.08.01.16.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 01:16:39 -0700 (PDT)
From: Kirill Esipov <yesipov@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Jun 2016 11:16:19 +0300
Message-Id: <1465373779-26079-1-git-send-email-yesipov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] psplash_git: revert Remove patch
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
X-List-Received-Date: Wed, 08 Jun 2016 08:16:41 -0000

No need to remove patch due to updating psplash in oe-core.

Signed-off-by: Kirill Esipov <yesipov@gmail.com>
---
 meta-arago-distro/recipes-core/psplash/psplash_git.bbappend | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index d354a93..8cbe754 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 # Update which portion of the psplash.h file to use as a checksum. This tweak
 # has already been done in oe-core master
@@ -10,10 +10,6 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 # Updating to latest version of psplash. This is the version used in oe-core master
 SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
 
-# Remove backported patch from oe-core denzil since the SRCREV we are using
-# includes this patch.
-SRC_URI := "${@oe_filter_out('file://psplash_fix_bad_arg_segfault.patch','${SRC_URI}', d)}"
-
 SRC_URI += "file://psplash-18bpp.patch                      \
             file://0003-Updated-configurability.patch.patch \
             file://psplash-poky-img.h                       \
-- 
2.7.4


